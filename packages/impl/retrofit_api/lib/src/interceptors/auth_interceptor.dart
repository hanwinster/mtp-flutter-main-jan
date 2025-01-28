import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.dio,
    required this.refreshDio,
    required this.preferencesDataSource,
  });

  final Dio dio;
  final Dio refreshDio;
  final PreferencesDataSource preferencesDataSource;

  static const int unauthorized = 401;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // For requests that don't need authentication,
    // we don't need to add the token
    if (options.isNotAuthRequest()) {
      options.removeAuthHeader();
      handler.next(options);
      return;
    }

    final accessToken = await preferencesDataSource.getAccessToken() ?? '';
    options.setAuthHeader(accessToken);
    handler.next(options);
  }

  Future<void> _performLogout() async {
    logger.d('Performing logout ...');
    await preferencesDataSource.putAccessToken('');
    await preferencesDataSource.putRefreshToken('');
    await preferencesDataSource.putAuthState(AuthState.loggedOut);
  }

  @override
  Future<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isAuthRequest =
        err.requestOptions.headers.containsKey('Authorization');
    final response = err.response;
    final hasNoResponse = response == null;
    final isUnauthorized = response?.statusCode == unauthorized;

    if (!isAuthRequest || hasNoResponse || !isUnauthorized) {
      return handler.next(err);
    }

    try {
      final response = await _refreshToken(
        refreshToken: await preferencesDataSource.getRefreshToken() ?? '',
      );

      if (response.statusCode == unauthorized) {
        _performLogout();
        throw UnauthorizedApiException('Session expired! Please login again.');
      }

      if (response.statusCode == null || response.statusCode! ~/ 100 != 2) {
        throw DioException(requestOptions: response.requestOptions);
      }

      final data = ApiDataResponse<RefreshTokenResponseRM>.fromJson(
        response.data,
        (json) => RefreshTokenResponseRM.fromJson(json as Map<String, dynamic>),
      ).data;
      final accessToken = data.accessToken ?? '';
      final refreshToken = data.refreshToken ?? '';
      preferencesDataSource.putAccessToken(accessToken);
      preferencesDataSource.putRefreshToken(refreshToken);

      final refreshResponse = await _tryRefresh(
        response: err.response!,
        newToken: accessToken,
      );
      return handler.resolve(refreshResponse);
    } on DioException catch (e) {
      logger.e('DioException: Error refreshing token', e);
      if (e.response?.statusCode == unauthorized) {
        _performLogout();
      }
      return handler.reject(e);
    }
  }

  Future<Response> _refreshToken({
    required String refreshToken,
  }) async {
    refreshDio.options.headers['Authorization'] = 'Bearer $refreshToken';
    refreshDio.options.headers['Content-Type'] = 'application/json';
    refreshDio.options.headers['Accept'] = 'application/json';

    return refreshDio.get('/auth/refresh');
  }

  Future<Response<dynamic>> _tryRefresh({
    required Response<dynamic> response,
    required String newToken,
  }) async {
    dio.options.baseUrl = response.requestOptions.baseUrl;
    response.requestOptions.setAuthHeader(newToken);

    return dio.request<dynamic>(
      response.requestOptions.path,
      cancelToken: response.requestOptions.cancelToken,
      data: response.requestOptions.data,
      onReceiveProgress: response.requestOptions.onReceiveProgress,
      onSendProgress: response.requestOptions.onSendProgress,
      queryParameters: response.requestOptions.queryParameters,
      options: Options(
        method: response.requestOptions.method,
        sendTimeout: response.requestOptions.sendTimeout,
        receiveTimeout: response.requestOptions.receiveTimeout,
        extra: response.requestOptions.extra,
        headers: response.requestOptions.headers,
        responseType: response.requestOptions.responseType,
        contentType: response.requestOptions.contentType,
        validateStatus: response.requestOptions.validateStatus,
        receiveDataWhenStatusError:
            response.requestOptions.receiveDataWhenStatusError,
        followRedirects: response.requestOptions.followRedirects,
        maxRedirects: response.requestOptions.maxRedirects,
        requestEncoder: response.requestOptions.requestEncoder,
        responseDecoder: response.requestOptions.responseDecoder,
        listFormat: response.requestOptions.listFormat,
      ),
    );
  }
}

extension on RequestOptions {
  bool isNotAuthRequest() {
    return !isAuthRequest();
  }

  bool isAuthRequest() {
    return headers['Authorization'] != 'None';
  }

  void setAuthHeader(String token) {
    headers['Authorization'] = 'Bearer $token';
  }

  void removeAuthHeader() {
    headers.remove('Authorization');
  }
}

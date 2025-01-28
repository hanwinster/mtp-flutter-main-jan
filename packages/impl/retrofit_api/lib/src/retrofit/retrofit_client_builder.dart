
import 'package:dio/dio.dart';
import 'package:preferences/preferences.dart';

import '../interceptors/interceptors.dart';
import 'mtp_rest_client.dart';

class RetrofitClientBuilder {
  static const _apiKeyEnvKey = 'API_KEY';

  RetrofitClientBuilder({
    required this.apiBaseUrl,
    required this.interceptors,
    required this.preferencesDataSource,
  });

  final String apiBaseUrl;
  final List<Interceptor> interceptors;
  final PreferencesDataSource preferencesDataSource;
  MtpRestClient? _mtpRestClient;

  final _dioBaseOptions = BaseOptions(
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 120),
    sendTimeout: Duration(seconds: 30),
  );

  final String apiKey = const String.fromEnvironment(_apiKeyEnvKey);

  MtpRestClient get mtpRestClient {
    if (_mtpRestClient == null) {
      final mtpDio = Dio(
        _dioBaseOptions.withHeader(
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final refreshDio = Dio(_dioBaseOptions.copyWith(
        baseUrl: apiBaseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 120),
        sendTimeout: Duration(seconds: 30),
      ));
      refreshDio.interceptors.addAll(List.from(interceptors));

      mtpDio.interceptors.add(
        AuthInterceptor(
          dio: mtpDio,
          refreshDio: refreshDio,
          preferencesDataSource: preferencesDataSource,
        ),
      );
      mtpDio.interceptors.add(LanguageInterceptor(
        preferencesDataSource: preferencesDataSource,
      ));
      mtpDio.interceptors.addAll(List.from(interceptors));

      _mtpRestClient = MtpRestClient(
        mtpDio,
        baseUrl: apiBaseUrl,
      );
    }
    return _mtpRestClient!;
  }
}

extension on BaseOptions {
  BaseOptions withHeader([Map<String, dynamic>? headers]) {
    return BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      headers: headers ?? this.headers,
    );
  }
}
import 'package:base/base.dart';
import 'package:dio/dio.dart';
import 'package:api/api.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<ApiException> networkOrServerException({
  required String errorMessage,
}) async {
  bool hasConnection = await InternetConnectionChecker().hasConnection;
  logger.d('networkOrServerException: hasConnection: $hasConnection');
  if (!hasConnection) {
    return NetworkApiException('No internet connection');
  } else {
    return ServerApiException(errorMessage);
  }
}

Future<T> apiCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return result;
  } on DioException catch (e, s) {
    logger.e('DioException', e, s);
    switch (e.type) {
      case DioExceptionType.cancel:
        throw await networkOrServerException(errorMessage: 'Request cancelled');
      case DioExceptionType.connectionError:
        throw await networkOrServerException(errorMessage: 'Connection error');
      case DioExceptionType.connectionTimeout:
        throw await networkOrServerException(errorMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        throw await networkOrServerException(errorMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        throw await networkOrServerException(errorMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        throw ServerApiException('Bad certificate');
      case DioExceptionType.badResponse:
        final errorResponseData = e.response?.data;
        final statusCode = e.response?.statusCode ?? 500;
        if (statusCode >= 400 &&
            statusCode < 500 &&
            errorResponseData != null) {

          if (statusCode == 401) {
            throw UnauthorizedApiException(
                'Session expired! Please login again.');
          }

          try {
            final errorResponse =
            ApiErrorStatusResponse.fromJson(errorResponseData);
            throw ClientApiException(
              errorResponse.message ?? '',
              errors: errorResponse.errors,
              data: errorResponse.data,
              statusCode: statusCode,
            );
          } on TypeError catch (_) {
            throw ServerApiException('Unknown Parsing Error!');
          }
        } else {
          throw ServerApiException(
              'Unknown Server Error: ${e.response?.statusMessage}');
        }
      case DioExceptionType.unknown:
        throw ServerApiException('Opps! Something went wrong');
    }
  } catch(e, s) {
    logger.e('Exception', e, s);
    throw ServerApiException('Opps! Something went wrong');
  }
}

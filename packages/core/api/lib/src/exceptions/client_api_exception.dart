import 'api_exception.dart';

class ClientApiException extends ApiException {
  const ClientApiException(
    super.message, {
    required this.errors,
    required this.data,
    required this.statusCode,
  });

  final Map<String, String>? errors;
  final dynamic data;
  final int statusCode;
}

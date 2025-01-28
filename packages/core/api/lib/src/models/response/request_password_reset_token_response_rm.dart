import 'package:base/base.dart';

class RequestPasswordResetTokenErrorResponseRM extends Equatable {
  const RequestPasswordResetTokenErrorResponseRM({
    required this.message,
    required this.credentialError,
    required this.isVerified,
    required this.hasUnverifiedStatus,
  });

  factory RequestPasswordResetTokenErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return RequestPasswordResetTokenErrorResponseRM(
      message: message ?? '',
      credentialError: errors?['credential'],
      isVerified: data?['verified'] == 1,
      hasUnverifiedStatus: data?.containsKey('verified') == true,
    );
  }

  final String message;
  final String? credentialError;
  final bool isVerified;
  final bool hasUnverifiedStatus;

  bool get isInvalidCredentials => credentialError != null;

  @override
  List<Object?> get props => [
        message,
        credentialError,
        isVerified,
        hasUnverifiedStatus,
      ];
}

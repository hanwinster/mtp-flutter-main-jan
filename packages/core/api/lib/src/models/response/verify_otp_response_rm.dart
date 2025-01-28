import 'package:base/base.dart';

class VerifyOtpErrorResponseRM extends Equatable {
  const VerifyOtpErrorResponseRM({
    required this.message,
    required this.credentialError,
    required this.otpError,
  });

  factory VerifyOtpErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return VerifyOtpErrorResponseRM(
      message: message ?? '',
      credentialError: errors?['credential'],
      otpError: errors?['otp_code'],
    );
  }

  final String message;
  final String? credentialError;
  final String? otpError;

  @override
  List<Object?> get props => [message, credentialError, otpError];
}

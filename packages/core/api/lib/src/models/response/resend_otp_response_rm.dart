import 'package:base/base.dart';


class ResendOtpErrorResponseRM extends Equatable {
  const ResendOtpErrorResponseRM({
    required this.message,
    required this.credentialError,
  });

  factory ResendOtpErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return ResendOtpErrorResponseRM(
      message: message ?? '',
      credentialError: errors?['credential'],
    );
  }

  final String message;
  final String? credentialError;

  @override
  List<Object?> get props => [
        message,
        credentialError,
      ];
}

import 'package:base/base.dart';


class ResetPasswordErrorResponseRM extends Equatable {
  const ResetPasswordErrorResponseRM({
    required this.message,
    required this.credentialError,
    required this.passwordError,
    required this.confirmPasswordError,
    required this.tokenError,
  });

  factory ResetPasswordErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required Map<String, dynamic>? data,
  }) {
    return ResetPasswordErrorResponseRM(
      message: message ?? '',
      credentialError: errors?['credential'],
      passwordError: errors?['password'],
      confirmPasswordError: errors?['password_confirmation'],
      tokenError: errors?['token'],
    );
  }

  final String message;
  final String? credentialError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? tokenError;

  @override
  List<Object?> get props => [
        message,
        credentialError,
        passwordError,
        confirmPasswordError,
        tokenError,
      ];
}

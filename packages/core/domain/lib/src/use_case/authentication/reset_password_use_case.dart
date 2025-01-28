import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ResetPasswordRequest extends Equatable {
  const ResetPasswordRequest({
    required this.credential,
    required this.password,
    required this.confirmPassword,
    required this.otp,
  });

  final String credential;
  final String password;
  final String confirmPassword;
  final String otp;

  @override
  List<Object?> get props => [
        credential,
        password,
        confirmPassword,
        otp,
      ];
}

abstract class ResetPasswordResult extends Equatable {
  const ResetPasswordResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class ResetPasswordResultSuccess extends ResetPasswordResult {
  const ResetPasswordResultSuccess({
    required String message,
  }) : super(true, message);
}

final class ResetPasswordResultInvalidCredentials extends ResetPasswordResult {
  const ResetPasswordResultInvalidCredentials({
    required String message,
    required this.credentialError,
    required this.passwordError,
    required this.confirmPasswordError,
    required this.otpError,
  }) : super(false, message);

  final String? credentialError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? otpError;

  @override
  List<Object?> get props => [
        super.props,
        credentialError,
        passwordError,
        confirmPasswordError,
        otpError,
      ];
}

class ResetPasswordUseCase {
  ResetPasswordUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();

  final AuthenticationRepository _authenticationRepository;

  Future<ResetPasswordResult> call(ResetPasswordRequest request) async {
    return _authenticationRepository.resetPassword(
      email: request.credential,
      password: request.password,
      confirmPassword: request.confirmPassword,
      otp: request.otp,
    );
  }
}

import 'package:base/base.dart';
import 'package:domain/domain.dart';

class InitiateResetPasswordRequest extends Equatable {
  const InitiateResetPasswordRequest({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

abstract class InitiateResetPasswordResult extends Equatable {
  const InitiateResetPasswordResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class InitiateResetPasswordResultSuccess
    extends InitiateResetPasswordResult {
  const InitiateResetPasswordResultSuccess({
    required String message,
  }) : super(true, message);
}

final class InitiateResetPasswordResultUnverified
    extends InitiateResetPasswordResult {
  const InitiateResetPasswordResultUnverified({
    required String message,
  }) : super(false, message);
}

final class InitiateResetPasswordResultInvalidCredentials
    extends InitiateResetPasswordResult {
  const InitiateResetPasswordResultInvalidCredentials({
    required String message,
    required this.emailError,
  }) : super(false, message);
  final String? emailError;

  @override
  List<Object?> get props => [
        super.props,
        emailError,
      ];
}

final class InitiateResetPasswordResultError
    extends InitiateResetPasswordResult {
  const InitiateResetPasswordResultError({
    required String message,
  }) : super(false, message);
}

class InitiateResetPasswordUseCase {
  InitiateResetPasswordUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();

  final AuthenticationRepository _authenticationRepository;

  Future<InitiateResetPasswordResult> call(
      InitiateResetPasswordRequest request) async {
    return _authenticationRepository.requestResetPassword(
      email: request.email,
    );
  }
}

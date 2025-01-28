import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ChangePasswordRequest extends Equatable {
  const ChangePasswordRequest({
    required this.currentPassword,
    required this.password,
    required this.confirmPassword,
  });

  final String currentPassword;
  final String password;
  final String confirmPassword;

  @override
  List<Object> get props => [currentPassword, password, confirmPassword];
}

abstract class ChangePasswordResult extends Equatable {
  const ChangePasswordResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class ChangePasswordResultSuccess extends ChangePasswordResult {
  const ChangePasswordResultSuccess({
    required String message,
  }) : super(true, message);
}

final class ChangePasswordResultInvalidInput extends ChangePasswordResult {
  const ChangePasswordResultInvalidInput({
    required String message,
    required this.currentPasswordError,
    required this.passwordError,
    required this.confirmPasswordError,
  }) : super(false, message);

  final String? currentPasswordError;
  final String? passwordError;
  final String? confirmPasswordError;

  @override
  List<Object?> get props => [
        currentPasswordError,
        passwordError,
        confirmPasswordError,
      ];
}

class ChangePasswordUseCase {
  ChangePasswordUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();
  final AuthenticationRepository _authenticationRepository;

  Future<ChangePasswordResult> call(ChangePasswordRequest request) async {
    return _authenticationRepository.changePassword(
      currentPassword: request.currentPassword,
      password: request.password,
      confirmPassword: request.confirmPassword,
    );
  }
}

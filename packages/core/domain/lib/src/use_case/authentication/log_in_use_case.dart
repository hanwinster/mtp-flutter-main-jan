import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LoginRequest extends Equatable {
  const LoginRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

abstract class LoginResult extends Equatable {
  const LoginResult(this.isSuccessful,
      this.message,);

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [isSuccessful, message];
}

final class LoginResultSuccess extends LoginResult {
  const LoginResultSuccess({
    required String message,
  }) : super(true, message);
}

final class LoginResultInvalidCredentials extends LoginResult {
  const LoginResultInvalidCredentials({
    required String message,
    required this.usernameError,
    required this.passwordError,
  }) : super(false, message);
  final String? usernameError;
  final String? passwordError;

  @override
  List<Object?> get props =>
      [super.props, usernameError, passwordError];
}

final class LoginResultUnverified extends LoginResult {
  const LoginResultUnverified({
    required String message,
    required this.credential,
  }) : super(false, message);

  final String credential;

  @override
  List<Object> get props => [super.props, credential];
}

class LogInUseCase {
  LogInUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();
  final AuthenticationRepository _authenticationRepository;

  Future<LoginResult> call(LoginRequest request) async {
    return _authenticationRepository.login(
      username: request.username,
      password: request.password,
    );
  }
}

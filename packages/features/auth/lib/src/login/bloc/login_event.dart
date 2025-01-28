part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginUsernameOrEmailChanged extends LoginEvent {
  const LoginUsernameOrEmailChanged(this.usernameOrEmail);

  final String usernameOrEmail;

  @override
  List<Object> get props => [usernameOrEmail];
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LoginResultShown extends LoginEvent {
  const LoginResultShown();
}

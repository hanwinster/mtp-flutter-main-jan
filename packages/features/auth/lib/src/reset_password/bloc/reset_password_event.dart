part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

final class ResetPasswordPasswordChanged extends ResetPasswordEvent {
  const ResetPasswordPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class ResetPasswordConfirmPasswordChanged extends ResetPasswordEvent {
  const ResetPasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

final class ResetPasswordSubmitted extends ResetPasswordEvent {
  const ResetPasswordSubmitted();

  @override
  List<Object> get props => [];
}

final class ResetPasswordResultShown extends ResetPasswordEvent {
  const ResetPasswordResultShown();

  @override
  List<Object> get props => [];
}
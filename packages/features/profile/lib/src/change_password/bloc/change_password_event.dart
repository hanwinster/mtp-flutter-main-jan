part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangePasswordCurrentPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordCurrentPasswordChanged(this.currentPassword,);

  final String currentPassword;

  @override
  List<Object> get props => [currentPassword];
}

class ChangePasswordNewPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordNewPasswordChanged(this.password,);

  final String password;

  @override
  List<Object> get props => [password];
}

class ChangePasswordConfirmPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordConfirmPasswordChanged(this.confirmPassword,);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();

  @override
  List<Object> get props => [];
}
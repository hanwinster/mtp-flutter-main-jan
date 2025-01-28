part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

final class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  const ForgotPasswordEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordSubmitted();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordResultShown extends ForgotPasswordEvent {
  const ForgotPasswordResultShown();

  @override
  List<Object> get props => [];
}
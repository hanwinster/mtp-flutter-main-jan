part of 'login_bloc.dart';

final class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.usernameOrEmailState = const UsernameOrEmailState.unvalidated(),
    this.usernameOrEmailError,
    this.passwordState = const PasswordState.unvalidated(),
    this.passwordError,
    this.formSubmissionStatus = const UiStateInitial(),
  });

  final UsernameOrEmailState usernameOrEmailState;
  final FormFieldValidationError? usernameOrEmailError;
  final PasswordState passwordState;
  final FormFieldValidationError? passwordError;
  final UiState<LoginResult> formSubmissionStatus;

  factory LoginState.empty() {
    return const LoginState();
  }

  @override
  List<Object?> get props =>
      [
        usernameOrEmailState,
        usernameOrEmailError,
        passwordState,
        passwordError,
        formSubmissionStatus,
      ];

  @override
  List<FormzInput> get inputs => [
    usernameOrEmailState,
    passwordState,
  ];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  bool get isFormSubmissionSuccess => formSubmissionStatus is UiStateSuccess;

  LoginState copyWith({
    UsernameOrEmailState? usernameOrEmailState,
    ValueGetter<FormFieldValidationError?>? usernameOrEmailError,
    PasswordState? passwordState,
    ValueGetter<FormFieldValidationError?>? passwordError,
    UiState<LoginResult>? formSubmissionStatus,
  }) {
    return LoginState(
      usernameOrEmailState: usernameOrEmailState ?? this.usernameOrEmailState,
      usernameOrEmailError: usernameOrEmailError != null ? usernameOrEmailError() : this.usernameOrEmailError,
      passwordState: passwordState ?? this.passwordState,
      passwordError: passwordError != null ? passwordError() : this.passwordError,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
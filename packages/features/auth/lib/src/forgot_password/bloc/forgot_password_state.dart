part of 'forgot_password_bloc.dart';

final class ForgotPasswordState extends Equatable with FormzMixin {
  const ForgotPasswordState({
    this.emailState = const EmailState.unvalidated(),
    this.emailError,
    this.formSubmissionStatus = const UiStateInitial(),
  });

  final EmailState emailState;
  final FormFieldValidationError? emailError;
  final UiState<InitiateResetPasswordResult> formSubmissionStatus;


  factory ForgotPasswordState.create() {
    return const ForgotPasswordState();
  }

  @override
  List<Object?> get props => [
    emailState,
    emailError,
    formSubmissionStatus,
  ];

  @override
  List<FormzInput> get inputs => [emailState];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  bool get isFormSubmissionSuccess => formSubmissionStatus is UiStateSuccess;

  bool get isFormSubmissionFailure => formSubmissionStatus is UiStateFailure;

  ForgotPasswordState copyWith({
    EmailState? emailState,
    ValueGetter<FormFieldValidationError?>? emailError,
    UiState<InitiateResetPasswordResult>? formSubmissionStatus,
  }) {
    return ForgotPasswordState(
      emailState: emailState ?? this.emailState,
      emailError: emailError != null ? emailError() : this.emailError,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

}

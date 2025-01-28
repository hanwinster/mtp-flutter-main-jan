part of 'reset_password_bloc.dart';

final class ResetPasswordState extends Equatable with FormzMixin {
  const ResetPasswordState({
    required this.credential,
    required this.otp,
    this.passwordState = const PasswordState.unvalidated(),
    this.passwordError,
    this.confirmPasswordState = const PasswordState.unvalidated(),
    this.confirmPasswordError,
    this.formSubmissionStatus = const UiStateInitial(),
  });

  final String credential;
  final String otp;
  final PasswordState passwordState;
  final FormFieldValidationError? passwordError;
  final PasswordState confirmPasswordState;
  final FormFieldValidationError? confirmPasswordError;
  final UiState<ResetPasswordResult> formSubmissionStatus;

  factory ResetPasswordState.create({
    required String credential,
    required String otp,
  }) {
    return ResetPasswordState(
      credential: credential,
      otp: otp,
    );
  }

  @override
  List<Object?> get props => [
        passwordState,
        passwordError,
        confirmPasswordState,
        confirmPasswordError,
        formSubmissionStatus,
      ];

  @override
  List<FormzInput> get inputs => [
        passwordState,
        confirmPasswordState,
      ];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  bool get isFormSubmissionSuccess => formSubmissionStatus is UiStateSuccess;

  bool get isFormSubmissionFailure => formSubmissionStatus is UiStateFailure;

  ResetPasswordState copyWith({
    String? credential,
    String? otp,
    PasswordState? passwordState,
    ValueGetter<FormFieldValidationError?>? passwordError,
    PasswordState? confirmPasswordState,
    ValueGetter<FormFieldValidationError?>? confirmPasswordError,
    UiState<ResetPasswordResult>? formSubmissionStatus,
  }) {
    return ResetPasswordState(
      credential: credential ?? this.credential,
      otp: otp ?? this.otp,
      passwordState: passwordState ?? this.passwordState,
      passwordError:
          passwordError != null ? passwordError() : this.passwordError,
      confirmPasswordState: confirmPasswordState ?? this.confirmPasswordState,
      confirmPasswordError: confirmPasswordError != null
          ? confirmPasswordError()
          : this.confirmPasswordError,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}

part of 'change_password_bloc.dart';

final class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.currentPasswordState = const PasswordState.unvalidated(),
    this.currentPasswordError,
    this.newPasswordState = const PasswordState.unvalidated(),
    this.newPasswordError,
    this.confirmPasswordState = const PasswordState.unvalidated(),
    this.confirmPasswordError,
    this.formSubmissionUiState = const UiStateInitial(),
  });

  final PasswordState currentPasswordState;
  final FormFieldValidationError? currentPasswordError;
  final PasswordState newPasswordState;
  final FormFieldValidationError? newPasswordError;
  final PasswordState confirmPasswordState;
  final FormFieldValidationError? confirmPasswordError;
  final UiState<String> formSubmissionUiState;

  factory ChangePasswordState.create() {
    return const ChangePasswordState();
  }

  @override
  List<Object?> get props =>
      [
        currentPasswordState,
        currentPasswordError,
        newPasswordState,
        newPasswordError,
        confirmPasswordState,
        confirmPasswordError,
        formSubmissionUiState,
      ];

  ChangePasswordState copyWith({
    PasswordState? currentPasswordState,
    ValueGetter<FormFieldValidationError?>? currentPasswordError,
    PasswordState? newPasswordState,
    ValueGetter<FormFieldValidationError?>? newPasswordError,
    PasswordState? confirmPasswordState,
    ValueGetter<FormFieldValidationError?>? confirmPasswordError,
    UiState<String>? formSubmissionUiState,
  }) {
    return ChangePasswordState(
      currentPasswordState: currentPasswordState ?? this.currentPasswordState,
      currentPasswordError: currentPasswordError != null ? currentPasswordError() : this.currentPasswordError,
      newPasswordState: newPasswordState ?? this.newPasswordState,
      newPasswordError: newPasswordError != null ? newPasswordError() : this.newPasswordError,
      confirmPasswordState: confirmPasswordState ?? this.confirmPasswordState,
      confirmPasswordError: confirmPasswordError != null ? confirmPasswordError() : this.confirmPasswordError,
      formSubmissionUiState:
          formSubmissionUiState ?? this.formSubmissionUiState,
    );
  }
}
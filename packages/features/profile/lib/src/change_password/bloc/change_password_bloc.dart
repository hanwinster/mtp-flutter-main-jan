import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({
    ChangePasswordUseCase? changePasswordUseCase,
  })  : _changePasswordUseCase = changePasswordUseCase ?? getIt(),
        super(const ChangePasswordState()) {
    on<ChangePasswordCurrentPasswordChanged>(_handleCurrentPasswordChanged);
    on<ChangePasswordNewPasswordChanged>(_handlePasswordChanged);
    on<ChangePasswordConfirmPasswordChanged>(_handleConfirmPasswordChanged);
    on<ChangePasswordSubmitted>(_handleSubmitted);
  }

  final ChangePasswordUseCase _changePasswordUseCase;

  Future<void> _handleCurrentPasswordChanged(
    ChangePasswordCurrentPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) async {
    final newValue = PasswordState.newValue(
        state.currentPasswordState, event.currentPassword);
    emit(
      state.copyWith(
        currentPasswordState: newValue,
        currentPasswordError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handlePasswordChanged(
    ChangePasswordNewPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) async {
    final newValue =
        PasswordState.newValue(state.newPasswordState, event.password);
    emit(
      state.copyWith(
        newPasswordState: newValue,
        newPasswordError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleConfirmPasswordChanged(
    ChangePasswordConfirmPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) async {
    final newValue = PasswordState.newValue(
        state.confirmPasswordState, event.confirmPassword);
    emit(
      state.copyWith(
        confirmPasswordState: newValue,
        confirmPasswordError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleSubmitted(
    ChangePasswordSubmitted event,
    Emitter<ChangePasswordState> emit,
  ) async {
    final validatedCurrentPassword =
        PasswordState.validated(state.currentPasswordState.value);
    final validatedNewPassword =
        PasswordState.validated(state.newPasswordState.value);
    final validatedConfirmPassword =
        PasswordState.validated(state.confirmPasswordState.value);

    emit(
      state.copyWith(
        currentPasswordState: validatedCurrentPassword,
        currentPasswordError: () => validatedCurrentPassword.displayError,
        newPasswordState: validatedNewPassword,
        newPasswordError: () => validatedNewPassword.displayError,
        confirmPasswordState: validatedConfirmPassword,
        confirmPasswordError: () => validatedConfirmPassword.displayError,
      ),
    );

    final isValid = [
      validatedCurrentPassword,
      validatedNewPassword,
      validatedConfirmPassword,
    ].every((element) => element.isValid);

    if (!isValid) return;

    if (validatedNewPassword.value != validatedConfirmPassword.value) {
      emit(
        state.copyWith(
          newPasswordError: () => const FormFieldValidationErrorMismatch(),
          confirmPasswordError: () => const FormFieldValidationErrorMismatch(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        formSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _changePasswordUseCase(
        ChangePasswordRequest(
          currentPassword: state.currentPasswordState.value,
          password: state.newPasswordState.value,
          confirmPassword: state.confirmPasswordState.value,
        ),
      );
      if (result.isSuccessful) {
        emit(
          state.copyWith(
            formSubmissionUiState: UiStateSuccess(result.message),
          ),
        );
      } else {
        switch (result) {
          case ChangePasswordResultSuccess():
            logger.e('Expected a failure result but got success.');
            break;
          case ChangePasswordResultInvalidInput():
            emit(
              state.copyWith(
                formSubmissionUiState: UiStateFailure.client(result.message),
                currentPasswordError: () =>
                    result.currentPasswordError?.toFormValidationErrorOrNull(),
                newPasswordError: () =>
                    result.passwordError?.toFormValidationErrorOrNull(),
                confirmPasswordError: () =>
                    result.confirmPasswordError?.toFormValidationErrorOrNull(),
              ),
            );
            break;
        }
      }
    } catch (e, s) {
      logger.e('Error changing password', e, s);
      emit(
        state.copyWith(
          formSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}

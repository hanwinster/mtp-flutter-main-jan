import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';
import 'package:base/base.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({
    required String credential,
    required String otp,
    ResetPasswordUseCase? resetPasswordUseCase,
  })  : _resetPasswordUseCase = resetPasswordUseCase ?? getIt(),
        super(ResetPasswordState.create(
          credential: credential,
          otp: otp,
        )) {
    on<ResetPasswordPasswordChanged>(_handlePasswordChanged);
    on<ResetPasswordConfirmPasswordChanged>(_handleConfirmPasswordChanged);
    on<ResetPasswordSubmitted>(_handleSubmitted);
    on<ResetPasswordResultShown>(_handleResultShown);
  }

  final ResetPasswordUseCase _resetPasswordUseCase;

  FutureOr<void> _handlePasswordChanged(
    ResetPasswordPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final passwordState = PasswordState.newValue(
      state.passwordState,
      event.password,
    );
    emit(
      state.copyWith(
        passwordState: passwordState,
        passwordError: () => passwordState.displayError,
      ),
    );
  }

  FutureOr<void> _handleConfirmPasswordChanged(
    ResetPasswordConfirmPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final confirmPasswordState = PasswordState.newValue(
      state.confirmPasswordState,
      event.confirmPassword,
    );
    emit(
      state.copyWith(
        confirmPasswordState: confirmPasswordState,
        confirmPasswordError: () => confirmPasswordState.displayError,
      ),
    );
  }

  FutureOr<void> _handleSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    final validatedPasswordState =
        PasswordState.validated(state.passwordState.value);
    final validatedConfirmPasswordState =
        PasswordState.validated(state.confirmPasswordState.value);

    emit(
      state.copyWith(
        passwordState: validatedPasswordState,
        passwordError: () => validatedPasswordState.displayError,
        confirmPasswordState: validatedConfirmPasswordState,
        confirmPasswordError: () => validatedConfirmPasswordState.displayError,
      ),
    );

    if (!state.isValid) {
      return;
    }

    if (validatedPasswordState.value != validatedConfirmPasswordState.value) {
      emit(
        state.copyWith(
          passwordError: () => const FormFieldValidationErrorMismatch(),
          confirmPasswordError: () => const FormFieldValidationErrorMismatch(),
        ),
      );
      return;
    }

    await resetPassword(
      emit: emit,
      credential: state.credential,
      password: validatedPasswordState.value,
      confirmPassword: validatedConfirmPasswordState.value,
      otp: state.otp,
    );
  }

  Future<void> resetPassword({
    required Emitter<ResetPasswordState> emit,
    required String credential,
    required String password,
    required String confirmPassword,
    required String otp,
  }) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _resetPasswordUseCase(
        ResetPasswordRequest(
          credential: credential,
          password: password,
          confirmPassword: confirmPassword,
          otp: otp,
        ),
      );

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            formSubmissionStatus: UiStateSuccess(result),
          ),
        );
        return;
      } else {
        await _processResetPasswordErrorResult(
          emit: emit,
          result: result,
        );
      }
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          formSubmissionStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _processResetPasswordErrorResult({
    required Emitter<ResetPasswordState> emit,
    required ResetPasswordResult result,
  }) async {
    switch (result) {
      case ResetPasswordResultSuccess():
        logger.e('Expected error result but got success');
        break;
      case ResetPasswordResultInvalidCredentials():
        emit(
          state.copyWith(
            passwordError: () => result.passwordError.toFormValidationErrorOrNull(),
            confirmPasswordError: () => result.confirmPasswordError.toFormValidationErrorOrNull(),
            formSubmissionStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
    }
  }

  FutureOr<void> _handleResultShown(
    ResetPasswordResultShown event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(formSubmissionStatus: const UiStateInitial()));
  }
}

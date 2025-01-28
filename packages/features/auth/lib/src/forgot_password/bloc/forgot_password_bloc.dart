import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';
import 'package:base/base.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    InitiateResetPasswordUseCase? initiateResetPasswordUseCase,
  })  : _initiateResetPasswordUseCase = initiateResetPasswordUseCase ?? getIt(),
        super(ForgotPasswordState.create()) {
    on<ForgotPasswordEmailChanged>(_handleEmailChanged);
    on<ForgotPasswordSubmitted>(_handleSubmitted);
    on<ForgotPasswordResultShown>(_handleResultShown);
  }

  final InitiateResetPasswordUseCase _initiateResetPasswordUseCase;

  FutureOr<void> _handleEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final emailState = EmailState.newValue(
      state.emailState,
      event.email,
    );
    emit(
      state.copyWith(
        emailState: emailState,
        emailError: () => emailState.displayError,
      ),
    );
  }

  FutureOr<void> _handleSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final validatedEmailState = EmailState.validated(state.emailState.value);

    emit(
      state.copyWith(
        emailState: validatedEmailState,
        emailError: () => validatedEmailState.displayError,
      ),
    );

    if (!state.isValid) {
      return;
    }

    await initiateResetPassword(
      emit: emit,
      email: state.emailState.value,
    );
  }

  Future<void> initiateResetPassword({
    required Emitter<ForgotPasswordState> emit,
    required String email,
  }) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _initiateResetPasswordUseCase(
        InitiateResetPasswordRequest(
          email: email,
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
        await _processInitiateResetPasswordErrorResult(
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

  Future<void> _processInitiateResetPasswordErrorResult({
    required Emitter<ForgotPasswordState> emit,
    required InitiateResetPasswordResult result,
  }) async {
    switch (result) {
      case InitiateResetPasswordResultSuccess():
        logger.e('Expected error result but got success');
        break;
      case InitiateResetPasswordResultInvalidCredentials():
        emit(
          state.copyWith(
            emailError: () =>
                result.emailError.toFormValidationErrorOrNull(),
            formSubmissionStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
      case InitiateResetPasswordResultUnverified():
        emit(
          state.copyWith(
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
    ForgotPasswordResultShown event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(formSubmissionStatus: const UiStateInitial()));
  }
}

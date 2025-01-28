import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    LogInUseCase? loginUseCase,
    FcmTokenUseCase? fcmTokenUseCase,
  })  : _loginUseCase = loginUseCase ?? getIt(),
        super(LoginState.empty()) {
    on<LoginUsernameOrEmailChanged>(_handleUsernameChanged);
    on<LoginPasswordChanged>(_handlePasswordChanged);
    on<LoginSubmitted>(_handleSubmitted);
    on<LoginResultShown>(_handleResultShown);
  }

  final LogInUseCase _loginUseCase;

  FutureOr<void> _handleUsernameChanged(
    LoginUsernameOrEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    final usernameOrEmailState = UsernameOrEmailState.newValue(
      state.usernameOrEmailState,
      event.usernameOrEmail,
    );
    emit(
      state.copyWith(
        usernameOrEmailState: usernameOrEmailState,
        usernameOrEmailError: () => usernameOrEmailState.displayError,
      ),
    );
  }

  FutureOr<void> _handlePasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
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

  FutureOr<void> _handleSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final validatedUsernameOrEmailState =
        UsernameOrEmailState.validated(state.usernameOrEmailState.value);
    final validatedPasswordState =
        PasswordState.validated(state.passwordState.value);

    emit(
      state.copyWith(
        usernameOrEmailState: validatedUsernameOrEmailState,
        usernameOrEmailError: () => validatedUsernameOrEmailState.displayError,
        passwordState: validatedPasswordState,
        passwordError: () => validatedPasswordState.displayError,
      ),
    );

    if (!state.isValid) {
      return;
    }

    await login(
      emit: emit,
      username: state.usernameOrEmailState.value,
      password: state.passwordState.value,
    );
  }

  Future<void> login({
    required Emitter<LoginState> emit,
    required String username,
    required String password,
  }) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _loginUseCase(
        LoginRequest(
          username: username,
          password: password,
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
        await _processLoginErrorResult(
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

  Future<void> _processLoginErrorResult({
    required Emitter<LoginState> emit,
    required LoginResult result,
  }) async {
    switch (result) {
      case LoginResultSuccess():
        logger.e('Expected error result but got success');
        break;
      case LoginResultInvalidCredentials():
        emit(
          state.copyWith(
            usernameOrEmailError: () =>
                result.usernameError.toFormValidationErrorOrNull(),
            passwordError: () =>
                result.passwordError.toFormValidationErrorOrNull(),
            formSubmissionStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
      case LoginResultUnverified():
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
    LoginResultShown event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(formSubmissionStatus: const UiStateInitial()));
  }
}

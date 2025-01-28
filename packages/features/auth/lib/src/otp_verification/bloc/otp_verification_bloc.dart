import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../models/models.dart';

part 'otp_verification_event.dart';

part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  OtpVerificationBloc({
    required OtpVerificationContext verificationContext,
    required String credential,
    VerifyOtpUseCase? verifyOtpUseCase,
    ResendOtpUseCase? resendOtpUseCase,
  })  : _verifyOtpUseCase = verifyOtpUseCase ?? getIt(),
        _resendOtpUseCase = resendOtpUseCase ?? getIt(),
        super(OtpVerificationState.create(
          verificationContext: verificationContext,
          credential: credential,
        )) {
    on<OtpVerificationOtpChanged>(_handleOtpChanged);
    on<OtpVerificationSubmitted>(_handleSubmitted);
    on<OtpVerificationResultShown>(_handleResultShown);

    on<OtpVerificationResendOtpRequested>(_handleOtpRequested);
    on<OtpVerificationResendOtpResultShown>(_handleOtpRequestResultShown);
  }

  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResendOtpUseCase _resendOtpUseCase;

  FutureOr<void> _handleOtpChanged(
    OtpVerificationOtpChanged event,
    Emitter<OtpVerificationState> emit,
  ) async {
    final newValue = OtpState.newValue(state.otpState, event.otp);
    emit(
      state.copyWith(
        otpState: newValue,
        otpError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleSubmitted(
    OtpVerificationSubmitted event,
    Emitter<OtpVerificationState> emit,
  ) async {
    final validatedOtp = OtpState.validated(state.otpState.value);

    emit(
      state.copyWith(
        otpState: validatedOtp,
        otpError: () => validatedOtp.displayError,
      ),
    );

    final isValid = state.isValid;
    if (!isValid) {
      return;
    }

    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _verifyOtpUseCase(
        VerifyOtpRequest(
          otp: state.otpState.value,
          email: state.credential,
          verificationContext: state.verificationContext,
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
        await _processVerifyOtpErrorResult(
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

  Future<void> _processVerifyOtpErrorResult({
    required Emitter<OtpVerificationState> emit,
    required VerifyOtpResult result,
  }) async {
    logger.d('Verify otp error result: $result');
    switch (result) {
      case VerifyOtpResultSuccess():
        logger.e('Expected a failure result but got success.');
        break;
      case VerifyOtpResultInvalidOtp():
        emit(
          state.copyWith(
            otpError: () => result.otpError.toFormValidationErrorOrNull(),
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
    OtpVerificationResultShown event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInitial(),
      ),
    );
  }

  FutureOr<void> _handleOtpRequested(
    OtpVerificationResendOtpRequested event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInitial(),
        otpRequestStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _resendOtpUseCase(
        ResendOtpRequest(
          credential: state.credential,
        ),
      );

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            otpRequestStatus: UiStateSuccess(result),
          ),
        );
        return;
      } else {
        await _processResendOtpErrorResult(
          emit: emit,
          result: result,
        );
      }
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          otpRequestStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _processResendOtpErrorResult({
    required Emitter<OtpVerificationState> emit,
    required ResendOtpResult result,
  }) async {
    switch (result) {
      case ResendOtpResultSuccess():
        logger.e('Expected a failure result but got success.');
        break;
      case ResendOtpResultError():
        emit(
          state.copyWith(
            otpRequestStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
    }
  }

  FutureOr<void> _handleOtpRequestResultShown(
      OtpVerificationResendOtpResultShown event,
      Emitter<OtpVerificationState> emit,
      ) async {
    emit(
      state.copyWith(
        otpRequestStatus: const UiStateInitial(),
      ),
    );
  }
}

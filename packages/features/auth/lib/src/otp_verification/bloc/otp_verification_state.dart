part of 'otp_verification_bloc.dart';

class OtpVerificationState extends Equatable with FormzMixin {
  const OtpVerificationState({
    required this.verificationContext,
    required this.credential,
    this.otpState = const OtpState.unvalidated(),
    this.otpError,
    this.formSubmissionStatus = const UiStateInitial(),
    this.otpRequestStatus = const UiStateInitial(),
  });

  final OtpVerificationContext verificationContext;
  final String credential;
  final OtpState otpState;
  final FormFieldValidationError? otpError;
  final UiState<VerifyOtpResult> formSubmissionStatus;
  final UiState<ResendOtpResult> otpRequestStatus;

  factory OtpVerificationState.create({
    required OtpVerificationContext verificationContext,
    required String credential,
  }) {
    return OtpVerificationState(
      verificationContext: verificationContext,
      credential: credential,
    );
  }

  @override
  List<Object?> get props => [
        verificationContext,
        credential,
        otpState,
        otpError,
        formSubmissionStatus,
        otpRequestStatus,
      ];

  @override
  List<FormzInput> get inputs => [
        otpState,
      ];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  OtpVerificationState copyWith({
    OtpVerificationContext? verificationContext,
    String? credential,
    OtpState? otpState,
    ValueGetter<FormFieldValidationError?>? otpError,
    UiState<VerifyOtpResult>? formSubmissionStatus,
    UiState<ResendOtpResult>? otpRequestStatus,
  }) {
    return OtpVerificationState(
      verificationContext: verificationContext ?? this.verificationContext,
      credential: credential ?? this.credential,
      otpState: otpState ?? this.otpState,
      otpError: otpError != null ? otpError() : this.otpError,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      otpRequestStatus: otpRequestStatus ?? this.otpRequestStatus,
    );
  }
}

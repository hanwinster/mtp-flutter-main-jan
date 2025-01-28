part of 'otp_verification_bloc.dart';

sealed class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();
}

final class OtpVerificationOtpChanged extends OtpVerificationEvent {
  const OtpVerificationOtpChanged(this.otp);

  final String otp;

  @override
  List<Object> get props => [otp];
}

final class OtpVerificationSubmitted extends OtpVerificationEvent {
  const OtpVerificationSubmitted();

  @override
  List<Object?> get props => [];
}

final class OtpVerificationResultShown extends OtpVerificationEvent {
  const OtpVerificationResultShown();

  @override
  List<Object?> get props => [];
}

final class OtpVerificationResendOtpRequested extends OtpVerificationEvent {
  const OtpVerificationResendOtpRequested();

  @override
  List<Object?> get props => [];
}

final class OtpVerificationResendOtpResultShown extends OtpVerificationEvent {
  const OtpVerificationResendOtpResultShown();

  @override
  List<Object?> get props => [];
}
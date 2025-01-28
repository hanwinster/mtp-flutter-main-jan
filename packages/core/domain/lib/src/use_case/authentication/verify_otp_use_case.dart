import 'package:base/base.dart';
import 'package:domain/domain.dart';

enum OtpVerificationContext {
  register,
  login,
  resetPassword,
}

class VerifyOtpRequest extends Equatable {
  const VerifyOtpRequest({
    required this.otp,
    required this.email,
    required this.verificationContext,
  });

  final String otp;
  final String email;
  final OtpVerificationContext verificationContext;

  @override
  List<Object> get props => [otp, email, verificationContext];
}

sealed class VerifyOtpResult extends Equatable {
  const VerifyOtpResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [
        isSuccessful,
        message,
      ];
}

final class VerifyOtpResultSuccess extends VerifyOtpResult {
  const VerifyOtpResultSuccess({required String message})
      : super(true, message);

  @override
  List<Object?> get props => [super.props];
}

final class VerifyOtpResultInvalidOtp extends VerifyOtpResult {
  const VerifyOtpResultInvalidOtp({
    required String message,
    required this.otpError,
  }) : super(false, message);

  final String? otpError;

  @override
  List<Object?> get props => [super.props, otpError];
}

class VerifyOtpUseCase {
  VerifyOtpUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();
  final AuthenticationRepository _authenticationRepository;

  Future<VerifyOtpResult> call(VerifyOtpRequest request) {
    return _authenticationRepository.verifyOtp(
      otp: request.otp,
      email: request.email,
      verificationContext: request.verificationContext,
    );
  }
}



import '../../domain.dart';

abstract class AuthenticationRepository {

  Future<String> getCurrentUserId();

  Stream<AuthState> observeAuthState();

  Future<AuthState> getAuthState();

  Future<LoginResult> login({
    required String username,
    required String password,
  });

  Future<ChangePasswordResult> changePassword({
    required String currentPassword,
    required String password,
    required String confirmPassword,
  });

  Future<RegisterNewUserResult> register({
    required AccountType accountType,
    required UserType userType,
    required String? organization,
    required String? affiliation,
    required String? position,
    required College? college,
    required EducationYear? educationYear,
    required Gender gender,
    required String username,
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneCode,
    required String phoneNumber,
    required List<OtpChannel> otpChannels,
    required Uri? profileImage,
  });

  Future<VerifyOtpResult> verifyOtp({
    required String otp,
    required String email,
    required OtpVerificationContext verificationContext,
  });

  Future<void> logout();

  Future<InitiateResetPasswordResult> requestResetPassword({
    required String email,
  });

  Future<ResetPasswordResult> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String otp,
  });

  Future<ResendOtpResult> resendOtp({
    required String email,
  });

  Future<void> deactivate();
}

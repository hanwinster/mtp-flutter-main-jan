import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultAuthenticationRepository extends AuthenticationRepository {
  DefaultAuthenticationRepository({
    MtpApi? api,
    PreferencesDataSource? preferencesDataSource,
    FcmTokenUseCase? fcmTokenUsecase,
    UserCourseDao? userCourseDao,
  })  : _preferencesDataSource = preferencesDataSource ?? getIt(),
        _fcmTokenUseCase = fcmTokenUsecase ?? getIt(),
        _userCourseDao = userCourseDao ?? getIt(),
        _api = api ?? getIt();

  final MtpApi _api;
  final UserCourseDao _userCourseDao;
  final PreferencesDataSource _preferencesDataSource;
  final FcmTokenUseCase _fcmTokenUseCase;

  @override
  Future<String> getCurrentUserId() async {
    final user = await _preferencesDataSource.getUser();
    return user?.id ?? '';
  }

  @override
  Future<AuthState> getAuthState() => _preferencesDataSource.getAuthState();

  @override
  Stream<AuthState> observeAuthState() =>
      _preferencesDataSource.observeAuthState();

  @override
  Future<VerifyOtpResult> verifyOtp({
    required String otp,
    required String email,
    required OtpVerificationContext verificationContext,
  }) async {
    try {
      if (verificationContext == OtpVerificationContext.register ||
          verificationContext == OtpVerificationContext.login) {
        final response = await _api.verifyOtp(otpCode: otp, credential: email);
        return VerifyOtpResultSuccess(
          message: response.message ?? '',
        );
      }

      if (verificationContext == OtpVerificationContext.resetPassword) {
        final response = await _api.verifyPasswordResetToken(
          credential: email,
          token: otp,
        );
        return VerifyOtpResultSuccess(
          message: response.message ?? '',
        );
      }

      // this should never happen
      logger.e('Unknown verification context: $verificationContext');
      throw const UnknownDomainException();
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = VerifyOtpErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        return VerifyOtpResultInvalidOtp(
          message: errorResponse.message,
          otpError: errorResponse.otpError,
        );
      }

      logger.e('Error', e);
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<LoginResult> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _api.login(username: username, password: password);
      final data = response.data;
      final userRM = response.data.user;

      if (data.isValid && userRM != null) {
        await _preferencesDataSource.putAccessToken(data.accessToken ?? '');
        await _preferencesDataSource.putRefreshToken(data.refreshToken ?? '');
        await _preferencesDataSource.putUser(userRM.toDomainModel());
        await _preferencesDataSource.putAuthState(AuthState.loggedIn);

        String token = await _preferencesDataSource.getFcmToken() ?? '';
        if (token.isNotEmpty) {
          await _fcmTokenUseCase(token);
        }

        return LoginResultSuccess(
          message: response.message ?? '',
        );
      } else {
        // this should never happen
        logger.e('Login response is not valid: $response');
        throw const UnknownDomainException();
      }
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = LoginErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        if (errorResponse.hasUnverifiedStatus && !errorResponse.isVerified) {
          return LoginResultUnverified(
            message: errorResponse.message,
            credential: username,
          );
        }

        if (errorResponse.isInvalidCredentials) {
          return LoginResultInvalidCredentials(
            message: errorResponse.message,
            usernameError: errorResponse.usernameError,
            passwordError: errorResponse.passwordError,
          );
        }

        throw e.toDomainException();
      } else {
        logger.e('Error', e);
        throw e.toDomainException();
      }
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<ChangePasswordResult> changePassword({
    required String currentPassword,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _api.changePassword(
        currentPassword: currentPassword,
        password: password,
        confirmPassword: confirmPassword,
      );
      final data = response.data;

      if (data.isValid) {
        await _preferencesDataSource.putAccessToken('');
        await _preferencesDataSource.putRefreshToken('');
        await _preferencesDataSource.putAuthState(AuthState.loggedOut);

        return ChangePasswordResultSuccess(
          message: response.message ?? '',
        );
      } else {
        // this should never happen
        logger.e('Change password response is not valid: $response');
        throw const UnknownDomainException();
      }
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = ChangePasswordErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        return ChangePasswordResultInvalidInput(
          message: errorResponse.message,
          currentPasswordError: errorResponse.currentPasswordError,
          passwordError: errorResponse.passwordError,
          confirmPasswordError: errorResponse.confirmPasswordError,
        );
      } else {
        logger.e('Error', e);
        throw e.toDomainException();
      }
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
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
  }) async {
    try {
      final payload = NewUserPayload(
        accountType: AccountTypeRM.fromDomainModel(accountType).toJson(),
        userType: UserTypeRM.fromDomainModel(userType).toJson(),
        organization: organization,
        affiliation: affiliation,
        position: position,
        collegeId: college != null ? int.parse(college.id) : null,
        educationYear: educationYear?.id,
        username: username,
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneCode: phoneCode.toIntOrNull(),
        phoneNumber: phoneNumber,
        otpChannels:
            otpChannels.map((e) => OtpChannelRM.fromDomainModel(e)).toList(),
        profileImage: profileImage != null ? File.fromUri(profileImage) : null,
        gender: GenderRM.fromDomainModel(gender),
      );

      final response = await _api.register(payload: payload);
      return RegisterNewUserResultSuccess(
        message: '',
        user: response.toDomainModel(),
      );
    } on ApiException catch (e, s) {
      logger.e('Error', e, s);
      if (e is ClientApiException) {
        final errorResponse = RegisterErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        if (errorResponse.hasUnverifiedStatus && !errorResponse.isVerified) {
          return RegisterNewUserResultUnverified(
              message: errorResponse.message);
        }

        return RegisterNewUserResultInvalidInput(
          message: errorResponse.message,
          accountTypeError: errorResponse.accountTypeError,
          userTypeError: errorResponse.userTypeError,
          organizationError: errorResponse.organizationError,
          affiliationError: errorResponse.affiliationError,
          positionError: errorResponse.positionError,
          collegeIdError: errorResponse.collegeIdError,
          educationYearError: errorResponse.educationYearError,
          usernameError: errorResponse.usernameError,
          fullNameError: errorResponse.fullNameError,
          emailError: errorResponse.emailError,
          passwordError: errorResponse.passwordError,
          confirmPasswordError: errorResponse.confirmPasswordError,
          phoneCodeError: errorResponse.phoneCodeError,
          phoneNumberError: errorResponse.phoneNumberError,
        );
      }
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<InitiateResetPasswordResult> requestResetPassword({
    required String email,
  }) async {
    try {
      final response = await _api.requestPasswordResetToken(credential: email);
      return InitiateResetPasswordResultSuccess(
        message: response.message ?? '',
      );
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = RequestPasswordResetTokenErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        if (errorResponse.hasUnverifiedStatus && !errorResponse.isVerified) {
          return InitiateResetPasswordResultUnverified(
            message: errorResponse.message,
          );
        }

        return InitiateResetPasswordResultInvalidCredentials(
          message: errorResponse.message,
          emailError: errorResponse.credentialError,
        );
      }

      logger.e('Error', e);
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<ResetPasswordResult> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String otp,
  }) async {
    try {
      final response = await _api.resetPassword(
        credential: email,
        password: password,
        confirmPassword: confirmPassword,
        token: otp,
      );

      return ResetPasswordResultSuccess(
        message: response.message ?? '',
      );
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = ResetPasswordErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        return ResetPasswordResultInvalidCredentials(
          message: errorResponse.message,
          credentialError: errorResponse.credentialError,
          passwordError: errorResponse.passwordError,
          confirmPasswordError: errorResponse.confirmPasswordError,
          otpError: errorResponse.tokenError,
        );
      }

      logger.e('Error', e);
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<ResendOtpResult> resendOtp({
    required String email,
  }) async {
    try {
      final response = await _api.resendOtp(
        credential: email,
      );
      return ResendOtpResultSuccess(
        message: response.message ?? '',
      );
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = ResendOtpErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );

        return ResendOtpResultError(
          message: errorResponse.message,
        );
      }

      logger.e('Error', e);
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<void> deactivate() async {
    try {
      final response = await _api
          .deactivate(); // handle the return message , it will return message only
      await _preferencesDataSource.putAuthState(AuthState.loggedOut);
      await _preferencesDataSource.putAccessToken('');
      await _preferencesDataSource.clearUser();
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = ResendOtpErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
          data: e.data,
        );
      }
      logger.e('Error', e);
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('Error', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<void> logout() async {
    await _preferencesDataSource.putAuthState(AuthState.loggedOut);
    await _preferencesDataSource.putAccessToken('');
    await _preferencesDataSource.putRefreshToken('');
    await _preferencesDataSource.clearUser();
    await _userCourseDao.deleteAllEntities();
  }
}

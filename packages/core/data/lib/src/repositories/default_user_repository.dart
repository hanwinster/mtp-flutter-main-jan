import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultUserRepository extends UserRepository {
  DefaultUserRepository({
    PreferencesDataSource? preferencesDataSource,
    MtpApi? api,
  })  : _api = api ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _preferencesDataSource;

  @override
  Future<UpdateUserResult> updateUser({
    required UpdateUserRequest request,
  }) async {
    try {
      final payload = UpdateUserPayload.fromRequest(request);

      final response = await _api.updateUser(payload: payload);
      final user = response.toDomainModel();
      _preferencesDataSource.putUser(user);

      return UpdateUserResultSuccess(
        message: '',
        user: user,
      );
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = UpdateUserErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
        );

        return UpdateUserResultInvalidInput(
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
          phoneCodeError: errorResponse.phoneCodeError,
          phoneNumberError: errorResponse.phoneNumberError,
          otpChannelError: errorResponse.otpChannelError,
        );
      }
      throw e.toDomainException();
    } catch (e, s) {
      logger.e('UpdateUserError', e, s);
      throw const UnknownDomainException();
    }
  }
}

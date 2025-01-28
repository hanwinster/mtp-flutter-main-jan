import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateUserRequest extends Equatable {
  const UpdateUserRequest({
    required this.userType,
    required this.organization,
    required this.affiliation,
    required this.position,
    required this.college,
    required this.educationYear,
    required this.gender,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannel,
    required this.profileImage,
  });

  final UserType userType;
  final String organization;
  final String affiliation;
  final String position;
  final College? college;
  final EducationYear? educationYear;
  final Gender gender;
  final String username;
  final String fullName;
  final String email;
  final String phoneCode;
  final String phoneNumber;
  final OtpChannel otpChannel;
  final Uri? profileImage;

  @override
  List<Object?> get props =>
      [
        userType,
        organization,
        affiliation,
        position,
        college,
        educationYear,
        gender,
        username,
        fullName,
        email,
        phoneCode,
        phoneNumber,
        otpChannel,
        profileImage,
      ];
}

abstract class UpdateUserResult extends Equatable {
  const UpdateUserResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props =>
      [
        isSuccessful,
        message,
      ];
}

final class UpdateUserResultSuccess extends UpdateUserResult {
  const UpdateUserResultSuccess({
    required String message,
    required this.user,
  }) : super(true, message);

  final User user;

  @override
  List<Object> get props => [super.props, user];
}

final class UpdateUserResultInvalidInput extends UpdateUserResult {
  const UpdateUserResultInvalidInput({
    required String message,
    required this.accountTypeError,
    required this.userTypeError,
    required this.organizationError,
    required this.affiliationError,
    required this.positionError,
    required this.collegeIdError,
    required this.educationYearError,
    required this.usernameError,
    required this.fullNameError,
    required this.emailError,
    required this.phoneCodeError,
    required this.phoneNumberError,
    required this.otpChannelError,
  }) : super(false, message);

  final String? accountTypeError;
  final String? userTypeError;
  final String? organizationError;
  final String? affiliationError;
  final String? positionError;
  final String? collegeIdError;
  final String? educationYearError;
  final String? usernameError;
  final String? fullNameError;
  final String? emailError;
  final String? phoneCodeError;
  final String? phoneNumberError;
  final String? otpChannelError;

  @override
  List<Object?> get props =>
      [
        super.props,
        accountTypeError,
        userTypeError,
        organizationError,
        affiliationError,
        positionError,
        collegeIdError,
        educationYearError,
        usernameError,
        fullNameError,
        emailError,
        phoneCodeError,
        phoneNumberError,
      ];
}

final class UpdateUserResultError extends UpdateUserResult {
  const UpdateUserResultError({
    required String message,
  }) : super(false, message);
}

class UpdateUserUseCase {
  final UserRepository _userRepository;

  UpdateUserUseCase({
    UserRepository? userRepository,
  }) : _userRepository = userRepository ?? getIt();

  Future<UpdateUserResult> call(UpdateUserRequest request) {
    return _userRepository.updateUser(request: request);
  }
}

import 'package:base/base.dart';
import 'package:domain/domain.dart';

class RegisterNewUserRequest extends Equatable {
  const RegisterNewUserRequest({
    required this.accountType,
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
    required this.password,
    required this.confirmPassword,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannels,
    required this.profileImage,
  });

  final AccountType accountType;
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
  final String password;
  final String confirmPassword;
  final String phoneCode;
  final String phoneNumber;
  final List<OtpChannel> otpChannels;
  final Uri? profileImage;

  @override
  List<Object?> get props =>
      [
        accountType,
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
        password,
        confirmPassword,
        phoneCode,
        phoneNumber,
        otpChannels,
        profileImage,
      ];
}

abstract class RegisterNewUserResult extends Equatable {
  const RegisterNewUserResult(
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

final class RegisterNewUserResultSuccess extends RegisterNewUserResult {
  const RegisterNewUserResultSuccess({
    required String message,
    required this.user,
  }) : super(true, message);

  final User user;

  @override
  List<Object> get props => [super.props, user];
}

final class RegisterNewUserResultInvalidInput extends RegisterNewUserResult {
  const RegisterNewUserResultInvalidInput({
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
    required this.passwordError,
    required this.confirmPasswordError,
    required this.phoneCodeError,
    required this.phoneNumberError,
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
  final String? passwordError;
  final String? confirmPasswordError;
  final String? phoneCodeError;
  final String? phoneNumberError;

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
        passwordError,
        confirmPasswordError,
        phoneCodeError,
        phoneNumberError,
      ];
}

final class RegisterNewUserResultEmailExists extends RegisterNewUserResult {
  const RegisterNewUserResultEmailExists({
    required String message,
  }) : super(false, message);
}

final class RegisterNewUserResultUnverified extends RegisterNewUserResult {
  const RegisterNewUserResultUnverified({
    required String message,
  }) : super(false, message);
}

class RegisterNewUserUseCase {
  final AuthenticationRepository _authenticationRepository;

  RegisterNewUserUseCase({
    AuthenticationRepository? authenticationRepository,
  }) : _authenticationRepository = authenticationRepository ?? getIt();

  Future<RegisterNewUserResult> call(RegisterNewUserRequest request) {
    return _authenticationRepository.register(
      accountType: request.accountType,
      userType: request.userType,
      organization: request.organization,
      affiliation: request.affiliation,
      position: request.position,
      college: request.college,
      educationYear: request.educationYear,
      gender: request.gender,
      username: request.username,
      fullName: request.fullName,
      email: request.email,
      password: request.password,
      confirmPassword: request.confirmPassword,
      phoneCode: request.phoneCode,
      phoneNumber: request.phoneNumber,
      otpChannels: request.otpChannels,
      profileImage: request.profileImage,
    );
  }
}

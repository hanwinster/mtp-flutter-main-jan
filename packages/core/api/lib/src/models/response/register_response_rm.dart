import 'package:base/base.dart';

class RegisterErrorResponseRM extends Equatable {
  const RegisterErrorResponseRM({
    required this.message,
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
    required this.isVerified,
    required this.hasUnverifiedStatus,
  });

  factory RegisterErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
    required dynamic data,
  }) {
    bool isVerified = false;
    bool hasUnverifiedStatus = false;
    if (data is Map) {
      logger.d('isMap:');
      isVerified = data['verified'] == 1;
      hasUnverifiedStatus = data.containsKey('verified');
    }

    return RegisterErrorResponseRM(
      message: message ?? '',
      accountTypeError: errors?['account_type'],
      userTypeError: errors?['user_type_all'],
      organizationError: errors?['organization'],
      affiliationError: errors?['affiliation'],
      positionError: errors?['position'],
      collegeIdError: errors?['ec_college'],
      educationYearError: errors?['suitable_for_ec_year'],
      usernameError: errors?['username'],
      fullNameError: errors?['name'],
      emailError: errors?['email'],
      passwordError: errors?['password'],
      confirmPasswordError: errors?['password_confirmation'],
      phoneCodeError: errors?['country_code'],
      phoneNumberError: errors?['mobile_no'],
      isVerified: isVerified,
      hasUnverifiedStatus: hasUnverifiedStatus,
    );
  }

  final String message;
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
  final bool isVerified;
  final bool hasUnverifiedStatus;

  @override
  List<Object?> get props => [
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
        isVerified,
        hasUnverifiedStatus,
      ];
}

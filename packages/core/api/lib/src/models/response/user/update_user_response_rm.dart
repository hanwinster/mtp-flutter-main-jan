import 'package:base/base.dart';

class UpdateUserErrorResponseRM extends Equatable {
  const UpdateUserErrorResponseRM({
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
    required this.phoneCodeError,
    required this.phoneNumberError,
    required this.otpChannelError,
  });

  factory UpdateUserErrorResponseRM.create({
    required String? message,
    required Map<String, String>? errors,
  }) {
    return UpdateUserErrorResponseRM(
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
      phoneCodeError: errors?['country_code'],
      phoneNumberError: errors?['mobile_no'],
      otpChannelError: errors?['notification_channels'], //TODO: check []
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
  final String? phoneCodeError;
  final String? phoneNumberError;
  final String? otpChannelError;

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
        phoneCodeError,
        phoneNumberError,
        otpChannelError,
      ];
}

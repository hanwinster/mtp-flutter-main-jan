part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

final class RegisterPageChanged extends RegisterEvent {
  const RegisterPageChanged(this.pageIndex);

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}

final class RegisterAccountTypesFetched extends RegisterEvent {
  const RegisterAccountTypesFetched();

  @override
  List<Object> get props => [];
}

final class RegisterUserTypesFetched extends RegisterEvent {
  const RegisterUserTypesFetched({
    required this.accountType,
  });

  final AccountType accountType;

  @override
  List<Object> get props => [accountType];
}

final class RegisterCollegesFetched extends RegisterEvent {
  const RegisterCollegesFetched();

  @override
  List<Object> get props => [];
}

final class RegisterEducationYearsFetched extends RegisterEvent {
  const RegisterEducationYearsFetched();

  @override
  List<Object> get props => [];
}

final class RegisterAccountTypeChanged extends RegisterEvent {
  const RegisterAccountTypeChanged(this.accountType);

  final AccountType accountType;

  @override
  List<Object> get props => [accountType];
}

final class RegisterUserTypeChanged extends RegisterEvent {
  const RegisterUserTypeChanged(this.userType);

  final UserType userType;

  @override
  List<Object> get props => [userType];
}

final class RegisterOrganizationChanged extends RegisterEvent {
  const RegisterOrganizationChanged(this.organization);

  final String organization;

  @override
  List<Object> get props => [organization];
}

final class RegisterAffiliationChanged extends RegisterEvent {
  const RegisterAffiliationChanged(this.affiliation);

  final String affiliation;

  @override
  List<Object> get props => [affiliation];
}

final class RegisterPositionChanged extends RegisterEvent {
  const RegisterPositionChanged(this.position);

  final String position;

  @override
  List<Object> get props => [position];
}

final class RegisterCollegeChanged extends RegisterEvent {
  const RegisterCollegeChanged(this.college);

  final College college;

  @override
  List<Object> get props => [college];
}

final class RegisterEducationYearChanged extends RegisterEvent {
  const RegisterEducationYearChanged(this.educationYear);

  final EducationYear educationYear;

  @override
  List<Object> get props => [educationYear];
}

final class RegisterGenderChanged extends RegisterEvent {
  const RegisterGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class RegisterFullNameChanged extends RegisterEvent {
  const RegisterFullNameChanged(this.fullName);

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

final class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterConfirmPasswordChanged extends RegisterEvent {
  const RegisterConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

final class RegisterPhoneCodeChanged extends RegisterEvent {
  const RegisterPhoneCodeChanged(this.phoneCode);

  final String phoneCode;

  @override
  List<Object> get props => [phoneCode];
}

final class RegisterPhoneNumberChanged extends RegisterEvent {
  const RegisterPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class RegisterOtpChannelChanged extends RegisterEvent {
  const RegisterOtpChannelChanged(this.otpChannel, this.isChecked);

  final OtpChannel otpChannel;
  final bool isChecked;

  @override
  List<Object> get props => [otpChannel, isChecked];
}

class RegisterProfileImageChanged extends RegisterEvent {
  const RegisterProfileImageChanged(this.imageUrl);

  final Uri? imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}

final class RegisterForm1Submitted extends RegisterEvent {
  const RegisterForm1Submitted();

  @override
  List<Object> get props => [];
}

final class RegisterForm2Submitted extends RegisterEvent {
  const RegisterForm2Submitted();

  @override
  List<Object> get props => [];
}

final class RegisterErrorShown extends RegisterEvent {
  const RegisterErrorShown();

  @override
  List<Object> get props => [];
}

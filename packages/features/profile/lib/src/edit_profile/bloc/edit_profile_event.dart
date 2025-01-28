part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class EditProfileUserFetched extends EditProfileEvent {
  const EditProfileUserFetched();

  @override
  List<Object> get props => [];
}

final class EditProfileUserTypesFetched extends EditProfileEvent {
  const EditProfileUserTypesFetched();

  @override
  List<Object> get props => [];
}

final class EditProfileCollegesFetched extends EditProfileEvent {
  const EditProfileCollegesFetched();

  @override
  List<Object> get props => [];
}

final class EditProfileEducationYearsFetched extends EditProfileEvent {
  const EditProfileEducationYearsFetched();

  @override
  List<Object> get props => [];
}

final class EditProfileUserTypeChanged extends EditProfileEvent {
  const EditProfileUserTypeChanged(this.userType);

  final UserType userType;

  @override
  List<Object> get props => [userType];
}

final class EditProfileOrganizationChanged extends EditProfileEvent {
  const EditProfileOrganizationChanged(this.organization);

  final String organization;

  @override
  List<Object> get props => [organization];
}

final class EditProfileAffiliationChanged extends EditProfileEvent {
  const EditProfileAffiliationChanged(this.affiliation);

  final String affiliation;

  @override
  List<Object> get props => [affiliation];
}

final class EditProfilePositionChanged extends EditProfileEvent {
  const EditProfilePositionChanged(this.position);

  final String position;

  @override
  List<Object> get props => [position];
}

final class EditProfileCollegeChanged extends EditProfileEvent {
  const EditProfileCollegeChanged(this.college);

  final College college;

  @override
  List<Object> get props => [college];
}

final class EditProfileEducationYearChanged extends EditProfileEvent {
  const EditProfileEducationYearChanged(this.educationYear);

  final EducationYear educationYear;

  @override
  List<Object> get props => [educationYear];
}

final class EditProfileGenderChanged extends EditProfileEvent {
  const EditProfileGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class EditProfileUsernameChanged extends EditProfileEvent {
  const EditProfileUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class EditProfileFullNameChanged extends EditProfileEvent {
  const EditProfileFullNameChanged(this.fullName);

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

final class EditProfileEmailChanged extends EditProfileEvent {
  const EditProfileEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class EditProfilePhoneCodeChanged extends EditProfileEvent {
  const EditProfilePhoneCodeChanged(this.phoneCode);

  final String phoneCode;

  @override
  List<Object> get props => [phoneCode];
}

final class EditProfilePhoneNumberChanged extends EditProfileEvent {
  const EditProfilePhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class EditProfileOtpChannelChanged extends EditProfileEvent {
  const EditProfileOtpChannelChanged(this.otpChannel);

  final OtpChannel otpChannel;

  @override
  List<Object> get props => [otpChannel];
}

class EditProfileImageChanged extends EditProfileEvent {
  const EditProfileImageChanged(this.imageUrl);

  final Uri? imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}

final class EditProfileSubmitted extends EditProfileEvent {
  const EditProfileSubmitted();

  @override
  List<Object> get props => [];
}

final class EditProfileErrorShown extends EditProfileEvent {
  const EditProfileErrorShown();

  @override
  List<Object> get props => [];
}
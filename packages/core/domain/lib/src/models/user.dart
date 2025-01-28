import 'package:base/base.dart';
import 'package:domain/domain.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannel,
    required this.gender,
    required this.userType,
    required this.userRoleCode,
    required this.organization,
    required this.affiliation,
    required this.position,
    required this.college,
    required this.educationYears,
    required this.profileImageUrl,
    required this.isEligibleToSubscribe,
    required this.isAlreadySubscribed,
  });

  final String id;
  final String username;
  final String fullName;
  final String email;
  final String phoneCode;
  final String phoneNumber;
  final OtpChannel otpChannel;
  final Gender gender;
  final UserType userType;
  final UserRoleCode userRoleCode;
  final String organization;
  final String affiliation;
  final String position;
  final College? college;
  final List<EducationYear> educationYears;
  final ImageUrl? profileImageUrl;
  final bool isEligibleToSubscribe;
  final bool isAlreadySubscribed;

  String get formattedPhoneNumber => '+$phoneCode $phoneNumber';

  String get avatar => profileImageUrl?.thumbnail ?? '';

  factory User.empty() {
    return User(
      id: '',
      username: '',
      fullName: '',
      email: '',
      phoneCode: '',
      phoneNumber: '',
      otpChannel: OtpChannel.sms,
      gender: Gender.unknown,
      userType: UserType.unknown,
      userRoleCode: UserRoleCode.unknown,
      organization: '',
      affiliation: '',
      position: '',
      college: null,
      educationYears: [],
      profileImageUrl: null,
      isEligibleToSubscribe: false,
      isAlreadySubscribed: false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        username,
        fullName,
        email,
        phoneCode,
        phoneNumber,
        otpChannel,
        gender,
        userType,
        organization,
        affiliation,
        position,
        college,
        educationYears,
        profileImageUrl,
        isEligibleToSubscribe,
        isAlreadySubscribed,
      ];
}

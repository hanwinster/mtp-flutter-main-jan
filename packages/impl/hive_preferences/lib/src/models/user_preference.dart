import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import 'models.dart';
import '../hive_ids.dart';

part 'user_preference.g.dart';

@HiveType(typeId: HiveTypeId.userPreference)
class UserPreference {
  const UserPreference({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannel,
    required this.gender,
    required this.userType,
    required this.organization,
    required this.affiliation,
    required this.position,
    required this.college,
    required this.educationYears,
    required this.profileImageUrl,
    required this.isEligibleToSubscribe,
    required this.isAlreadySubscribed,
    required this.userRoleCode,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String phoneCode;
  @HiveField(5)
  final String phoneNumber;
  @HiveField(6)
  final OtpChannelPreference otpChannel;
  @HiveField(7)
  final GenderPreference gender;
  @HiveField(8)
  final UserTypePreference userType;
  @HiveField(9)
  final String organization;
  @HiveField(10)
  final String affiliation;
  @HiveField(11)
  final String position;
  @HiveField(12)
  final CollegePreference? college;
  @HiveField(13)
  final List<EducationYearPreference> educationYears;
  @HiveField(14)
  final ImageUrlPreference? profileImageUrl;
  @HiveField(15)
  final bool isEligibleToSubscribe;
  @HiveField(16)
  final bool isAlreadySubscribed;
  @HiveField(17)
  final UserRoleCodePreference? userRoleCode;

  static UserPreference fromDomainModel(User user) {
    return UserPreference(
      id: user.id,
      username: user.username,
      fullName: user.fullName,
      email: user.email,
      phoneCode: user.phoneCode,
      phoneNumber: user.phoneNumber,
      otpChannel: OtpChannelPreference.fromDomainModel(user.otpChannel),
      gender: GenderPreference.fromDomainModel(user.gender),
      userType: UserTypePreference.fromDomainModel(user.userType),
      organization: user.organization,
      affiliation: user.affiliation,
      position: user.position,
      college: CollegePreference.fromDomainModelOrNull(user.college),
      educationYears: user.educationYears
          .map((e) => EducationYearPreference.fromDomainModel(e))
          .toList(),
      profileImageUrl: ImageUrlPreference.fromDomainModelOrNull(user.profileImageUrl),
      isEligibleToSubscribe: user.isEligibleToSubscribe,
      isAlreadySubscribed: user.isAlreadySubscribed,
      userRoleCode: UserRoleCodePreference.fromDomainModel(user.userRoleCode),
    );
  }

  User toDomainModel() {
    return User(
      id: id,
      username: username,
      fullName: fullName,
      email: email,
      phoneCode: phoneCode,
      phoneNumber: phoneNumber,
      otpChannel: otpChannel.toDomainModel(),
      gender: gender.toDomainModel(),
      userType: userType.toDomainModel(),
      organization: organization,
      affiliation: affiliation,
      position: position,
      college: college?.toDomainModel(),
      educationYears: educationYears.map((e) => e.toDomainModel()).toList(),
      profileImageUrl: profileImageUrl?.toDomainModel(),
      isEligibleToSubscribe: isEligibleToSubscribe,
      isAlreadySubscribed: isAlreadySubscribed,
      userRoleCode: userRoleCode?.toDomainModel() ?? UserRoleCode.unknown,
    );
  }
}

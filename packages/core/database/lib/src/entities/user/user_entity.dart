import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/converters.dart';

part 'user_entity.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
class UserEntity extends Equatable {

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.gender,
    required this.userType,
    required this.userRoleCode,
    required this.organization,
    required this.affiliation,
    required this.position,
    required this.college,
    required this.educationYears,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannel,
    required this.profileImageUrl,
    required this.isEligibleToSubscribe,
    required this.isAlreadySubscribed,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String fullName;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'gender', unknownEnumValue: GenderEntity.unknown)
  final GenderEntity gender;
  @JsonKey(name: 'user_type', unknownEnumValue: UserTypeEntity.unknown)
  final UserTypeEntity userType;
  @JsonKey(name: 'user_role_code', unknownEnumValue: UserRoleCodeEntity.unknown)
  final UserRoleCodeEntity? userRoleCode;
  @JsonKey(name: 'organization')
  final String organization;
  @JsonKey(name: 'affiliation')
  final String affiliation;
  @JsonKey(name: 'position')
  final String position;
  @JsonKey(name: 'ec_college')
  final CollegeEntity? college;
  @JsonKey(name: 'suitable_for_ec_year')
  final List<EducationYearEntity> educationYears;
  @JsonKey(name: 'country_code')
  final String phoneCode;
  @JsonKey(name: 'mobile_no')
  final String phoneNumber;
  @JsonKey(name: 'notification_channel', unknownEnumValue: OtpChannelEntity.unknown)
  final OtpChannelEntity otpChannel;
  @JsonKey(name: 'profile_images')
  final ImageUrlEntity? profileImageUrl;
  @JsonKey(name: 'is_eligible_to_subscribe')
  final bool isEligibleToSubscribe;
  @JsonKey(name: 'is_already_subscribed')
  final bool isAlreadySubscribed;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  List<Object?> get props =>
      [
        id,
        fullName,
        username,
        email,
        gender,
        userType,
        organization,
        affiliation,
        position,
        college,
        educationYears,
        phoneCode,
        phoneNumber,
        otpChannel,
        profileImageUrl,
        isEligibleToSubscribe,
        isAlreadySubscribed,
      ];

  User toDomainModel() {
    return User(
      id: id,
      username: username,
      fullName: fullName,
      email: email,
      phoneCode: phoneCode.toString(),
      phoneNumber: phoneNumber,
      otpChannel: otpChannel.toDomainModel(),
      gender: gender.toDomainModel(),
      userType: userType.toDomainModel(),
      userRoleCode: userRoleCode?.toDomainModel() ?? UserRoleCode.unknown,
      organization: organization,
      affiliation: affiliation,
      position: position,
      college: college?.toDomainModel(),
      educationYears: educationYears.map((e) => e.toDomainModel()).toList(),
      profileImageUrl: profileImageUrl?.toDomainModel(),
      isEligibleToSubscribe: isEligibleToSubscribe,
      isAlreadySubscribed: isAlreadySubscribed,
    );
  }
}

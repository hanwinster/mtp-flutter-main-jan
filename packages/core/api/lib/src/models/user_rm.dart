import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json/converters/converters.dart';

part 'user_rm.g.dart';

@JsonSerializable(createToJson: false,)
@DateTimeStringConverter()
class UserRM extends Equatable {

  const UserRM({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.gender,
    this.userType,
    this.userRoleCode,
    this.organization,
    this.affiliation,
    this.position,
    this.college,
    this.educationYears,
    this.phoneCode,
    this.phoneNumber,
    this.otpChannel,
    this.profileImageUrl,
    this.isEligibleToSubscribe,
    this.isAlreadySubscribed,
    this.updatedAt,
    this.createdAt,
  });

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? fullName;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'gender', unknownEnumValue: GenderRM.unknown)
  final GenderRM? gender;
  @JsonKey(name: 'user_type', unknownEnumValue: UserTypeRM.unknown)
  final UserTypeRM? userType;
  @JsonKey(name: 'type', unknownEnumValue: UserRoleCodeRM.unknown)
  final UserRoleCodeRM? userRoleCode;
  @JsonKey(name: 'organization')
  final String? organization;
  @JsonKey(name: 'affiliation')
  final String? affiliation;
  @JsonKey(name: 'position')
  final String? position;
  @JsonKey(name: 'college')
  final CollegeRM? college;
  @JsonKey(name: 'years')
  final List<EducationYearRM>? educationYears;
  @JsonKey(name: 'country_code')
  final dynamic phoneCode;
  @JsonKey(name: 'mobile_no')
  final String? phoneNumber;
  @JsonKey(name: 'notification_channel', unknownEnumValue: OtpChannelRM.unknown)
  final OtpChannelRM? otpChannel;
  @JsonKey(name: 'profile_images')
  final ImageUrlRM? profileImageUrl;
  @JsonKey(name: 'is_eligible_to_subscribe')
  final bool? isEligibleToSubscribe;
  @JsonKey(name: 'is_already_subscribed')
  final bool? isAlreadySubscribed;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  factory UserRM.fromJson(Map<String, dynamic> json) => _$UserRMFromJson(json);

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
        updatedAt,
        createdAt,
      ];

  User toDomainModel() {
    return User(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      username: username ?? '',
      fullName: fullName ?? '',
      email: email ?? '',
      phoneCode: phoneCode?.toString() ?? '',
      phoneNumber: phoneNumber ?? '',
      otpChannel: otpChannel?.toDomainModel() ?? OtpChannel.unknown,
      gender: gender?.toDomainModel() ?? Gender.unknown,
      userType: userType?.toDomainModel() ?? UserType.unknown,
      userRoleCode: userRoleCode?.toDomainModel() ?? UserRoleCode.unknown,
      organization: organization ?? '',
      affiliation: affiliation ?? '',
      position: position ?? '',
      college: college?.toDomainModel(),
      educationYears: educationYears?.map((e) => e.toDomainModel()).toList() ?? [],
      profileImageUrl: profileImageUrl?.toDomainModel(),
      isEligibleToSubscribe: isEligibleToSubscribe ?? false,
      isAlreadySubscribed: isAlreadySubscribed ?? false,
    );
  }
}

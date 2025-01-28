// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String,
      fullName: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      gender: GenderEntity.fromJson(json['gender'] as String),
      userType: UserTypeEntity.fromJson(json['user_type'] as String),
      userRoleCode: json['user_role_code'] == null
          ? null
          : UserRoleCodeEntity.fromJson(json['user_role_code'] as String),
      organization: json['organization'] as String,
      affiliation: json['affiliation'] as String,
      position: json['position'] as String,
      college: json['ec_college'] == null
          ? null
          : CollegeEntity.fromJson(json['ec_college'] as Map<String, dynamic>),
      educationYears: (json['suitable_for_ec_year'] as List<dynamic>)
          .map((e) => EducationYearEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneCode: json['country_code'] as String,
      phoneNumber: json['mobile_no'] as String,
      otpChannel:
          OtpChannelEntity.fromJson(json['notification_channel'] as String),
      profileImageUrl: json['profile_images'] == null
          ? null
          : ImageUrlEntity.fromJson(
              json['profile_images'] as Map<String, dynamic>),
      isEligibleToSubscribe: json['is_eligible_to_subscribe'] as bool,
      isAlreadySubscribed: json['is_already_subscribed'] as bool,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.fullName,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender.toJson(),
      'user_type': instance.userType.toJson(),
      'user_role_code': instance.userRoleCode?.toJson(),
      'organization': instance.organization,
      'affiliation': instance.affiliation,
      'position': instance.position,
      'ec_college': instance.college?.toJson(),
      'suitable_for_ec_year':
          instance.educationYears.map((e) => e.toJson()).toList(),
      'country_code': instance.phoneCode,
      'mobile_no': instance.phoneNumber,
      'notification_channel': instance.otpChannel.toJson(),
      'profile_images': instance.profileImageUrl?.toJson(),
      'is_eligible_to_subscribe': instance.isEligibleToSubscribe,
      'is_already_subscribed': instance.isAlreadySubscribed,
    };

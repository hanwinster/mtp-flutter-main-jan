// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRM _$UserRMFromJson(Map<String, dynamic> json) => UserRM(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] == null
          ? null
          : GenderRM.fromJson(json['gender'] as String),
      userType: json['user_type'] == null
          ? null
          : UserTypeRM.fromJson(json['user_type'] as String),
      userRoleCode: json['type'] == null
          ? null
          : UserRoleCodeRM.fromJson(json['type'] as String),
      organization: json['organization'] as String?,
      affiliation: json['affiliation'] as String?,
      position: json['position'] as String?,
      college: json['college'] == null
          ? null
          : CollegeRM.fromJson(json['college'] as Map<String, dynamic>),
      educationYears: (json['years'] as List<dynamic>?)
          ?.map((e) => EducationYearRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneCode: json['country_code'],
      phoneNumber: json['mobile_no'] as String?,
      otpChannel: json['notification_channel'] == null
          ? null
          : OtpChannelRM.fromJson(json['notification_channel'] as String),
      profileImageUrl: json['profile_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['profile_images'] as Map<String, dynamic>),
      isEligibleToSubscribe: json['is_eligible_to_subscribe'] as bool?,
      isAlreadySubscribed: json['is_already_subscribed'] as bool?,
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
    );

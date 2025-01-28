// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_request_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupRequestResponseRM _$ThematicGroupRequestResponseRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupRequestResponseRM(
      data: json['data'] == null
          ? null
          : JoinResponseUserDataRM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

JoinResponseUserDataRM _$JoinResponseUserDataRMFromJson(
        Map<String, dynamic> json) =>
    JoinResponseUserDataRM(
      id: (json['id'] as num?)?.toInt(),
      tgroupId: (json['tgroup_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      approvedBy: json['approved_by'],
      approvalStatus: (json['approval_status'] as num?)?.toInt(),
      description: json['description'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      userType: json['user_type'] as String?,
      user: json['user'] == null
          ? null
          : JoinResponseUserDetailsRM.fromJson(
              json['user'] as Map<String, dynamic>),
    );

JoinResponseUserDetailsRM _$JoinResponseUserDetailsRMFromJson(
        Map<String, dynamic> json) =>
    JoinResponseUserDetailsRM(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      countryCode: (json['country_code'] as num).toInt(),
      mobileNo: json['mobile_no'] as String,
      notificationChannel: json['notification_channel'] as String,
      userType: json['user_type'] as String,
      ecCollege: json['ec_college'] as String?,
      suitableForEcYear: json['suitable_for_ec_year'] as String?,
      roleId: (json['role_id'] as num).toInt(),
      approved: (json['approved'] as num).toInt(),
      verified: (json['verified'] as num).toInt(),
      blocked: (json['blocked'] as num).toInt(),
      type: json['type'] as String,
      accountType: (json['account_type'] as num).toInt(),
      gender: json['gender'] as String,
      affiliation: json['affiliation'] as String?,
      position: json['position'] as String?,
      organization: json['organization'] as String?,
      subscribeToNewResources:
          (json['subscribe_to_new_resources'] as num).toInt(),
      verificationCode: json['verification_code'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      smsVerifiedAt: json['sms_verified_at'] as String?,
      lastLogin: json['last_login'] as String,
      isUnescoMgr: (json['is_unesco_mgr'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedBy: json['deleted_by'],
      deletedAt: json['deleted_at'],
      fcmToken: json['fcm_token'] as String,
      profileImages: JoinResponseProfileImagesRM.fromJson(
          json['profile_images'] as Map<String, dynamic>),
      years: (json['years'] as List<dynamic>)
          .map((e) => JoinResponseYearRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JoinResponseUserDetailsRMToJson(
        JoinResponseUserDetailsRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'notification_channel': instance.notificationChannel,
      'user_type': instance.userType,
      'ec_college': instance.ecCollege,
      'suitable_for_ec_year': instance.suitableForEcYear,
      'role_id': instance.roleId,
      'approved': instance.approved,
      'verified': instance.verified,
      'blocked': instance.blocked,
      'type': instance.type,
      'account_type': instance.accountType,
      'gender': instance.gender,
      'affiliation': instance.affiliation,
      'position': instance.position,
      'organization': instance.organization,
      'subscribe_to_new_resources': instance.subscribeToNewResources,
      'verification_code': instance.verificationCode,
      'email_verified_at': instance.emailVerifiedAt,
      'sms_verified_at': instance.smsVerifiedAt,
      'last_login': instance.lastLogin,
      'is_unesco_mgr': instance.isUnescoMgr,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt,
      'fcm_token': instance.fcmToken,
      'profile_images': instance.profileImages,
      'years': instance.years,
    };

JoinResponseProfileImagesRM _$JoinResponseProfileImagesRMFromJson(
        Map<String, dynamic> json) =>
    JoinResponseProfileImagesRM(
      original: json['original'] as String,
      thumb: json['thumb'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$JoinResponseProfileImagesRMToJson(
        JoinResponseProfileImagesRM instance) =>
    <String, dynamic>{
      'original': instance.original,
      'thumb': instance.thumb,
      'medium': instance.medium,
      'large': instance.large,
    };

JoinResponseYearRM _$JoinResponseYearRMFromJson(Map<String, dynamic> json) =>
    JoinResponseYearRM(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$JoinResponseYearRMToJson(JoinResponseYearRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

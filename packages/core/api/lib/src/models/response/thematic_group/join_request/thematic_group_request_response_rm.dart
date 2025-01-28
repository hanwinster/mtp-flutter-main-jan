import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_request_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupRequestResponseRM {
  ThematicGroupRequestResponseRM({
    this.data,
  });

  @JsonKey(name: 'data')
  final JoinResponseUserDataRM? data;

  ThematicGroupRequestResponse toDomainModel() {
    return ThematicGroupRequestResponse(
      data: data?.toDomainModel() ?? JoinResponseUserData.empty(),
    );
  }

  factory ThematicGroupRequestResponseRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupRequestResponseRMFromJson(json);
}

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class JoinResponseUserDataRM {
  JoinResponseUserDataRM({
    this.id,
    this.tgroupId,
    this.userId,
    this.approvedBy,
    this.approvalStatus,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.avatar,
    this.userType,
    this.user,
  });

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'tgroup_id')
  final int? tgroupId;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'approved_by')
  final dynamic approvedBy;

  @JsonKey(name: 'approval_status')
  final int? approvalStatus;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'user_type')
  final String? userType;

  @JsonKey(name: 'user')
  final JoinResponseUserDetailsRM? user;

  factory JoinResponseUserDataRM.fromJson(Map<String, dynamic> json) =>
      _$JoinResponseUserDataRMFromJson(json);

  JoinResponseUserData toDomainModel() {
    return JoinResponseUserData(
      id: id ?? (throw Exception('id is null')),
      tgroupId: tgroupId ?? 0,
      userId: userId ?? 0,
      approvedBy: approvedBy,
      approvalStatus: approvalStatus ?? 0,
      description: description,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      name: name ?? '',
      avatar: avatar,
      userType: userType ?? '',
      user: user?.toDomainModel() ?? JoinResponseUserDetails.empty(),
    );
  }
}

@JsonSerializable()
class JoinResponseUserDetailsRM {
  JoinResponseUserDetailsRM({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.countryCode,
    required this.mobileNo,
    required this.notificationChannel,
    required this.userType,
    this.ecCollege,
    this.suitableForEcYear,
    required this.roleId,
    required this.approved,
    required this.verified,
    required this.blocked,
    required this.type,
    required this.accountType,
    required this.gender,
    this.affiliation,
    this.position,
    this.organization,
    required this.subscribeToNewResources,
    required this.verificationCode,
    this.emailVerifiedAt,
    this.smsVerifiedAt,
    required this.lastLogin,
    required this.isUnescoMgr,
    required this.createdAt,
    required this.updatedAt,
    this.deletedBy,
    this.deletedAt,
    required this.fcmToken,
    required this.profileImages,
    required this.years,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'country_code')
  final int countryCode;

  @JsonKey(name: 'mobile_no')
  final String mobileNo;

  @JsonKey(name: 'notification_channel')
  final String notificationChannel;

  @JsonKey(name: 'user_type')
  final String userType;

  @JsonKey(name: 'ec_college')
  final String? ecCollege;

  @JsonKey(name: 'suitable_for_ec_year')
  final String? suitableForEcYear;

  @JsonKey(name: 'role_id')
  final int roleId;

  @JsonKey(name: 'approved')
  final int approved;

  @JsonKey(name: 'verified')
  final int verified;

  @JsonKey(name: 'blocked')
  final int blocked;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'account_type')
  final int accountType;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'affiliation')
  final String? affiliation;

  @JsonKey(name: 'position')
  final String? position;

  @JsonKey(name: 'organization')
  final String? organization;

  @JsonKey(name: 'subscribe_to_new_resources')
  final int subscribeToNewResources;

  @JsonKey(name: 'verification_code')
  final String verificationCode;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  @JsonKey(name: 'sms_verified_at')
  final String? smsVerifiedAt;

  @JsonKey(name: 'last_login')
  final String lastLogin;

  @JsonKey(name: 'is_unesco_mgr')
  final int isUnescoMgr;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'deleted_by')
  final dynamic deletedBy;

  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;

  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  @JsonKey(name: 'profile_images')
  final JoinResponseProfileImagesRM profileImages;

  @JsonKey(name: 'years')
  final List<JoinResponseYearRM> years;

  factory JoinResponseUserDetailsRM.fromJson(Map<String, dynamic> json) =>
      _$JoinResponseUserDetailsRMFromJson(json);

  Map<String, dynamic> toJson() => _$JoinResponseUserDetailsRMToJson(this);

  // Convert to domain model
  JoinResponseUserDetails toDomainModel() {
    return JoinResponseUserDetails(
      id: id,
      name: name,
      username: username,
      email: email,
      countryCode: countryCode,
      mobileNo: mobileNo,
      notificationChannel: notificationChannel,
      userType: userType,
      ecCollege: ecCollege,
      suitableForEcYear: suitableForEcYear,
      roleId: roleId,
      approved: approved,
      verified: verified,
      blocked: blocked,
      type: type,
      accountType: accountType,
      gender: gender,
      affiliation: affiliation,
      position: position,
      organization: organization,
      subscribeToNewResources: subscribeToNewResources,
      verificationCode: verificationCode,
      emailVerifiedAt: emailVerifiedAt,
      smsVerifiedAt: smsVerifiedAt,
      lastLogin: lastLogin,
      isUnescoMgr: isUnescoMgr,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedBy: deletedBy,
      deletedAt: deletedAt,
      fcmToken: fcmToken,
      profileImages: profileImages.toDomainModel(),
      years: years.map((year) => year.toDomainModel()).toList(),
    );
  }
}

@JsonSerializable()
class JoinResponseProfileImagesRM {
  JoinResponseProfileImagesRM({
    required this.original,
    required this.thumb,
    required this.medium,
    required this.large,
  });

  @JsonKey(name: 'original')
  final String original;

  @JsonKey(name: 'thumb')
  final String thumb;

  @JsonKey(name: 'medium')
  final String medium;

  @JsonKey(name: 'large')
  final String large;

  factory JoinResponseProfileImagesRM.fromJson(Map<String, dynamic> json) =>
      _$JoinResponseProfileImagesRMFromJson(json);

  Map<String, dynamic> toJson() => _$JoinResponseProfileImagesRMToJson(this);

  // Convert to domain model
  JoinResponseProfileImages toDomainModel() {
    return JoinResponseProfileImages(
      original: original,
      thumb: thumb,
      medium: medium,
      large: large,
    );
  }
}

@JsonSerializable()
class JoinResponseYearRM {
  JoinResponseYearRM({
    required this.id,
    required this.title,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  factory JoinResponseYearRM.fromJson(Map<String, dynamic> json) =>
      _$JoinResponseYearRMFromJson(json);

  Map<String, dynamic> toJson() => _$JoinResponseYearRMToJson(this);

  // Convert to domain model
  JoinResponseYear toDomainModel() {
    return JoinResponseYear(
      id: id,
      title: title,
    );
  }
}

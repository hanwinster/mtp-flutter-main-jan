import 'package:equatable/equatable.dart';

class ThematicGroupRequestResponse extends Equatable {
  final JoinResponseUserData data;

  const ThematicGroupRequestResponse({
    required this.data,
  });

  // Empty constructor
  ThematicGroupRequestResponse.empty() : data = JoinResponseUserData.empty();

  @override
  List<Object?> get props => [data];
}

class JoinResponseUserData extends Equatable {
  final int id;
  final int tgroupId;
  final int userId;
  final dynamic approvedBy;
  final int approvalStatus;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String name;
  final String? avatar;
  final String userType;
  final JoinResponseUserDetails user;

  const JoinResponseUserData({
    required this.id,
    required this.tgroupId,
    required this.userId,
    this.approvedBy,
    required this.approvalStatus,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.avatar,
    required this.userType,
    required this.user,
  });

  // Empty constructor
  JoinResponseUserData.empty()
      : id = 0,
        tgroupId = 0,
        userId = 0,
        approvedBy = null,
        approvalStatus = 0,
        description = '',
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        name = '',
        avatar = '',
        userType = '',
        user = JoinResponseUserDetails.empty();

  @override
  List<Object?> get props => [
    id,
    tgroupId,
    userId,
    approvedBy,
    approvalStatus,
    description,
    createdAt,
    updatedAt,
    name,
    avatar,
    userType,
    user,
  ];
}

class JoinResponseUserDetails extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final int countryCode;
  final String mobileNo;
  final String notificationChannel;
  final String userType;
  final String? ecCollege;
  final String? suitableForEcYear;
  final int roleId;
  final int approved;
  final int verified;
  final int blocked;
  final String type;
  final int accountType;
  final String gender;
  final String? affiliation;
  final String? position;
  final String? organization;
  final int subscribeToNewResources;
  final String verificationCode;
  final String? emailVerifiedAt;
  final String? smsVerifiedAt;
  final String lastLogin;
  final int isUnescoMgr;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final String fcmToken;
  final JoinResponseProfileImages profileImages;
  final List<JoinResponseYear> years;

  const JoinResponseUserDetails({
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

  // Empty constructor
  JoinResponseUserDetails.empty()
      : id = 0,
        name = '',
        username = '',
        email = '',
        countryCode = 0,
        mobileNo = '',
        notificationChannel = '',
        userType = '',
        ecCollege = null,
        suitableForEcYear = null,
        roleId = 0,
        approved = 0,
        verified = 0,
        blocked = 0,
        type = '',
        accountType = 0,
        gender = '',
        affiliation = null,
        position = null,
        organization = null,
        subscribeToNewResources = 0,
        verificationCode = '',
        emailVerifiedAt = null,
        smsVerifiedAt = null,
        lastLogin = '',
        isUnescoMgr = 0,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        deletedBy = null,
        deletedAt = null,
        fcmToken = '',
        profileImages = const JoinResponseProfileImages.empty(),
        years = [];

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    email,
    countryCode,
    mobileNo,
    notificationChannel,
    userType,
    ecCollege,
    suitableForEcYear,
    roleId,
    approved,
    verified,
    blocked,
    type,
    accountType,
    gender,
    affiliation,
    position,
    organization,
    subscribeToNewResources,
    verificationCode,
    emailVerifiedAt,
    smsVerifiedAt,
    lastLogin,
    isUnescoMgr,
    createdAt,
    updatedAt,
    deletedBy,
    deletedAt,
    fcmToken,
    profileImages,
    years,
  ];
}

class JoinResponseProfileImages extends Equatable {
  final String original;
  final String thumb;
  final String medium;
  final String large;

  const JoinResponseProfileImages({
    required this.original,
    required this.thumb,
    required this.medium,
    required this.large,
  });

  // Empty constructor
  const JoinResponseProfileImages.empty()
      : original = '',
        thumb = '',
        medium = '',
        large = '';

  @override
  List<Object?> get props => [original, thumb, medium, large];
}

class JoinResponseYear extends Equatable {
  final int id;
  final String title;

  const JoinResponseYear({
    required this.id,
    required this.title,
  });

  // Empty constructor
  const JoinResponseYear.empty()
      : id = 0,
        title = '';

  @override
  List<Object?> get props => [id, title];
}

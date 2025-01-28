import 'package:api/api.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension UserRMEntityMapper on UserRM {
  UserEntity toEntity() {
    return UserEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      username: username ?? '',
      fullName: fullName ?? '',
      email: email ?? '',
      phoneCode: phoneCode?.toString() ?? '',
      phoneNumber: phoneNumber ?? '',
      otpChannel: otpChannel?.toEntity() ?? OtpChannelEntity.unknown,
      gender: gender?.toEntity() ?? GenderEntity.unknown,
      userType: userType?.toEntity() ?? UserTypeEntity.unknown,
      userRoleCode: userRoleCode?.toEntity() ?? UserRoleCodeEntity.unknown,
      organization: organization ?? '',
      affiliation: affiliation ?? '',
      position: position ?? '',
      college: college?.toEntity(),
      educationYears: educationYears?.map((e) => e.toEntity()).toList() ?? [],
      profileImageUrl: profileImageUrl?.toEntity(),
      isEligibleToSubscribe: isEligibleToSubscribe ?? false,
      isAlreadySubscribed: isAlreadySubscribed ?? false,
    );
  }
}
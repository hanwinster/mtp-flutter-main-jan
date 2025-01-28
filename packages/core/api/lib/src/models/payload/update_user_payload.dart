import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateUserPayload {
  const UpdateUserPayload({
    required this.accountType,
    required this.userType,
    required this.organization,
    required this.affiliation,
    required this.position,
    required this.collegeId,
    required this.educationYear,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannels,
    required this.gender,
    required this.profileImage,
  });

  final String accountType;
  final String userType;
  final String? organization;
  final String? affiliation;
  final String? position;
  final int? collegeId;
  final String? educationYear;
  final String username;
  final String fullName;
  final String email;
  final int? phoneCode;
  final String? phoneNumber;
  final GenderRM gender;
  final File? profileImage;
  final List<OtpChannelRM> otpChannels;

  factory UpdateUserPayload.fromRequest(UpdateUserRequest request) {
    return UpdateUserPayload(
      accountType:
          AccountTypeRM.fromDomainModel(request.userType.accountType).toJson(),
      userType: UserTypeRM.fromDomainModel(request.userType).toJson(),
      organization: request.organization,
      affiliation: request.affiliation,
      position: request.position,
      collegeId: request.college?.id.toIntOrNull(),
      educationYear: request.educationYear?.id,
      username: request.username,
      fullName: request.fullName,
      email: request.email,
      phoneCode: request.phoneCode.toIntOrNull(),
      phoneNumber: request.phoneNumber,
      otpChannels: [OtpChannelRM.fromDomainModel(request.otpChannel)],
      gender: GenderRM.fromDomainModel(request.gender),
      profileImage: request.profileImage != null ? File.fromUri(request.profileImage!) : null,
    );
  }
}

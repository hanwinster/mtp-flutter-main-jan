import 'dart:io';

import 'package:api/api.dart';

class NewUserPayload {
  const NewUserPayload({
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
    required this.password,
    required this.confirmPassword,
    required this.phoneCode,
    required this.phoneNumber,
    required this.otpChannels,
    required this.profileImage,
    required this.gender,
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
  final String password;
  final String confirmPassword;
  final int? phoneCode;
  final String? phoneNumber;
  final File? profileImage;
  final List<OtpChannelRM> otpChannels;
  final GenderRM gender;
}

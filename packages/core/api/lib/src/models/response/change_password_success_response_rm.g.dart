// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_success_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordSuccessResponseRM _$ChangePasswordSuccessResponseRMFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordSuccessResponseRM(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );

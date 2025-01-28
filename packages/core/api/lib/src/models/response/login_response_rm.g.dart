// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSuccessResponseRM _$LoginSuccessResponseRMFromJson(
        Map<String, dynamic> json) =>
    LoginSuccessResponseRM(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );

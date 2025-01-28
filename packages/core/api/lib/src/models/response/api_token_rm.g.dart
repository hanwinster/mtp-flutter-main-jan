// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiTokenRM _$ApiTokenRMFromJson(Map<String, dynamic> json) => ApiTokenRM(
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

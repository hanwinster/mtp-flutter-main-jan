// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenResponseRM _$FcmTokenResponseRMFromJson(Map<String, dynamic> json) =>
    FcmTokenResponseRM(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserRM.fromJson(json['data'] as Map<String, dynamic>),
    );

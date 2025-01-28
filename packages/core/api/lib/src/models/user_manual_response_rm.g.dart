// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manual_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserManualResponseRM _$UserManualResponseRMFromJson(
        Map<String, dynamic> json) =>
    UserManualResponseRM(
      webUserManuals: (json['web'] as List<dynamic>?)
          ?.map((e) => UserManualRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobileUserManuals: (json['mobile'] as List<dynamic>?)
          ?.map((e) => UserManualRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

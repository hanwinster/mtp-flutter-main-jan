// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manual_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserManualRM _$UserManualRMFromJson(Map<String, dynamic> json) => UserManualRM(
      title: json['title'] as String?,
      link: json['link'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : MediaTypeRM.fromJson(json['type'] as String),
    );

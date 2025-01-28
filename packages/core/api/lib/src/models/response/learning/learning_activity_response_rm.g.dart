// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_activity_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningActivityResponseRM _$LearningActivityResponseRMFromJson(
        Map<String, dynamic> json) =>
    LearningActivityResponseRM(
      learningActivity: json['learning_activity'] == null
          ? null
          : LearningActivityRM.fromJson(
              json['learning_activity'] as Map<String, dynamic>),
      mediaList: (json['learning_activity_media'] as List<dynamic>?)
          ?.map((e) => MediaRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureResponseRM _$LectureResponseRMFromJson(Map<String, dynamic> json) =>
    LectureResponseRM(
      lecture: json['lecture'] == null
          ? null
          : LectureRM.fromJson(json['lecture'] as Map<String, dynamic>),
      quizzes: (json['lecture_quizzes'] as List<dynamic>?)
          ?.map((e) => LearningQuizRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaList: (json['lecture_media'] as List<dynamic>?)
          ?.map((e) => MediaRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCompletionResponse _$UpdateCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCompletionResponse(
      message: json['message'] as String?,
      nextCourseMaterial: json['redirect_to'] == null
          ? null
          : CourseMaterialRM.fromJson(
              json['redirect_to'] as Map<String, dynamic>),
      courseLearner: json['data'] == null
          ? null
          : CourseLearnerRM.fromJson(json['data'] as Map<String, dynamic>),
    );

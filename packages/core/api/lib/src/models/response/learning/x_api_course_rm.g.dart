// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'x_api_course_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XApiCourseRM _$XApiCourseRMFromJson(Map<String, dynamic> json) => XApiCourseRM(
      launchLink: json['launch_link'] as String?,
      completionStatus: json['completion_status'] == null
          ? null
          : XApiCourseCompletionStatusResponse.fromJson(
              json['completion_status'] as Map<String, dynamic>),
    );

XApiCourseCompletionStatusResponse _$XApiCourseCompletionStatusResponseFromJson(
        Map<String, dynamic> json) =>
    XApiCourseCompletionStatusResponse(
      completionStatus: json['registrationCompletion'] == null
          ? null
          : XApiCompletionStatusRM.fromJson(
              json['registrationCompletion'] as String),
    );

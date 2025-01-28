// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseListResponse _$MyCourseListResponseFromJson(
        Map<String, dynamic> json) =>
    MyCourseListResponse(
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

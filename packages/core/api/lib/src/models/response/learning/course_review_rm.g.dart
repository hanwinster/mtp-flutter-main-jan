// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_review_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReviewRM _$CourseReviewRMFromJson(Map<String, dynamic> json) =>
    CourseReviewRM(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      courseId: (json['course_id'] as num?)?.toInt(),
      rating: json['rating'] as num?,
      remark: json['remark'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

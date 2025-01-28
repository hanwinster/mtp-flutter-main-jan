// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_learner_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseLearnerRM _$CourseLearnerRMFromJson(Map<String, dynamic> json) =>
    CourseLearnerRM(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : CourseLearnerStatusRM.fromJson(json['status'] as String),
      percentage: (json['percentage'] as num?)?.toInt(),
      notifyCount: (json['notify_count'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      completed: json['completed'] as List<dynamic>?,
      isReadyToEvaluate: json['is_ready_to_evaluate'] as bool?,
      isReadyToGenerateCertificate:
          json['is_ready_to_generate_certificate'] as bool?,
    );

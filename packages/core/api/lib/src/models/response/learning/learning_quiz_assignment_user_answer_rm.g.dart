// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_assignment_user_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizAssignmentUserAnswerRM _$LearningQuizAssignmentUserAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizAssignmentUserAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      assignmentId: (json['assignment_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      attachedFile: json['attached_file'] as String?,
      score: (json['score'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      commentBy: (json['comment_by'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      assignmentAttachedFile: json['assignment_attached_file'] as String?,
    );

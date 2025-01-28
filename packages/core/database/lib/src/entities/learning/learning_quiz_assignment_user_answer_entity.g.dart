// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_assignment_user_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizAssignmentUserAnswerEntity
    _$LearningQuizAssignmentUserAnswerEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizAssignmentUserAnswerEntity(
          id: json['id'] as String,
          assignmentId: json['assignment_id'] as String,
          userId: json['user_id'] as String,
          attachedFileUrl: json['attached_file_url'] as String,
          score: (json['score'] as num).toInt(),
          comment: json['comment'] as String,
          commentBy: json['comment_by'] == null
              ? null
              : UserEntity.fromJson(json['comment_by'] as Map<String, dynamic>),
          createdAt: const DateTimeStringConverter()
              .fromJson(json['created_at'] as String?),
          updatedAt: const DateTimeStringConverter()
              .fromJson(json['updated_at'] as String?),
        );

Map<String, dynamic> _$LearningQuizAssignmentUserAnswerEntityToJson(
        LearningQuizAssignmentUserAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assignment_id': instance.assignmentId,
      'user_id': instance.userId,
      'attached_file_url': instance.attachedFileUrl,
      'score': instance.score,
      'comment': instance.comment,
      'comment_by': instance.commentBy?.toJson(),
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };

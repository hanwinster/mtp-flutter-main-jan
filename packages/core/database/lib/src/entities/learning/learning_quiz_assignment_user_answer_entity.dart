import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/converters.dart';

part 'learning_quiz_assignment_user_answer_entity.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
class LearningQuizAssignmentUserAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "assignment_id")
  final String assignmentId;
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "attached_file_url")
  final String attachedFileUrl;
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "comment")
  final String comment;
  @JsonKey(name: "comment_by")
  final UserEntity? commentBy;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizAssignmentUserAnswerEntity({
    required this.id,
    required this.assignmentId,
    required this.userId,
    required this.attachedFileUrl,
    required this.score,
    required this.comment,
    required this.commentBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LearningQuizAssignmentUserAnswerEntity.fromJson(
      Map<String, dynamic> json) =>
      _$LearningQuizAssignmentUserAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LearningQuizAssignmentUserAnswerEntityToJson(this);

  @override
  List<Object?> get props =>
      [
        id,
        assignmentId,
        userId,
        attachedFileUrl,
        score,
        comment,
        commentBy,
        createdAt,
        updatedAt,
      ];

  LearningQuizAssignmentUserAnswer toDomainModel() {
    return LearningQuizAssignmentUserAnswer(
      id: id,
      score: score,
      attachedFileUrl: attachedFileUrl,
      comment: comment,
      commentBy: commentBy?.toDomainModel(),
    );
  }
}



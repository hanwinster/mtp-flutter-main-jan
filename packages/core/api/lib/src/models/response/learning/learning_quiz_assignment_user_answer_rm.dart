import 'package:api/src/json/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_assignment_user_answer_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class LearningQuizAssignmentUserAnswerRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "assignment_id")
  final int? assignmentId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "attached_file")
  final String? attachedFile;
  @JsonKey(name: "score")
  final int? score;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "comment_by")
  final int? commentBy;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "assignment_attached_file")
  final String? assignmentAttachedFile;

  LearningQuizAssignmentUserAnswerRM ({
    this.id,
    this.assignmentId,
    this.userId,
    this.attachedFile,
    this.score,
    this.comment,
    this.commentBy,
    this.createdAt,
    this.updatedAt,
    this.assignmentAttachedFile,
  });

  factory LearningQuizAssignmentUserAnswerRM.fromJson(Map<String, dynamic> json) {
    return _$LearningQuizAssignmentUserAnswerRMFromJson(json);
  }
}



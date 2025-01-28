import 'package:api/src/json/converters/converters.dart';
import 'package:api/src/models/response/learning/learning_quiz_assignment_user_answer_rm.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_assignment_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizAssignmentRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "user_answer", includeFromJson: false, includeToJson: false)
  final LearningQuizAssignmentUserAnswerRM? userAnswer;

  const LearningQuizAssignmentRM({
    this.id,
    this.questionId,
    this.createdAt,
    this.updatedAt,
    this.userAnswer,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        createdAt,
        updatedAt,
        userAnswer,
      ];



  factory LearningQuizAssignmentRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizAssignmentRMFromJson(json);

  LearningQuizAssignment toDomainModel() {
    return LearningQuizAssignment(
      id: id?.toString() ?? (throw Exception("id must not be null")),
    );
  }

  LearningQuizAssignmentRM copyWith({
    int? id,
    int? questionId,
    DateTime? createdAt,
    DateTime? updatedAt,
    LearningQuizAssignmentUserAnswerRM? userAnswer,
  }) {
    return LearningQuizAssignmentRM(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }
}

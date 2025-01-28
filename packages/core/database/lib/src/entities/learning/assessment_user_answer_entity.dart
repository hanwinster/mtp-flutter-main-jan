import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/converters.dart';

part 'assessment_user_answer_entity.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
class AssessmentUserAnswerEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'assessment_question_answer_id')
  final String assessmentQuestionId;
  @JsonKey(name: 'course_id')
  final String courseId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'answers')
  final List<String> answers;
  @JsonKey(name: 'score')
  final int score;
  @JsonKey(name: 'attempts')
  final int attempts;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'overall_score')
  final double overallScore;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'comment_by')
  final UserEntity? commentBy;
  @JsonKey(name: 'pass_option')
  final AssessmentUserAnswerPassOptionEntity? passOption;
  @JsonKey(name: 'attach_file')
  final String attachFile;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const AssessmentUserAnswerEntity({
    required this.id,
    required this.assessmentQuestionId,
    required this.courseId,
    required this.userId,
    required this.answers,
    required this.score,
    required this.attempts,
    required this.status,
    required this.overallScore,
    required this.comment,
    required this.commentBy,
    required this.passOption,
    required this.attachFile,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        assessmentQuestionId,
        courseId,
        userId,
        answers,
        score,
        attempts,
        status,
        overallScore,
        comment,
        commentBy,
        passOption,
        attachFile,
        createdAt,
        updatedAt,
      ];

  factory AssessmentUserAnswerEntity.fromJson(Map<String, dynamic> json) => _$AssessmentUserAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentUserAnswerEntityToJson(this);

  AssessmentUserAnswer toDomainModel() {
    return AssessmentUserAnswer(
      id: id,
      questionId: assessmentQuestionId,
      answers: answers,
      score: score,
      attempts: attempts,
      status: status,
      overallScore: overallScore,
      comment: comment,
      commentBy: commentBy?.toDomainModel(),
      passOption: passOption?.toDomainModel() ?? AssessmentUserAnswerPassOption.unknown,
      attachFileUrl: attachFile,
    );
  }
}

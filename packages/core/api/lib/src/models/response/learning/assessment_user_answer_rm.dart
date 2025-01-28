import 'package:api/src/json/converters/converters.dart';
import 'package:api/src/models/response/learning/assessment_user_answer_pass_option_rm.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_user_answer_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class AssessmentUserAnswerRM {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'assessment_question_answer_id')
  final int? assessmentQuestionId;
  @JsonKey(name: 'course_id')
  final int? courseId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'answers')
  final dynamic answers; // This one can be list and map
  @JsonKey(name: 'score')
  final int? score;
  @JsonKey(name: 'attempts')
  final int? attempts;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'overall_score')
  final dynamic overallScore;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'comment_by')
  final dynamic commentBy;
  @JsonKey(name: 'pass_option')
  final AssessmentUserAnswerPassOptionRM? passOption;
  @JsonKey(name: 'attach_file')
  final String? attachFile;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  AssessmentUserAnswerRM({
    this.id,
    this.assessmentQuestionId,
    this.courseId,
    this.userId,
    this.answers,
    this.score,
    this.attempts,
    this.status,
    this.overallScore,
    this.comment,
    this.commentBy,
    this.passOption,
    this.attachFile,
    this.createdAt,
    this.updatedAt,
  });

  factory AssessmentUserAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$AssessmentUserAnswerRMFromJson(json);

  AssessmentUserAnswer toDomainModel() {
    return AssessmentUserAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      questionId: assessmentQuestionId?.toString() ?? '',
      answers: answers,
      score: score ?? 0,
      attempts: attempts ?? 0,
      status: status ?? '',
      overallScore: overallScore,
      comment: comment ?? '',
      commentBy: null,
      passOption: passOption?.toDomainModel()  ?? AssessmentUserAnswerPassOption.unknown,
      attachFileUrl: attachFile ?? '',
    );
  }
}

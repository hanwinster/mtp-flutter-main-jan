import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_question_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class AssessmentQuestionRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'course_id')
  final int? courseId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'answers')
  final List<dynamic>? options;
  @JsonKey(name: 'right_answers')
  final List<dynamic>? correctAnswers;
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(name: 'type', unknownEnumValue: AssessmentQuestionTypeRM.unknown)
  final AssessmentQuestionTypeRM? type;
  @JsonKey(
      name: 'passing_option',
      unknownEnumValue: AssessmentQuestionPassingOptionRM.unknown)
  final AssessmentQuestionPassingOptionRM? passingOption;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: "current_assessment_user")
  final List<AssessmentUserAnswerRM>? userAnswers;

  const AssessmentQuestionRM({
    this.id,
    this.courseId,
    this.userId,
    this.question,
    this.options,
    this.correctAnswers,
    this.order,
    this.type,
    this.passingOption,
    this.createdAt,
    this.updatedAt,
    this.userAnswers,
  });

  @override
  List<Object?> get props => [
        id,
        courseId,
        userId,
        question,
        options,
        correctAnswers,
        order,
        type,
        passingOption,
        createdAt,
        updatedAt,
    userAnswers,
      ];

  factory AssessmentQuestionRM.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionRMFromJson(json);

  AssessmentQuestion toDomainModel() => AssessmentQuestion(
        id: id?.toString() ?? (throw Exception('id must not be null')),
        question: question ?? '',
        options: options?.map((e) => e.toString()).toList() ?? [],
        correctAnswers: correctAnswers?.map((e) => e.toString()).toList() ?? [],
        order: order ?? 0,
        type: type?.toDomainModel() ?? AssessmentQuestionType.unknown,
        passingOption: passingOption?.toDomainModel() ??
            AssessmentQuestionPassingOption.unknown,
        userAnswer: userAnswers?.firstOrNull?.toDomainModel(),
      );
}

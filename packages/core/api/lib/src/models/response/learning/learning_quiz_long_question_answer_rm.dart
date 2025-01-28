import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_long_question_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizLongQuestionAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "user_answer")
  final String? userAnswer;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizLongQuestionAnswerRM({
    this.id,
    this.questionId,
    this.answer,
    this.userAnswer,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        answer,
        userAnswer,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizLongQuestionAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizLongQuestionAnswerRMFromJson(json);

  LearningQuizLongQuestionAnswer toDomainModel() {
    return LearningQuizLongQuestionAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answer: answer ?? '',
      userAnswer: userAnswer ?? '',
    );
  }
}

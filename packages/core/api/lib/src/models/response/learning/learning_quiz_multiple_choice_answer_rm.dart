import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_multiple_choice_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizMultipleChoiceAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "name")
  final String? answerLabel;
  @JsonKey(name: "answer")
  final String? answerText;
  @JsonKey(name: "is_right_answer")
  final int? isCorrectAnswer;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizMultipleChoiceAnswerRM({
    this.id,
    this.questionId,
    this.answerLabel,
    this.answerText,
    this.isCorrectAnswer,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        answerLabel,
        answerText,
        isCorrectAnswer,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizMultipleChoiceAnswerRM.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizMultipleChoiceAnswerRMFromJson(json);

  LearningQuizMultipleChoiceAnswer toDomainModel() {
    return LearningQuizMultipleChoiceAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answerLabel: answerLabel ?? '',
      answerText: answerText ?? '',
      isCorrectAnswer: isCorrectAnswer == 1,
    );
  }
}

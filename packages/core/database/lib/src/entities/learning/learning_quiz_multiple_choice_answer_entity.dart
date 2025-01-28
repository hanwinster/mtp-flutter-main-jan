import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_multiple_choice_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizMultipleChoiceAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "answer_label")
  final String answerLabel;
  @JsonKey(name: "answer_text")
  final String answerText;
  @JsonKey(name: "is_correct_answer")
  final bool isCorrectAnswer;

  const LearningQuizMultipleChoiceAnswerEntity({
    required this.id,
    required this.answerLabel,
    required this.answerText,
    required this.isCorrectAnswer,
  });

  @override
  List<Object> get props => [
        id,
        answerLabel,
        answerText,
        isCorrectAnswer,
      ];

  factory LearningQuizMultipleChoiceAnswerEntity.fromJson(Map<String, dynamic> json) =>_$LearningQuizMultipleChoiceAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizMultipleChoiceAnswerEntityToJson(this);

  LearningQuizMultipleChoiceAnswer toDomainModel() {
    return LearningQuizMultipleChoiceAnswer(
      id: id,
      answerLabel: answerLabel,
      answerText: answerText,
      isCorrectAnswer: isCorrectAnswer,
    );
  }
}

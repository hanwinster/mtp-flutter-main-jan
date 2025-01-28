import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_long_question_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizLongQuestionAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "answer")
  final String answer;
  @JsonKey(name: "user_answer")
  final String userAnswer;

  const LearningQuizLongQuestionAnswerEntity({
    required this.id,
    required this.answer,
    required this.userAnswer,
  });

  @override
  List<Object> get props => [id, answer, userAnswer];

  factory LearningQuizLongQuestionAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizLongQuestionAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizLongQuestionAnswerEntityToJson(this);

  LearningQuizLongQuestionAnswer toDomainModel() {
    return LearningQuizLongQuestionAnswer(
      id: id,
      answer: answer,
      userAnswer: userAnswer,
    );
  }
}

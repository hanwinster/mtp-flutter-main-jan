import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_short_question_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizShortQuestionAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "answer")
  final String answer;
  @JsonKey(name: "user_answer")
  final String userAnswer;

  const LearningQuizShortQuestionAnswerEntity({
    required this.id,
    required this.answer,
    required this.userAnswer,
  });

  @override
  List<Object> get props => [id, answer, userAnswer];

  factory LearningQuizShortQuestionAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizShortQuestionAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizShortQuestionAnswerEntityToJson(this);

  LearningQuizShortQuestionAnswer toDomainModel() {
    return LearningQuizShortQuestionAnswer(
      id: id,
      answer: answer,
      userAnswer: userAnswer,
    );
  }
}

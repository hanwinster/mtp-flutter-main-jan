import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_true_false_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizTrueFalseAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "answer")
  final bool answer;

  const LearningQuizTrueFalseAnswerEntity({
    required this.id,
    required this.answer,
  });

  @override
  List<Object> get props => [id, answer];

  factory LearningQuizTrueFalseAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizTrueFalseAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizTrueFalseAnswerEntityToJson(this);

  LearningQuizTrueFalseAnswer toDomainModel() {
    return LearningQuizTrueFalseAnswer(
      id: id,
      answer: answer,
    );
  }
}

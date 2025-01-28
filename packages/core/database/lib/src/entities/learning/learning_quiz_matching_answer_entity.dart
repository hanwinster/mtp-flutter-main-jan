import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_matching_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizMatchingAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "pairs")
  final List<LearningQuizMatchingPairEntity> pairs;

  const LearningQuizMatchingAnswerEntity({
    required this.id,
    required this.pairs,
  });

  @override
  List<Object> get props => [id, pairs];

  factory LearningQuizMatchingAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizMatchingAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizMatchingAnswerEntityToJson(this);

  LearningQuizMatchingAnswer toDomainModel() {
    return LearningQuizMatchingAnswer(
      id: id,
      pairs: pairs.map((pair) => pair.toDomainModel()).toList(),
    );
  }
}

@JsonSerializable()
class LearningQuizMatchingPairEntity extends Equatable {
  @JsonKey(name: "question_label")
  final String questionLabel;
  @JsonKey(name: "question_text")
  final String questionText;
  @JsonKey(name: "answer_label")
  final String answerLabel;
  @JsonKey(name: "answer_text")
  final String answerText;

  const LearningQuizMatchingPairEntity({
    required this.questionLabel,
    required this.questionText,
    required this.answerLabel,
    required this.answerText,
  });

  @override
  List<Object?> get props => [
        questionLabel,
        questionText,
        answerLabel,
        answerText,
      ];

  factory LearningQuizMatchingPairEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizMatchingPairEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizMatchingPairEntityToJson(this);

  LearningQuizMatchingPair toDomainModel() {
    return LearningQuizMatchingPair(
      questionLabel: questionLabel,
      questionText: questionText,
      answerLabel: answerLabel,
      answerText: answerText,
    );
  }
}

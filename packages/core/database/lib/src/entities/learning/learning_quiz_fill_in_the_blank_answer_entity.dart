import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import 'learning_quiz_fill_in_the_blank_part_entity.dart';

part 'learning_quiz_fill_in_the_blank_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizFillInTheBlankAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "correct_answers")
  final List<String> correctAnswers;
  @JsonKey(name: "optional_keywords")
  final List<String> optionalKeywords;
  @JsonKey(name: "parts")
  final List<LearningQuizFillInTheBlankPartEntity> parts;

  const LearningQuizFillInTheBlankAnswerEntity({
    required this.id,
    required this.correctAnswers,
    required this.optionalKeywords,
    required this.parts,
  });

  @override
  List<Object> get props => [id, correctAnswers, optionalKeywords, parts];

  factory LearningQuizFillInTheBlankAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizFillInTheBlankAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizFillInTheBlankAnswerEntityToJson(this);

  LearningQuizFillInTheBlankAnswer toDomainModel() {
    return LearningQuizFillInTheBlankAnswer(
      id: id,
      correctAnswers: correctAnswers,
      optionalKeywords: optionalKeywords,
      parts: parts.map((e) => e.toDomainModel()).toList(),
    );
  }
}

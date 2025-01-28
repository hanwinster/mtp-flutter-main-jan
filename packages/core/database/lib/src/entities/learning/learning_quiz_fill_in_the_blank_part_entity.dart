import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_fill_in_the_blank_part_entity.g.dart';

@JsonSerializable()
class LearningQuizFillInTheBlankPartEntity extends Equatable {
  @JsonKey(name: "sentence")
  final String sentence;
  @JsonKey(name: "blank")
  final String blank;

  const LearningQuizFillInTheBlankPartEntity({
    required this.sentence,
    required this.blank,
  });

  @override
  List<Object?> get props => [sentence, blank];

  factory LearningQuizFillInTheBlankPartEntity.fromJson(
      Map<String, dynamic> json) =>
      _$LearningQuizFillInTheBlankPartEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizFillInTheBlankPartEntityToJson(this);

  LearningQuizFillInTheBlankPart toDomainModel() {
    if (sentence.isNotEmpty) {
      return LearningQuizFillInTheBlankSentencePart(sentence);
    } else if (blank.isNotEmpty) {
      return LearningQuizFillInTheBlankBlankPart(correctAnswer: blank);
    } else {
      throw Exception("Both sentence and blank cannot be empty");
    }
  }
}
import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_fill_in_the_blank_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizFillInTheBlankAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "optional_keywords")
  final String? commaSeparatedOptionalKeywords;
  @JsonKey(name: "paragraph_formatted")
  final List<LearningQuizFillInTheBlankPartRM>? paragraph;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizFillInTheBlankAnswerRM({
    this.id,
    this.questionId,
    this.commaSeparatedOptionalKeywords,
    this.paragraph,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        commaSeparatedOptionalKeywords,
        paragraph,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizFillInTheBlankAnswerRM.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizFillInTheBlankAnswerRMFromJson(json);

  LearningQuizFillInTheBlankAnswer toDomainModel() {
    return LearningQuizFillInTheBlankAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      correctAnswers: paragraph
              ?.whereType<LearningQuizFillInTheBlankPartRM>()
              .map((e) => e.blank ?? '')
              .whereNot((e) => e.isEmpty)
              .toList() ??
          [],
      optionalKeywords: commaSeparatedOptionalKeywords
              ?.split(",")
              .map((e) => e.trim())
              .toList() ??
          [],
      parts: paragraph?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class LearningQuizFillInTheBlankPartRM extends Equatable {
  @JsonKey(name: "sentence")
  final String? sentence;
  @JsonKey(name: "blank")
  final String? blank;

  const LearningQuizFillInTheBlankPartRM({
    this.sentence,
    this.blank,
  });

  @override
  List<Object?> get props => [sentence, blank];

  factory LearningQuizFillInTheBlankPartRM.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizFillInTheBlankPartRMFromJson(json);

  LearningQuizFillInTheBlankPart toDomainModel() {
    if (sentence?.isNotEmpty == true) {
      return LearningQuizFillInTheBlankSentencePart(sentence!);
    } else if (blank?.isNotEmpty == true) {
      return LearningQuizFillInTheBlankBlankPart(correctAnswer: blank);
    } else {
      throw Exception("Both sentence and blank cannot be null");
    }
  }
}

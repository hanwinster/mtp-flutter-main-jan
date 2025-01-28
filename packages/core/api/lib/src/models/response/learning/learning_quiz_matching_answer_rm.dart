import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_matching_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizMatchingAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "answer")
  final List<LearningQuizMatchingPairRM>? answers;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizMatchingAnswerRM({
    this.id,
    this.questionId,
    this.answers,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        answers,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizMatchingAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizMatchingAnswerRMFromJson(json);

  LearningQuizMatchingAnswer toDomainModel() {
    return LearningQuizMatchingAnswer(
      id: id?.toString() ?? '',
      pairs: answers?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }
}

@JsonSerializable()
final class LearningQuizMatchingPairRM extends Equatable {
  @JsonKey(name: "name_first")
  final String? questionLabel;
  @JsonKey(name: "first")
  final String? questionText;
  @JsonKey(name: "name_second")
  final String? answerLabel;
  @JsonKey(name: "second")
  final String? answerText;

  const LearningQuizMatchingPairRM({
    this.questionLabel,
    this.questionText,
    this.answerLabel,
    this.answerText,
  });

  @override
  List<Object?> get props => [
        questionLabel,
        questionText,
        answerLabel,
        answerText,
      ];

  factory LearningQuizMatchingPairRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizMatchingPairRMFromJson(json);

  LearningQuizMatchingPair toDomainModel() {
    return LearningQuizMatchingPair(
      questionLabel: questionLabel ?? "",
      questionText: questionText ?? "",
      answerLabel: answerLabel ?? "",
      answerText: answerText ?? "",
    );
  }
}

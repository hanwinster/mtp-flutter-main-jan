import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_true_false_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizTrueFalseAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizTrueFalseAnswerRM({
    this.id,
    this.questionId,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        answer,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizTrueFalseAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizTrueFalseAnswerRMFromJson(json);

  LearningQuizTrueFalseAnswer toDomainModel() {
    return LearningQuizTrueFalseAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answer: answer?.toLowerCase() == 'true',
    );
  }
}

import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_rearrange_answer_rm.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class LearningQuizRearrangeAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question_id")
  final int? questionId;
  @JsonKey(name: "answer")
  final List<String>? options;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizRearrangeAnswerRM({
    this.id,
    this.questionId,
    this.options,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, questionId, options, createdAt, updatedAt,];

  factory LearningQuizRearrangeAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizRearrangeAnswerRMFromJson(json);

  LearningQuizRearrangeAnswer toDomainModel() {
    return LearningQuizRearrangeAnswer(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      options: List.from(options ?? []), //To avoid shuffling the original list
      correctOrder: List.from(options ?? []), //To avoid shuffling the original list
    );
  }
}

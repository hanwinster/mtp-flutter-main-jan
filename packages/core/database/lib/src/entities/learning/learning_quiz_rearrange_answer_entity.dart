import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_rearrange_answer_entity.g.dart';

@JsonSerializable()
class LearningQuizRearrangeAnswerEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "options")
  final List<String> options;
  @JsonKey(name: "correct_order")
  final List<String> correctOrder;

  const LearningQuizRearrangeAnswerEntity({
    required this.id,
    required this.options,
    required this.correctOrder,
  });

  @override
  List<Object> get props => [id, options, correctOrder];

  factory LearningQuizRearrangeAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizRearrangeAnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizRearrangeAnswerEntityToJson(this);

  LearningQuizRearrangeAnswer toDomainModel() {
    return LearningQuizRearrangeAnswer(
      id: id,
      options: options,
      correctOrder: correctOrder,
    );
  }
}

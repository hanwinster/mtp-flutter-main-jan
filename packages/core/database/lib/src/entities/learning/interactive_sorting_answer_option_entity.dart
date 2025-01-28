import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_sorting_answer_option_entity.g.dart';

@JsonSerializable()
class InteractiveSortingAnswerOptionEntity extends Equatable {
  @JsonKey(name: "key")
  final int key;
  @JsonKey(name: "answer")
  final String answer;

  const InteractiveSortingAnswerOptionEntity({
    required this.key,
    required this.answer,
  });

  @override
  List<Object?> get props => [key, answer];

  factory InteractiveSortingAnswerOptionEntity.fromJson(Map<String, dynamic> json) {
    return _$InteractiveSortingAnswerOptionEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InteractiveSortingAnswerOptionEntityToJson(this);
  }

  InteractiveSortingAnswerOption toDomainModel() {
    return InteractiveSortingAnswerOption(
      key: key,
      answer: answer,
    );
  }
}



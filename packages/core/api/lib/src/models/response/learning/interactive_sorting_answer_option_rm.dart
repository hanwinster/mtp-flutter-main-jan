import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_sorting_answer_option_rm.g.dart';

@JsonSerializable()
class InteractiveSortingAnswerOptionRM extends Equatable {
  @JsonKey(name: "key")
  final int? key;
  @JsonKey(name: "answer")
  final String? answer;

  const InteractiveSortingAnswerOptionRM({
    this.key,
    this.answer,
  });

  @override
  List<Object?> get props => [key, answer];

  factory InteractiveSortingAnswerOptionRM.fromJson(Map<String, dynamic> json) {
    return _$InteractiveSortingAnswerOptionRMFromJson(json);
  }
}



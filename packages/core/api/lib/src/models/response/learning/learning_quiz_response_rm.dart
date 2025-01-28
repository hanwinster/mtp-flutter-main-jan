import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningQuizResponseRM extends Equatable {
  @JsonKey(name: 'quiz')
  final LearningQuizRM? quiz;
  @JsonKey(name: 'assignment_media')
  final MediaRM? assignmentMedia;

  const LearningQuizResponseRM({
    this.quiz,
    this.assignmentMedia,
  });

  @override
  List<Object?> get props => [quiz, assignmentMedia];

  factory LearningQuizResponseRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizResponseRMFromJson(json);

  LearningQuizRM toLearningQuizRM() {
    return quiz ?? (throw Exception('Quiz must not be null'));
  }
}

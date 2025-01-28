import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_quiz_question_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum BlogPostQuizQuestionTypeRM {
  @JsonValue('true_false')
  trueFalse,
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('rearrange')
  rearrange,
  @JsonValue('matching')
  matching,
  @JsonValue('unknown')
  unknown;

  factory BlogPostQuizQuestionTypeRM.fromJson(String value) => decodeEnum(
    _$BlogPostQuizQuestionTypeRMEnumMap,
    value,
    unknownValue: BlogPostQuizQuestionTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$BlogPostQuizQuestionTypeRMEnumMap, this);

  BlogPostQuizQuestionType toDomainModel() {
    switch (this) {
      case BlogPostQuizQuestionTypeRM.trueFalse:
        return BlogPostQuizQuestionType.trueFalse;
      case BlogPostQuizQuestionTypeRM.multipleChoice:
        return BlogPostQuizQuestionType.multipleChoice;
      case BlogPostQuizQuestionTypeRM.rearrange:
        return BlogPostQuizQuestionType.rearrange;
      case BlogPostQuizQuestionTypeRM.matching:
        return BlogPostQuizQuestionType.matching;
      case BlogPostQuizQuestionTypeRM.unknown:
        return BlogPostQuizQuestionType.unknown;
    }
  }
}
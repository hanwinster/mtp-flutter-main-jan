import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_question_entity.g.dart';

@JsonSerializable(createFactory: false, createToJson: false)
abstract class LearningQuizQuestionEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "explanation")
  final String explanation;
  @JsonKey(name: "type")
  final LearningQuizTypeEntity type;

  const LearningQuizQuestionEntity({
    required this.id,
    required this.title,
    required this.explanation,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        explanation,
        type,
      ];

  factory LearningQuizQuestionEntity.fromJson(Map<String, dynamic> json) {
    final type = LearningQuizTypeEntity.fromJson(json["type"]);
    switch (type) {
      case LearningQuizTypeEntity.shortQuestion:
        return LearningQuizShortQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.longQuestion:
        return LearningQuizLongQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.trueFalse:
        return LearningQuizTrueFalseQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.multipleChoice:
        return LearningQuizMultipleChoiceQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.fillInTheBlank:
        return LearningQuizFillInTheBlankQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.rearrange:
        return LearningQuizRearrangeQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.assignment:
        return LearningQuizAssignmentQuestionEntity.fromJson(json);
      case LearningQuizTypeEntity.matching:
        return LearningQuizMatchingQuestionEntity.fromJson(json);
      default:
        throw Exception("Unknown type: ${json["type"]}");
    }
  }

  Map<String, dynamic> toJson();

  LearningQuizQuestion toDomainModel();
}

@JsonSerializable()
final class LearningQuizShortQuestionEntity extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizShortQuestionAnswerEntity answer;

  const LearningQuizShortQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.shortQuestion,
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizShortQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizShortQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LearningQuizShortQuestionEntityToJson(this);

  @override
  LearningQuizShortQuestion toDomainModel() {
    return LearningQuizShortQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizLongQuestionEntity extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizLongQuestionAnswerEntity answer;

  const LearningQuizLongQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.longQuestion
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizLongQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizLongQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LearningQuizLongQuestionEntityToJson(this);

  @override
  LearningQuizLongQuestion toDomainModel() {
    return LearningQuizLongQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizTrueFalseQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizTrueFalseAnswerEntity answer;

  const LearningQuizTrueFalseQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.trueFalse,
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizTrueFalseQuestionEntity.fromJson(
          Map<String, dynamic> json) => _$LearningQuizTrueFalseQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LearningQuizTrueFalseQuestionEntityToJson(this);

  @override
  LearningQuizTrueFalseQuestion toDomainModel() {
    return LearningQuizTrueFalseQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizMatchingQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizMatchingAnswerEntity answer;

  const LearningQuizMatchingQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.matching,
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizMatchingQuestionEntity.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizMatchingQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LearningQuizMatchingQuestionEntityToJson(this);

  @override
  LearningQuizMatchingQuestion toDomainModel() {
    return LearningQuizMatchingQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizMultipleChoiceQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "answers")
  final List<LearningQuizMultipleChoiceAnswerEntity> answers;

  const LearningQuizMultipleChoiceQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answers,
    super.type = LearningQuizTypeEntity.multipleChoice,
  });

  @override
  List<Object?> get props => super.props..addAll([answers]);

  @override
  factory LearningQuizMultipleChoiceQuestionEntity.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizMultipleChoiceQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LearningQuizMultipleChoiceQuestionEntityToJson(this);

  @override
  LearningQuizMultipleChoiceQuestion toDomainModel() {
    return LearningQuizMultipleChoiceQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answers: answers.map((answer) => answer.toDomainModel()).toList(),
    );
  }
}

@JsonSerializable()
final class LearningQuizFillInTheBlankQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizFillInTheBlankAnswerEntity answer;

  const LearningQuizFillInTheBlankQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.fillInTheBlank,
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizFillInTheBlankQuestionEntity.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizFillInTheBlankQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LearningQuizFillInTheBlankQuestionEntityToJson(this);

  @override
  LearningQuizFillInTheBlankQuestion toDomainModel() {
    return LearningQuizFillInTheBlankQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizRearrangeQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "answer")
  final LearningQuizRearrangeAnswerEntity answer;

  const LearningQuizRearrangeQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
    super.type = LearningQuizTypeEntity.rearrange,
  });

  @override
  List<Object?> get props => super.props..addAll([answer]);

  @override
  factory LearningQuizRearrangeQuestionEntity.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizRearrangeQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LearningQuizRearrangeQuestionEntityToJson(this);

  @override
  LearningQuizRearrangeQuestion toDomainModel() {
    return LearningQuizRearrangeQuestion(
      id: id,
      title: title,
      explanation: explanation,
      answer: answer.toDomainModel(),
    );
  }
}

@JsonSerializable()
final class LearningQuizAssignmentQuestionEntity
    extends LearningQuizQuestionEntity {
  @JsonKey(name: "assignment")
  final LearningQuizAssignmentEntity assignment;
  @JsonKey(name: "attached_file_url")
  final String attachedFileUrl;
  @JsonKey(name: "user_answer")
  final LearningQuizAssignmentUserAnswerEntity? userAnswer;

  const LearningQuizAssignmentQuestionEntity({
    required super.id,
    required super.title,
    required super.explanation,
    required this.assignment,
    required this.attachedFileUrl,
    required this.userAnswer,
    super.type = LearningQuizTypeEntity.assignment,
  });

  @override
  List<Object?> get props => super.props..addAll([assignment, attachedFileUrl, userAnswer]);

  @override
  factory LearningQuizAssignmentQuestionEntity.fromJson(
          Map<String, dynamic> json) =>
      _$LearningQuizAssignmentQuestionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LearningQuizAssignmentQuestionEntityToJson(this);

  @override
  LearningQuizAssignmentQuestion toDomainModel() {
    return LearningQuizAssignmentQuestion(
      id: id,
      title: title,
      explanation: explanation,
      assignment: assignment.toDomainModel(),
      attachedFileUrl: attachedFileUrl,
      userAnswer: userAnswer?.toDomainModel(),
    );
  }
}

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_question_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningQuizQuestionRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? explanation;
  @JsonKey(name: "quiz_id")
  final int? quizId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: 'matching_answer')
  final LearningQuizMatchingAnswerRM? matchingAnswer;
  @JsonKey(name: 'multiple_answers')
  final List<LearningQuizMultipleChoiceAnswerRM>? multipleChoiceAnswers;
  @JsonKey(name: "short_answer")
  final List<LearningQuizShortQuestionAnswerRM>? shortAnswers;
  @JsonKey(name: "long_answer")
  final LearningQuizLongQuestionAnswerRM? longAnswer;
  @JsonKey(name: "true_false_answer")
  final LearningQuizTrueFalseAnswerRM? trueFalseAnswer;
  @JsonKey(name: "blank_answer")
  final LearningQuizFillInTheBlankAnswerRM? fillInTheBlankAnswer;
  @JsonKey(name: "rearrange_answer")
  final LearningQuizRearrangeAnswerRM? rearrangeAnswer;
  @JsonKey(name: "assignment")
  final LearningQuizAssignmentRM? assignment;
  @JsonKey(name: "attached_file")
  final String? attachedFileUrl;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  factory LearningQuizQuestionRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizQuestionRMFromJson(json);

  const LearningQuizQuestionRM({
    this.id,
    this.title,
    this.explanation,
    this.quizId,
    this.userId,
    this.matchingAnswer,
    this.multipleChoiceAnswers,
    this.shortAnswers,
    this.longAnswer,
    this.trueFalseAnswer,
    this.fillInTheBlankAnswer,
    this.rearrangeAnswer,
    this.assignment,
    this.attachedFileUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        explanation,
        quizId,
        userId,
        matchingAnswer,
        multipleChoiceAnswers,
        shortAnswers,
        longAnswer,
        trueFalseAnswer,
        fillInTheBlankAnswer,
        rearrangeAnswer,
        assignment,
        attachedFileUrl,
        createdAt,
        updatedAt,
      ];

  LearningQuizQuestionRM copyWith({
    int? id,
    String? title,
    String? explanation,
    int? quizId,
    int? userId,
    LearningQuizMatchingAnswerRM? matchingAnswer,
    List<LearningQuizMultipleChoiceAnswerRM>? multipleChoiceAnswers,
    List<LearningQuizShortQuestionAnswerRM>? shortAnswers,
    LearningQuizLongQuestionAnswerRM? longAnswer,
    LearningQuizTrueFalseAnswerRM? trueFalseAnswer,
    LearningQuizFillInTheBlankAnswerRM? fillInTheBlankAnswer,
    LearningQuizRearrangeAnswerRM? rearrangeAnswer,
    LearningQuizAssignmentRM? assignment,
    String? attachedFileUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LearningQuizQuestionRM(
      id: id ?? this.id,
      title: title ?? this.title,
      explanation: explanation ?? this.explanation,
      quizId: quizId ?? this.quizId,
      userId: userId ?? this.userId,
      matchingAnswer: matchingAnswer ?? this.matchingAnswer,
      multipleChoiceAnswers:
          multipleChoiceAnswers ?? this.multipleChoiceAnswers,
      shortAnswers: shortAnswers ?? this.shortAnswers,
      longAnswer: longAnswer ?? this.longAnswer,
      trueFalseAnswer: trueFalseAnswer ?? this.trueFalseAnswer,
      fillInTheBlankAnswer: fillInTheBlankAnswer ?? this.fillInTheBlankAnswer,
      rearrangeAnswer: rearrangeAnswer ?? this.rearrangeAnswer,
      assignment: assignment ?? this.assignment,
      attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
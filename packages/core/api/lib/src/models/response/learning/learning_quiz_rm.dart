import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningQuizRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "lecture_id")
  final int? lectureId;
  @JsonKey(name: "type", unknownEnumValue: LearningQuizTypeRM.unknown)
  final LearningQuizTypeRM? type;
  @JsonKey(name: 'is_try_again')
  final int? isTryAgain;
  @JsonKey(name: 'questions')
  final List<LearningQuizQuestionRM>? questions;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningQuizRM({
    this.id,
    this.title,
    this.courseId,
    this.userId,
    this.lectureId,
    this.type,
    this.isTryAgain,
    this.questions,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        courseId,
        userId,
        lectureId,
        type,
        isTryAgain,
        questions,
        createdAt,
        updatedAt,
      ];

  factory LearningQuizRM.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizRMFromJson(json);

  LearningQuiz toDomainModel() {
    final quizTypeDomainModel =
        type?.toDomainModel() ?? LearningQuizType.unknown;
    return LearningQuiz(
      id: id?.toString() ?? (throw Exception('id is null')),
      title: title ?? '',
      type: quizTypeDomainModel,
      isTryAgain: isTryAgain == 1,
      questions: questions
              ?.map((e) => _mapQuestion(
                    e,
                    quizTypeDomainModel,
                  ))
              .toList() ??
          [],
      lectureId: lectureId?.toString() ?? '',
    );
  }

  LearningQuizQuestion _mapQuestion(
    LearningQuizQuestionRM question,
    LearningQuizType type,
  ) {
    switch (type) {
      case LearningQuizType.matching:
        return _mapMatchingQuestion(question);
      case LearningQuizType.multipleChoice:
        return _mapMultipleChoiceQuestion(question);
      case LearningQuizType.shortQuestion:
        return _mapShortQuestion(question);
      case LearningQuizType.longQuestion:
        return _mapLongQuestion(question);
      case LearningQuizType.trueFalse:
        return _mapTrueFalseQuestion(question);
      case LearningQuizType.fillInTheBlank:
        return _mapFillInTheBlankQuestion(question);
      case LearningQuizType.rearrange:
        return _mapRearrangeQuestion(question);
      case LearningQuizType.assignment:
        return _mapAssignmentQuestion(question);
      case LearningQuizType.unknown:
        throw Exception("Unknown quiz type");
    }
  }

  LearningQuizQuestion _mapShortQuestion(LearningQuizQuestionRM question) {
    return LearningQuizShortQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.shortAnswers?.firstOrNull?.toDomainModel() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestion _mapLongQuestion(LearningQuizQuestionRM question) {
    return LearningQuizLongQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.longAnswer?.toDomainModel() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestion _mapTrueFalseQuestion(LearningQuizQuestionRM question) {
    return LearningQuizTrueFalseQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.trueFalseAnswer?.toDomainModel() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestion _mapMatchingQuestion(LearningQuizQuestionRM question) {
    return LearningQuizMatchingQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.matchingAnswer?.toDomainModel() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestion _mapMultipleChoiceQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizMultipleChoiceQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answers: question.multipleChoiceAnswers
              ?.map((e) => e.toDomainModel())
              .toList() ??
          [],
    );
  }

  LearningQuizQuestion _mapFillInTheBlankQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizFillInTheBlankQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.fillInTheBlankAnswer?.toDomainModel() ??
          (throw Exception(
              "blank_answer must not be null for fill in the blank question")),
    );
  }

  LearningQuizQuestion _mapRearrangeQuestion(LearningQuizQuestionRM question) {
    return LearningQuizRearrangeQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.rearrangeAnswer?.toDomainModel() ??
          (throw Exception(
              "rearrange_answer must not be null for rearrange question")),
    );
  }

  LearningQuizQuestion _mapAssignmentQuestion(
    LearningQuizQuestionRM question,
  ) {
    return LearningQuizAssignmentQuestion(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      assignment: question.assignment?.toDomainModel() ??
          (throw Exception(
              "assignment must not be null for assignment question")),
      attachedFileUrl: question.attachedFileUrl ?? '',
      userAnswer: null, // Not available in response and we will fetch it later
    );
  }

  LearningQuizRM copyWith({
    int? id,
    String? title,
    int? courseId,
    int? userId,
    int? lectureId,
    LearningQuizTypeRM? type,
    int? isTryAgain,
    List<LearningQuizQuestionRM>? questions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LearningQuizRM(
      id: id ?? this.id,
      title: title ?? this.title,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      lectureId: lectureId ?? this.lectureId,
      type: type ?? this.type,
      isTryAgain: isTryAgain ?? this.isTryAgain,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

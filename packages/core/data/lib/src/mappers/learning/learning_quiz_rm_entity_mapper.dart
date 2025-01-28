import 'package:api/api.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension LearningQuizRMEntityMapper on LearningQuizRM {
  LearningQuizEntity toEntity() {
    final quizTypeEntity = type?.toEntity() ?? LearningQuizTypeEntity.unknown;
    return LearningQuizEntity(
      id: id?.toString() ?? (throw Exception('id is null')),
      title: title ?? '',
      type: type?.toEntity() ?? LearningQuizTypeEntity.unknown,
      isTryAgain: isTryAgain == 1,
      questions:
          questions?.map((e) => _mapQuestion(e, quizTypeEntity)).toList() ?? [],
      lectureId: lectureId?.toString() ?? '',
      courseId: courseId?.toString() ?? '',
    );
  }

  LearningQuizQuestionEntity _mapQuestion(
    LearningQuizQuestionRM question,
    LearningQuizTypeEntity type,
  ) {
    switch (type) {
      case LearningQuizTypeEntity.matching:
        return _mapMatchingQuestion(question);
      case LearningQuizTypeEntity.multipleChoice:
        return _mapMultipleChoiceQuestion(question);
      case LearningQuizTypeEntity.shortQuestion:
        return _mapShortQuestion(question);
      case LearningQuizTypeEntity.longQuestion:
        return _mapLongQuestion(question);
      case LearningQuizTypeEntity.trueFalse:
        return _mapTrueFalseQuestion(question);
      case LearningQuizTypeEntity.fillInTheBlank:
        return _mapFillInTheBlankQuestion(question);
      case LearningQuizTypeEntity.rearrange:
        return _mapRearrangeQuestion(question);
      case LearningQuizTypeEntity.assignment:
        return _mapAssignmentQuestion(question);
      case LearningQuizTypeEntity.unknown:
        throw Exception("Unknown quiz type");
    }
  }

  LearningQuizQuestionEntity _mapShortQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizShortQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.shortAnswers?.firstOrNull?.toEntity() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestionEntity _mapLongQuestion(LearningQuizQuestionRM question) {
    return LearningQuizLongQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.longAnswer?.toEntity() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestionEntity _mapTrueFalseQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizTrueFalseQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.trueFalseAnswer?.toEntity() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestionEntity _mapMatchingQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizMatchingQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.matchingAnswer?.toEntity() ??
          (throw Exception("answer is null")),
    );
  }

  LearningQuizQuestionEntity _mapMultipleChoiceQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizMultipleChoiceQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answers:
          question.multipleChoiceAnswers?.map((e) => e.toEntity()).toList() ??
              [],
    );
  }

  LearningQuizQuestionEntity _mapFillInTheBlankQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizFillInTheBlankQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.fillInTheBlankAnswer?.toEntity() ??
          (throw Exception(
              "blank_answer must not be null for fill in the blank question")),
    );
  }

  LearningQuizQuestionEntity _mapRearrangeQuestion(
      LearningQuizQuestionRM question) {
    return LearningQuizRearrangeQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      answer: question.rearrangeAnswer?.toEntity() ??
          (throw Exception(
              "rearrange_answer must not be null for rearrange question")),
    );
  }

  LearningQuizQuestionEntity _mapAssignmentQuestion(
    LearningQuizQuestionRM question,
  ) {
    return LearningQuizAssignmentQuestionEntity(
      id: question.id?.toString() ?? (throw Exception("id is null")),
      title: question.title ?? "",
      explanation: question.explanation ?? "",
      assignment: question.assignment?.toEntity() ??
          (throw Exception(
              "assignment must not be null for assignment question")),
      attachedFileUrl: question.attachedFileUrl ?? '',
      userAnswer: question.assignment?.userAnswer?.toEntity(),
    );
  }
}

enum LearningQuizType {
  trueFalse,
  shortQuestion,
  longQuestion,
  fillInTheBlank,
  multipleChoice,
  rearrange,
  matching,
  assignment,
  unknown;

  bool get isEvaluable {
    switch (this) {
      case LearningQuizType.trueFalse:
      case LearningQuizType.fillInTheBlank:
      case LearningQuizType.multipleChoice:
      case LearningQuizType.rearrange:
      case LearningQuizType.matching:
        return true;
      case LearningQuizType.shortQuestion:
      case LearningQuizType.longQuestion:
      case LearningQuizType.assignment:
      case LearningQuizType.unknown:
        return false;
    }
  }
}

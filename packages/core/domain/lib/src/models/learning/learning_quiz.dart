import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LearningQuiz extends Equatable {
  final String id;
  final String title;
  final String lectureId;
  final LearningQuizType type;
  final bool isTryAgain;
  final List<LearningQuizQuestion> questions;

  const LearningQuiz({
    required this.id,
    required this.title,
    required this.lectureId,
    required this.type,
    required this.isTryAgain,
    required this.questions,
  });

  @override
  List<Object> get props => [
        id,
        title,
        lectureId,
        type,
        isTryAgain,
        questions,
      ];

  bool get isAssignmentQuiz => type == LearningQuizType.assignment;
}

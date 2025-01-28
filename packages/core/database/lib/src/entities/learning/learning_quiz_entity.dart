import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class LearningQuizEntity extends Equatable {
  final String id;
  final String title;
  final String lectureId;
  final String courseId;
  final LearningQuizTypeEntity type;
  final bool isTryAgain;
  final List<LearningQuizQuestionEntity> questions;

  const LearningQuizEntity({
    required this.id,
    required this.title,
    required this.lectureId,
    required this.courseId,
    required this.type,
    required this.isTryAgain,
    required this.questions,
  });

  @override
  List<Object> get props => [
        id,
        title,
        courseId,
        lectureId,
        type,
        isTryAgain,
        questions,
      ];

  LearningQuiz toDomainModel() {
    return LearningQuiz(
      id: id,
      title: title,
      lectureId: lectureId,
      type: type.toDomainModel(),
      isTryAgain: isTryAgain,
      questions: questions.map((e) => e.toDomainModel()).toList(),
    );
  }
}

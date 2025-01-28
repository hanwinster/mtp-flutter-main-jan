import 'dart:io';

import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class LearningQuizRepository {
  Stream<Result<LearningQuiz>> observeLearningQuiz({
    required String courseId,
    required String quizId,
  });

  Future<void> saveQuizAnswer({
    required String courseId,
    required String quizId,
    required Map<String, QuizAnswer> answersById,
    required LearningQuizType quizType,
  });

  Future<String> submitAssignment({
    required String courseId,
    required String quizId,
    required String assignmentId,
    required String currentSection,
    required CourseNavigationDirection direction,
    required File file,
  });
}

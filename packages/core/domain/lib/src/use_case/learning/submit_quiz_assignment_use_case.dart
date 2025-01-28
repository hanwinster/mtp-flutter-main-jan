import 'dart:io';

import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SubmitQuizAssignmentUseCaseRequest extends Equatable {
  final String courseId;
  final String quizId;
  final String assignmentId;
  final String currentSection;
  final CourseNavigationDirection direction;
  final File file;

  const SubmitQuizAssignmentUseCaseRequest({
    required this.courseId,
    required this.quizId,
    required this.assignmentId,
    required this.currentSection,
    required this.direction,
    required this.file,
  });

  @override
  List<Object> get props =>
      [courseId, quizId, assignmentId, currentSection, direction, file,];
}

class SubmitQuizAssignmentUseCase {
  SubmitQuizAssignmentUseCase({
    LearningQuizRepository? quizRepository,
  }) : _quizRepository = quizRepository ?? getIt();
  final LearningQuizRepository _quizRepository;

  Future<String> call(SubmitQuizAssignmentUseCaseRequest request) async {
    return _quizRepository.submitAssignment(
      courseId: request.courseId,
      quizId: request.quizId,
      assignmentId: request.assignmentId,
      currentSection: request.currentSection,
      direction: request.direction,
      file: request.file,
    );
  }
}
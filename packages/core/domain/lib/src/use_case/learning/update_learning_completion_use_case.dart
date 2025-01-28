import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateLearningCompletionUseCaseRequest extends Equatable {
  final String courseId;
  final String currentSection;
  final CourseNavigationDirection direction;

  const UpdateLearningCompletionUseCaseRequest({
    required this.courseId,
    required this.currentSection,
    required this.direction,
  });

  @override
  List<Object> get props => [courseId, currentSection, direction];
}

class UpdateLearningCompletionUseCase {
  UpdateLearningCompletionUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();
  final CourseRepository _courseRepository;

  Future<CourseMaterial?> call(UpdateLearningCompletionUseCaseRequest request) async {
    return _courseRepository.updateCompletion(
      courseId: request.courseId,
      currentSection: request.currentSection,
      direction: request.direction,
    );
  }
}
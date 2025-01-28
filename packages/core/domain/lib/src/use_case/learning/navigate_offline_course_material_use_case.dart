import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/models/learning/course_material_completion.dart';

class NavigateOfflineCourseMaterialUseCaseRequest extends Equatable {
  final String courseId;
  final String currentSection;
  final CourseNavigationDirection direction;

  const NavigateOfflineCourseMaterialUseCaseRequest({
    required this.courseId,
    required this.currentSection,
    required this.direction,
  });

  @override
  List<Object> get props => [courseId, currentSection, direction];
}

class NavigateOfflineCourseMaterialUseCase {
  NavigateOfflineCourseMaterialUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();
  final CourseRepository _courseRepository;

  Future<CourseMaterial?> call(NavigateOfflineCourseMaterialUseCaseRequest request) async {
    final learner = await _courseRepository.getCourseLearnerByCourseId(courseId: request.courseId);
    if (learner != null) {
      CourseMaterialCompletion? result;
      if (request.direction == CourseNavigationDirection.previous) {
        result = learner.getPreviousMaterial(currentMaterialKey: request.currentSection);
      } else {
        result = learner.getNextMaterial(currentMaterialKey: request.currentSection);
      }
      return result?.toCourseMaterial();
    }
    return null;
  }
}
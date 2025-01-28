import 'package:base/base.dart';
import 'package:domain/domain.dart';

class TakeCourseUseCaseRequest extends Equatable {
  const TakeCourseUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object?> get props => [courseId];
}

class TakeCourseUseCase {
  TakeCourseUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<CourseLearner> call(TakeCourseUseCaseRequest request) {
    return _courseRepository.takeCourse(
      courseId: request.courseId,
    );
  }
}

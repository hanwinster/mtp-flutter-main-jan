import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CancelCourseUseCaseRequest extends Equatable {
  const CancelCourseUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class CancelCourseUseCase {
  CancelCourseUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<void> call(CancelCourseUseCaseRequest request) {
    return _courseRepository.cancelCourse(
      courseId: request.courseId,
    );
  }
}

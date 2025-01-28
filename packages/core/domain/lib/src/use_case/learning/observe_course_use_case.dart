import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseUseCaseRequest extends Equatable {
  const ObserveCourseUseCaseRequest({
    required this.courseId,
    this.forceRefresh = false,
  });

  final String courseId;
  final bool forceRefresh;

  @override
  List<Object?> get props => [courseId, forceRefresh];
}

class ObserveCourseUseCase {
  ObserveCourseUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<Result<Course>> call(ObserveCourseUseCaseRequest request) {
    return _courseRepository.observeCourse(
      courseId: request.courseId,
      forceRefresh: request.forceRefresh,
    );
  }
}

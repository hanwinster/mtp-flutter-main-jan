import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DeleteOfflineCourseUseCaseRequest extends Equatable {
  final String courseId;

  const DeleteOfflineCourseUseCaseRequest({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}

class DeleteOfflineCourseUseCase {
  DeleteOfflineCourseUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<void> call(DeleteOfflineCourseUseCaseRequest request) {
    return _courseRepository.deleteOfflineCourse(
      courseId: request.courseId,
    );
  }
}

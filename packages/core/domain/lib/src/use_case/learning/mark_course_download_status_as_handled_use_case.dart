import 'package:base/base.dart';
import 'package:domain/domain.dart';

class MarkCourseDownloadStatusAsHandledUseCaseRequest extends Equatable {
  final String courseId;

  const MarkCourseDownloadStatusAsHandledUseCaseRequest({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}

class MarkCourseDownloadStatusAsHandledUseCase {
  MarkCourseDownloadStatusAsHandledUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<void> call(MarkCourseDownloadStatusAsHandledUseCaseRequest request) {
    return _courseRepository.markCourseDownloadStatusAsHandled(
      courseId: request.courseId,
    );
  }
}

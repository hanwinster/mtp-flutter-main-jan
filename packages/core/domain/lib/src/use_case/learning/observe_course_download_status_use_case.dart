import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseDownloadStatusUseCaseRequest extends Equatable {
  final String courseId;

  const ObserveCourseDownloadStatusUseCaseRequest({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}

class ObserveCourseDownloadStatusUseCase {
  ObserveCourseDownloadStatusUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<CourseDownloadStatus?> call(
      ObserveCourseDownloadStatusUseCaseRequest request) {
    return _courseRepository.observeCourseDownloadStatus(
      courseId: request.courseId,
    );
  }
}

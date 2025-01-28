import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveOfflineCourseMediaUseCaseRequest extends Equatable {
  final String courseId;
  final String url;
  final String title;

  const SaveOfflineCourseMediaUseCaseRequest({
    required this.courseId,
    required this.url,
    required this.title,
  });

  @override
  List<Object> get props => [courseId, url, title];
}

class SaveOfflineCourseMediaUseCase {
  SaveOfflineCourseMediaUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<void> call(SaveOfflineCourseMediaUseCaseRequest request) {
    return _courseRepository.saveOfflineCourseMedia(
      courseId: request.courseId,
      url: request.url,
      title: request.title,
    );
  }
}

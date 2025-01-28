import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveOfflineCourseMediaListUseCase {
  ObserveOfflineCourseMediaListUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<List<OfflineCourseMedia>> call() {
    return _courseRepository.observeOfflineCourseMedias();
  }
}

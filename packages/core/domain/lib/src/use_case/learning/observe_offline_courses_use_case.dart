import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveOfflineCoursesUseCase {
  ObserveOfflineCoursesUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<List<OfflineCourse>> call() {
    return _courseRepository.observeOfflineCourses();
  }
}

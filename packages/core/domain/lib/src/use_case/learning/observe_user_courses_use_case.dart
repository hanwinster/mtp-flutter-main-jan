import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveUserCoursesUseCaseRequest extends Equatable {
  const ObserveUserCoursesUseCaseRequest({
    required this.filter,
    required this.completed,
  });

  final CourseFilter filter;
  final bool completed;

  @override
  List<Object?> get props => [filter, completed];
}

class ObserveUserCoursesUseCase {
  ObserveUserCoursesUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<Result<List<Course>>> call(ObserveUserCoursesUseCaseRequest request) {
    return _courseRepository.observeUserCourses(
      keyword: request.filter.keyword,
      categoryId: request.filter.category?.id ?? '',
      completed: request.completed,
    );
  }
}

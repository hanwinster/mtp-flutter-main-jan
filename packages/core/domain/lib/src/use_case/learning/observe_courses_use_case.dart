import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCoursesUseCaseRequest extends Equatable {
  const ObserveCoursesUseCaseRequest({
    required this.page,
    required this.limit,
    required this.filter,
  });

  final CourseFilter filter;
  final int page;
  final int limit;

  @override
  List<Object?> get props => [];
}

class ObserveCoursesUseCase {
  ObserveCoursesUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<Result<List<Course>>> call(ObserveCoursesUseCaseRequest request) {
    return _courseRepository.observeCourses(
      page: request.page,
      limit: request.limit,
      keyword: request.filter.keyword,
      categoryId: request.filter.category?.id ?? '',
    );
  }
}

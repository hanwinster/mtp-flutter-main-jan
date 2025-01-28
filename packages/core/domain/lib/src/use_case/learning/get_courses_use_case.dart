import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetCoursesUseCaseRequest extends Equatable {
  const GetCoursesUseCaseRequest({
    required this.page,
    required this.limit,
    required this.filter,
  });

  final CourseFilter filter;
  final int page;
  final int limit;

  @override
  List<Object> get props => [filter, page, limit];
}

class GetCoursesUseCase {
  GetCoursesUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<List<Course>> call(GetCoursesUseCaseRequest request) {
    return _courseRepository.getCourses(
      page: request.page,
      limit: request.limit,
      keyword: request.filter.keyword,
      categoryId: request.filter.category?.id ?? '',
    );
  }
}

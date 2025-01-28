import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseCategoriesUseCase {
  ObserveCourseCategoriesUseCase({
    CourseCategoryRepository? courseCategoryRepository,
  }) : _courseCategoryRepository = courseCategoryRepository ?? getIt();

  final CourseCategoryRepository _courseCategoryRepository;

  Stream<Result<List<CourseCategory>>> call() {
    return _courseCategoryRepository.observeCategories();
  }
}

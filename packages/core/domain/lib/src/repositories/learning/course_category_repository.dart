import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CourseCategoryRepository {
  Stream<Result<List<CourseCategory>>> observeCategories();
}

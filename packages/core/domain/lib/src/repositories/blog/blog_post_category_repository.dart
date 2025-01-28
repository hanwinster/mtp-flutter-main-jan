import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class BlogPostCategoryRepository {
  Stream<Result<List<BlogPostCategory>>> observeCategories();
}

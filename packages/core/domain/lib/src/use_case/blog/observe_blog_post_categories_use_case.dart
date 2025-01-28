import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveBlogPostCategoriesUseCase {
  ObserveBlogPostCategoriesUseCase({
    BlogPostCategoryRepository? blogPostCategoryRepository,
  }) : _blogPostCategoryRepository = blogPostCategoryRepository ?? getIt();

  final BlogPostCategoryRepository _blogPostCategoryRepository;

  Stream<Result<List<BlogPostCategory>>> call() {
    return _blogPostCategoryRepository.observeCategories();
  }
}

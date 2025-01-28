import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveBlogPostsByCategoryRequest extends Equatable {
  final String categoryId;
  final String keyword;

  const ObserveBlogPostsByCategoryRequest({
    required this.categoryId,
    required this.keyword,
  });

  @override
  List<Object> get props => [categoryId, keyword];
}

class ObserveBlogPostsByCategoryUseCase {
  ObserveBlogPostsByCategoryUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Stream<Result<List<BlogPost>>> call(
      ObserveBlogPostsByCategoryRequest request) {
    return _blogPostRepository.observeBlogPosts(
      categoryId: request.categoryId,
      keyword: request.keyword,
    );
  }
}

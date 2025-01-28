import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveRecommendedBlogPostsUseCase {
  ObserveRecommendedBlogPostsUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Stream<Result<List<BlogPost>>> call() {
    return _blogPostRepository.observeRecommendedBlogPosts();
  }
}

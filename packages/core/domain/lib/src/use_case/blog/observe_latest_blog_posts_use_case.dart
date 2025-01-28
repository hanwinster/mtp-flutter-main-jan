import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLatestBlogPostsUseCase {
  ObserveLatestBlogPostsUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Stream<Result<List<BlogPost>>> call() {
    return _blogPostRepository.observeLatestBlogPosts();
  }
}

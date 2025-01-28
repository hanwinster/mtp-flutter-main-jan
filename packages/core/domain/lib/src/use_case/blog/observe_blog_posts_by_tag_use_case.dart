import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveBlogPostsByTagRequest extends Equatable {
  final String tagId;

  const ObserveBlogPostsByTagRequest({
    required this.tagId,
  });

  @override
  List<Object> get props => [tagId];
}

class ObserveBlogPostsByTagUseCase {
  ObserveBlogPostsByTagUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Stream<Result<List<BlogPost>>> call(ObserveBlogPostsByTagRequest request) {
    return _blogPostRepository.observeBlogPostsByTag(tagId: request.tagId);
  }
}


sealed class PostListFilter {
  const PostListFilter();
}

class PostListFilterByTag extends PostListFilter {
  const PostListFilterByTag(this.tagId);

  final String tagId;
}

class PostListFilterAll extends PostListFilter {
  const PostListFilterAll();
}
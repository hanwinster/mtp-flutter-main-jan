part of 'blog_bloc.dart';

sealed class BlogEvent extends Equatable {
  const BlogEvent();
}

class BlogLatestPostsFetched extends BlogEvent {
  const BlogLatestPostsFetched();

  @override
  List<Object> get props => [];
}

class BlogFilteredPostsFetched extends BlogEvent {
  const BlogFilteredPostsFetched(this.filter);

  final BlogFilter filter;

  @override
  List<Object?> get props => [filter];
}

class BlogRecommendedPostsFetched extends BlogEvent {
  const BlogRecommendedPostsFetched();

  @override
  List<Object?> get props => [];
}

class BlogPostCategoriesFetched extends BlogEvent {
  const BlogPostCategoriesFetched();

  @override
  List<Object> get props => [];
}

class BlogPostCategoryToggled extends BlogEvent {
  const BlogPostCategoryToggled(this.item);

  final SelectableCategoryItemState item;

  @override
  List<Object> get props => [item];
}

class BlogPostKeywordChanged extends BlogEvent {
  const BlogPostKeywordChanged(this.keyword);

  final String keyword;

  @override
  List<Object> get props => [keyword];
}
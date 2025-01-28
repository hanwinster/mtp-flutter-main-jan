import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class BlogFilter extends Equatable {
  const BlogFilter({
    this.category,
    this.keyword = '',
  });

  final BlogPostCategory? category;
  final String keyword;

  factory BlogFilter.empty() {
    return const BlogFilter(
      category: null,
      keyword: '',
    );
  }

  @override
  List<Object?> get props => [category, keyword];

  BlogFilter copyWith({
    ValueGetter<BlogPostCategory?>? category,
    ValueGetter<String?>? keyword,
  }) {
    return BlogFilter(
      category: category != null ? category() : this.category,
      keyword: keyword != null ? keyword()! : this.keyword,
    );
  }
}
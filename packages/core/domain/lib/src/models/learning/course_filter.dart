import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseFilter extends Equatable {
  final CourseCategory? category;
  final String keyword;

  const CourseFilter({
    this.category,
    this.keyword = '',
  });

  factory CourseFilter.empty() {
    return const CourseFilter();
  }

  @override
  List<Object?> get props => [category, keyword];

  CourseFilter copyWith({
    CourseCategory? category,
    String? keyword,
  }) {
    return CourseFilter(
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
    );
  }
}
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GroupFilter extends Equatable {
  final List<ThematicGroupCategory> categories;
  final String keyword;

  const GroupFilter({
    this.categories = const [],
    this.keyword = '',
  });

  factory GroupFilter.empty() {
    return const GroupFilter();
  }

  @override
  List<Object?> get props => [categories, keyword];

  GroupFilter copyWith({
    List<ThematicGroupCategory>? categories,
    String? keyword,
  }) {
    return GroupFilter(
      categories: categories ?? this.categories,
      keyword: keyword ?? this.keyword,
    );
  }
}
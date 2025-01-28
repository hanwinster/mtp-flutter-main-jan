import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SelectableCategoryItemState extends Equatable {
  const SelectableCategoryItemState({
    required this.category,
    required this.isSelected,
  });

  final BlogPostCategory category;
  final bool isSelected;

  @override
  List<Object> get props => [category, isSelected];

  SelectableCategoryItemState copyWith({
    BlogPostCategory? category,
    bool? isSelected,
  }) {
    return SelectableCategoryItemState(
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
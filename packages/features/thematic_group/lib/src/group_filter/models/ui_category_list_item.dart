import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UiCategoryListItem extends Equatable {
  final ThematicGroupCategory category;
  final bool isSelected;

  const UiCategoryListItem({
    required this.category,
    this.isSelected = false,
  });

  @override
  List<Object> get props => [category, isSelected];

  UiCategoryListItem copyWith({
    ThematicGroupCategory? category,
    bool? isSelected,
  }) {
    return UiCategoryListItem(
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}
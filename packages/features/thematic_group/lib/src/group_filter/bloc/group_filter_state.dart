part of 'group_filter_bloc.dart';

final class GroupFilterState extends Equatable {
  const GroupFilterState({
    this.categoriesUiState = const UiStateInitial(),
    this.selectedCategories = const [],
  });

  final UiState<List<UiCategoryListItem>> categoriesUiState;
  final List<ThematicGroupCategory> selectedCategories;

  factory GroupFilterState.create({
    required List<ThematicGroupCategory> selectedCategories,
  }) {
    return GroupFilterState(
      selectedCategories: selectedCategories,
    );
  }

  bool get hasSelectedAll =>
      categoriesUiState.dataOrNull?.every((element) => element.isSelected) ??
      false;

  @override
  List<Object> get props => [categoriesUiState, selectedCategories];

  GroupFilterState copyWith({
    UiState<List<UiCategoryListItem>>? categoriesUiState,
    List<ThematicGroupCategory>? selectedCategories,
  }) {
    return GroupFilterState(
      categoriesUiState: categoriesUiState ?? this.categoriesUiState,
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}

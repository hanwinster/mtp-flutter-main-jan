part of 'group_filter_bloc.dart';

sealed class GroupFilterEvent extends Equatable {
  const GroupFilterEvent();
}

class GroupFilterCategoriesFetched extends GroupFilterEvent {
  const GroupFilterCategoriesFetched();

  @override
  List<Object> get props => [];
}

class GroupFilterCategoryCheckChanged extends GroupFilterEvent {
  final ThematicGroupCategory category;
  final bool isSelected;

  const GroupFilterCategoryCheckChanged(this.category, this.isSelected);

  @override
  List<Object> get props => [category];
}

class GroupFilterAllCategoriesCheckChanged extends GroupFilterEvent {
  final bool isSelected;

  const GroupFilterAllCategoriesCheckChanged(this.isSelected);

  @override
  List<Object> get props => [isSelected];
}
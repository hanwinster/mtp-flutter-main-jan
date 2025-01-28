part of 'group_home_bloc.dart';

sealed class GroupHomeEvent extends Equatable {
  const GroupHomeEvent();
}

class GroupHomeCategoriesChanged extends GroupHomeEvent {
  final List<ThematicGroupCategory> categories;

  const GroupHomeCategoriesChanged(this.categories);

  @override
  List<Object?> get props => [categories];
}
part of 'group_home_bloc.dart';

final class GroupHomeState extends Equatable {
  const GroupHomeState({
    this.selectedCategories = const [],
  });

  final List<ThematicGroupCategory> selectedCategories;

  factory GroupHomeState.create() {
    return const GroupHomeState();
  }

  @override
  List<Object> get props => [selectedCategories];

  GroupHomeState copyWith({
    List<ThematicGroupCategory>? selectedCategories,
  }) {
    return GroupHomeState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}

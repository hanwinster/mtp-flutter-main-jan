part of 'group_list_bloc.dart';

const pageSize = 20;
const firstPageKey = 1;

final class GroupListState extends Equatable {
  const GroupListState({
    required this.pageName,
    required this.filter,
    this.currentPageKey = -1,
    this.groupsUiState = const UiStateInitial(),
  });

  final GroupPageName pageName;
  final GroupFilter filter;
  final int currentPageKey;
  final UiState<List<ThematicGroupListing>> groupsUiState;

  factory GroupListState.create({
    required GroupPageName pageName,
  }) {
    return GroupListState(
      pageName: pageName,
      filter: GroupFilter.empty(),
    );
  }

  int? get nextPageKey => isLastPage ? null : currentPageKey + 1;

  bool get isFirstPage => currentPageKey == firstPageKey;

  bool get isLastPage => (groupsUiState.dataOrNull ?? []).length < pageSize;

  @override
  List<Object> get props => [
        pageName,
        filter,
        currentPageKey,
        groupsUiState,
      ];

  GroupListState copyWith({
    GroupPageName? pageName,
    GroupFilter? filter,
    int? currentPageKey,
    UiState<List<ThematicGroupListing>>? groupsUiState,
  }) {
    return GroupListState(
      pageName: pageName ?? this.pageName,
      filter: filter ?? this.filter,
      currentPageKey: currentPageKey ?? this.currentPageKey,
      groupsUiState: groupsUiState ?? this.groupsUiState,
    );
  }
}

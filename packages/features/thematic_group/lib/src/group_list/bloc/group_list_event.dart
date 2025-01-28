part of 'group_list_bloc.dart';

sealed class GroupListEvent extends Equatable {
  const GroupListEvent();
}

class GroupListFetched extends GroupListEvent {
  const GroupListFetched({
    required this.pageKey,
    this.filter,
  });

  final int pageKey;
  final GroupFilter? filter;

  @override
  List<Object?> get props => [pageKey, filter];
}

class GroupListKeywordChanged extends GroupListEvent {
  const GroupListKeywordChanged(this.keyword);

  final String keyword;

  @override
  List<Object> get props => [keyword];
}

class GroupListCategoriesChanged extends GroupListEvent {
  const GroupListCategoriesChanged(this.categories);

  final List<ThematicGroupCategory> categories;

  @override
  List<Object> get props => [categories];
}
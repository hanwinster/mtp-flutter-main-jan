import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:thematic_group/src/group_list/models/group_filter.dart';
import 'package:thematic_group/src/group_list/models/group_page_name.dart';
import 'package:ui/ui.dart';

part 'group_list_event.dart';

part 'group_list_state.dart';

const _debounceDuration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GroupListBloc extends Bloc<GroupListEvent, GroupListState> {
  GroupListBloc({
    required GroupPageName pageName,
    GetThematicRecommendGroupsUseCase? getThematicRecommendGroupsUseCase,
    GetThematicUserGroupsUseCase? getThematicUserGroupsUseCase,
  })  : _getThematicUserGroupsUseCase = getThematicUserGroupsUseCase ?? getIt(),
        _getThematicRecommendGroupsUseCase =
            getThematicRecommendGroupsUseCase ?? getIt(),
        super(GroupListState.create(
          pageName: pageName,
        )) {
    on<GroupListFetched>(_onGroupsFetched, transformer: restartable());
    on<GroupListKeywordChanged>(_onKeywordChanged,
        transformer: debounce(_debounceDuration));
    on<GroupListCategoriesChanged>(_onCategoriesChanged);
  }

  final GetThematicRecommendGroupsUseCase _getThematicRecommendGroupsUseCase;
  final GetThematicUserGroupsUseCase _getThematicUserGroupsUseCase;

  Future<void> _onGroupsFetched(
    GroupListFetched event,
    Emitter<GroupListState> emit,
  ) async {
    final newFilter = event.filter ?? state.filter;

    emit(
      state.copyWith(
        filter: newFilter,
        groupsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = state.pageName == GroupPageName.recommended
          ? await _getThematicRecommendGroupsUseCase(
              GetThematicRecommendGroupsUseCaseRequest(
                page: event.pageKey,
                limit: pageSize,
                keyword: newFilter.keyword,
                categoryIds:
                    newFilter.categories.map((e) => e.id.toString()).toList(),
              ),
            )
          : await _getThematicUserGroupsUseCase(
              GetThematicUserGroupsUseCaseRequest(
                page: event.pageKey,
                limit: pageSize,
                keyword: newFilter.keyword,
                categoryIds:
                    newFilter.categories.map((e) => e.id.toString()).toList(),
              ),
            );

      bool isEmpty = result.isEmpty;
      emit(state.copyWith(
        currentPageKey: event.pageKey,
        groupsUiState: isEmpty ? const UiStateEmpty() : UiStateSuccess(result),
      ));
    } catch (e, s) {
      logger.e('Error', e, s);
      emit(
        state.copyWith(
          groupsUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  void _onKeywordChanged(
    GroupListKeywordChanged event,
    Emitter<GroupListState> emit,
  ) {
    emit(state.copyWith(
      filter: state.filter.copyWith(keyword: event.keyword),
    ));
  }

  Future<void> _onCategoriesChanged(
    GroupListCategoriesChanged event,
    Emitter<GroupListState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(categories: event.categories),
      ),
    );
  }
}

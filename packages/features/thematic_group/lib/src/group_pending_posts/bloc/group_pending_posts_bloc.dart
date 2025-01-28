import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'group_pending_posts_event.dart';

part 'group_pending_posts_state.dart';

class GroupPendingPostsBloc
    extends Bloc<GroupPendingPostsEvent, GroupPendingPostsState> {
  GroupPendingPostsBloc({
    required String groupId,
    GetCurrentUserIdUseCase? getCurrentUserIdUseCase,
    GetGroupPendingPostsUseCase? getGroupPendingPostsUseCase,
  })  : _getCurrentUserIdUseCase = getCurrentUserIdUseCase ?? getIt(),
        _getGroupPendingPostsUseCase = getGroupPendingPostsUseCase ?? getIt(),
        super(GroupPendingPostsState.create(
          groupId: groupId,
        )) {
    on<GroupPendingPostsFetched>(_handleApprovedPostsFetched);
  }

  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;
  final GetGroupPendingPostsUseCase _getGroupPendingPostsUseCase;

  Future<void> _handleApprovedPostsFetched(
    GroupPendingPostsFetched event,
    Emitter<GroupPendingPostsState> emit,
  ) async {
    emit(
      state.copyWith(
        postsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final userId = await _getCurrentUserIdUseCase();
      final result = await _getGroupPendingPostsUseCase(
        GetGroupPendingPostsUseCaseRequest(
          groupId: state.groupId,
          userId: userId,
          page: 1,
          limit: 20,
        ),
      );
      emit(
        state.copyWith(
          postsUiState:
              result.isEmpty ? const UiStateEmpty() : UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching approved posts', e, s);
      emit(
        state.copyWith(
          postsUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}

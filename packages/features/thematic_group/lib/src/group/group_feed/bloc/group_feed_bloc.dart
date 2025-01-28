import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

part 'group_feed_event.dart';

part 'group_feed_state.dart';

class GroupFeedBloc extends Bloc<GroupFeedEvent, GroupFeedState> {
  GroupFeedBloc({
    required String groupId,
    GetGroupUseCase? getGroupUseCase,
  })  : _getGroupUseCase = getGroupUseCase ?? getIt(),
        super(GroupFeedState.create(groupId: groupId)) {
    on<GroupFeedEvent>(
      _handleGroupFetched,
      transformer: restartable(),
    );
  }

  final GetGroupUseCase _getGroupUseCase;

  Future<void> _handleGroupFetched(
    GroupFeedEvent event,
    Emitter<GroupFeedState> emit,
  ) async {
    emit(state.copyWith(groupUiState: const UiStateInProgress()));

    try {
      final group = await _getGroupUseCase(
        GetGroupUseCaseRequest(groupId: state.groupId),
      );
      emit(state.copyWith(groupUiState: UiStateSuccess(group)));
    } catch (e, s) {
      logger.e('Error fetching group', e, s);
      emit(state.copyWith(groupUiState: UiStateFailure.fromError(e)));
    }
  }
}

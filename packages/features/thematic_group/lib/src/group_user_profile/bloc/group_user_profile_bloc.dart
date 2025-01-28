import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'group_user_profile_event.dart';

part 'group_user_profile_state.dart';

class GroupUserProfileBloc
    extends Bloc<GroupUserProfileEvent, GroupUserProfileState> {
  GroupUserProfileBloc({
    required String groupId,
    GetCurrentUserIdUseCase? getCurrentUserIdUseCase,
    GetGroupApprovedPostsUseCase? getGroupApprovedPostsUseCase,
    ObserveLoggedInUserUseCase? observeLoggedInUserUseCase,
  })  : _getCurrentUserIdUseCase = getCurrentUserIdUseCase ?? getIt(),
        _getGroupApprovedPostsUseCase = getGroupApprovedPostsUseCase ?? getIt(),
        _observeLoggedInUserUseCase = observeLoggedInUserUseCase ?? getIt(),
        super(GroupUserProfileState.create(
          groupId: groupId,
        )) {
    on<GroupUserProfileApprovedPostsFetched>(_handleApprovedPostsFetched);
    on<GroupUserProfileCurrentUserFetched>(_handleCurrentUserFetched);
  }

  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;
  final ObserveLoggedInUserUseCase _observeLoggedInUserUseCase;
  final GetGroupApprovedPostsUseCase _getGroupApprovedPostsUseCase;

  Future<void> _handleApprovedPostsFetched(
    GroupUserProfileApprovedPostsFetched event,
    Emitter<GroupUserProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        postsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final userId = await _getCurrentUserIdUseCase();
      final result = await _getGroupApprovedPostsUseCase(
        GetGroupApprovedPostsUseCaseRequest(
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

  Future<void> _handleCurrentUserFetched(
    GroupUserProfileCurrentUserFetched event,
    Emitter<GroupUserProfileState> emit,
  ) async {
    emit(state.copyWith(
      currentUserUiState: const UiStateInProgress(),
    ));

    await emit.forEach(_observeLoggedInUserUseCase(), onData: (result) {
      return state.copyWith(
        currentUserUiState: UiState.fromResult(result),
      );
    }, onError: (e, s) {
      return state.copyWith(
        currentUserUiState: UiStateFailure.fromError(e),
      );
    });
  }
}

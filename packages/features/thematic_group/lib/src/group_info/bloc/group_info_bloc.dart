import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../group_list/models/models.dart';

part 'group_info_event.dart';

part 'group_info_state.dart';

class GroupInfoBloc extends Bloc<GroupInfoEvent, GroupInfoState> {
  GroupInfoBloc({
    ObserveAuthStateUseCase? observeAuthStateUseCase,
    required ThematicGroupListing group,
    required GroupType groupType,
    LeaveGroupUseCase? leaveGroupUseCase,
    RequestGroupJoinUseCase? joinGroupUseCase,
  })  : _observeAuthStateUseCase = observeAuthStateUseCase ?? getIt(),
        _joinGroupUseCase = joinGroupUseCase ?? getIt(),
        _leaveGroupUseCase = leaveGroupUseCase ?? getIt(),
        super(GroupInfoState.create(
          group: group,
          groupType: groupType,
        )) {
    on<GroupInfoAuthStateFetched>(_onAuthStateFetched);
    on<GroupInfoJoinGroupRequested>(_handleGroupJoined);
    on<GroupInfoLeaveGroupRequested>(_handleGroupLeft);
  }

  final ObserveAuthStateUseCase _observeAuthStateUseCase;
  final LeaveGroupUseCase _leaveGroupUseCase;
  final RequestGroupJoinUseCase _joinGroupUseCase;

  Future<void> _onAuthStateFetched(
    GroupInfoAuthStateFetched event,
    Emitter<GroupInfoState> emit,
  ) async {
    await emit.forEach(
      _observeAuthStateUseCase(),
      onData: (authState) {
        return state.copyWith(authState: authState);
      },
      onError: (e, s) {
        return state.copyWith(authState: AuthState.loggedOut);
      },
    );
  }

  Future<void> _handleGroupJoined(
    GroupInfoJoinGroupRequested event,
    Emitter<GroupInfoState> emit,
  ) async {
    try {
      emit(state.copyWith(
        groupJoiningUiState: const UiStateInProgress(),
      ));

      final result = await _joinGroupUseCase(
        groupId: event.groupId,
        isApproved: true,
      );

      emit(state.copyWith(
        groupJoiningUiState: const UiStateSuccess(NullValue()),
      ));
    } catch (e, s) {
      logger.e('Error joining group', e, s);
      emit(state.copyWith(
        groupJoiningUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> _handleGroupLeft(
    GroupInfoLeaveGroupRequested event,
    Emitter<GroupInfoState> emit,
  ) async {
    logger.d('Leaving group ${event.groupId}');
    try {
      emit(state.copyWith(
        groupLeavingUiState: const UiStateInProgress(),
      ));

      final result = await _leaveGroupUseCase(
        groupId: event.groupId,
      );
      GroupUpdateService().notifyGroupUpdate(event.groupId);
      emit(state.copyWith(
        groupLeavingUiState: UiStateSuccess(result),
      ));
    } catch (e, s) {
      logger.e('Error leaving group', e, s);
      emit(state.copyWith(
        groupLeavingUiState: UiStateFailure.fromError(e),
      ));
    }
  }
}

class GroupUpdateService {
  static final GroupUpdateService _instance = GroupUpdateService._internal();
  factory GroupUpdateService() => _instance;
  GroupUpdateService._internal();

  final _groupUpdateController = StreamController<String>.broadcast();
  Stream<String> get groupUpdates => _groupUpdateController.stream;

  void notifyGroupUpdate(String groupId) {
    _groupUpdateController.add(groupId);
  }

  void dispose() {
    _groupUpdateController.close();
  }
}

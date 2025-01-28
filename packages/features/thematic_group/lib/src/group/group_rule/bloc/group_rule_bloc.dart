import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

import '../../../group_info/bloc/group_info_bloc.dart';

part 'group_rule_event.dart';

part 'group_rule_state.dart';

class GroupRuleBloc extends Bloc<GroupRuleEvent, GroupRuleState> {
  GroupRuleBloc({
    required String groupId,
    GetGroupRulesUseCase? getGroupRulesUseCase,
    RequestGroupJoinUseCase? joinGroupUseCase,
  })  : _joinGroupUseCase = joinGroupUseCase ?? getIt(),
        _getGroupRulesUseCase = getGroupRulesUseCase ?? getIt(),
        super(GroupRuleState.create(groupId: groupId)) {
    on<GroupRuleFetched>(_onGroupRulesFetched);
    on<GroupRuleJoinGroupRequested>(_handleGroupJoined);
  }

  final RequestGroupJoinUseCase _joinGroupUseCase;
  final GetGroupRulesUseCase _getGroupRulesUseCase;

  Future<void> _onGroupRulesFetched(
    GroupRuleFetched event,
    Emitter<GroupRuleState> emit,
  ) async {
    emit(state.copyWith(groupRuleUiState: const UiStateInitial()));
    try {
      final result = await _getGroupRulesUseCase();
      emit(
        state.copyWith(
          groupRuleUiState: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching group rules', e, s);
      emit(
        state.copyWith(
          groupRuleUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleGroupJoined(
    GroupRuleJoinGroupRequested event,
    Emitter<GroupRuleState> emit,
  ) async {
    try {
      emit(state.copyWith(
        groupJoiningUiState: const UiStateInProgress(),
      ));

      final result = await _joinGroupUseCase(
        groupId: event.groupId,
        isApproved: false,
      );
      GroupUpdateService().notifyGroupUpdate(event.groupId);
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
}

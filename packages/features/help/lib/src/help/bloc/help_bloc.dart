import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'help_event.dart';

part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc({
    GetCmsMenusUseCase? getCmsMenusUseCase,
  })  : _getCmsMenusUseCase = getCmsMenusUseCase ?? getIt(),
        super(HelpState.create()) {
    on<HelpCmsMenusFetched>(
      _handleCmsMenusFetched,
      transformer: restartable(),
    );
  }

  final GetCmsMenusUseCase _getCmsMenusUseCase;

  Future<void> _handleCmsMenusFetched(
    HelpCmsMenusFetched event,
    Emitter<HelpState> emit,
  ) async {
    emit(
      state.copyWith(cmsMenusUiState: const UiStateInProgress()),
    );
    try {
      final result = await _getCmsMenusUseCase();
      emit(state.copyWith(cmsMenusUiState: UiStateSuccess(result)));
    } catch (e, s) {
      logger.e('Error fetching cms menus', e, s);
      emit(
        state.copyWith(cmsMenusUiState: UiStateFailure.fromError(e)),
      );
    }
  }
}

import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'user_manual_event.dart';
part 'user_manual_state.dart';

class UserManualBloc extends Bloc<UserManualEvent, UserManualState> {
  UserManualBloc({
    GetUserManualsUseCase? getUserManualsUseCase,
  })  : _getUserManualsUseCase = getUserManualsUseCase ?? getIt(),
        super(UserManualState.create()) {
    on<UserManualFetched>(
      _handleManualsFetched,
      transformer: restartable(),
    );
  }

  final GetUserManualsUseCase _getUserManualsUseCase;

  FutureOr<void> _handleManualsFetched(
      UserManualFetched event,
    Emitter<UserManualState> emit,
  ) async {
    emit(
      state.copyWith(
        userManualsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final userManuals = await _getUserManualsUseCase();

      emit(
        state.copyWith(
          userManualsUiState: UiStateSuccess(userManuals),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          userManualsUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}

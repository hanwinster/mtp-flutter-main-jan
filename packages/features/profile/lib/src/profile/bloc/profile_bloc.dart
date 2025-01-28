import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    ObserveLoggedInUserUseCase? observeLoggedInUserUseCase,
  })  : _observeLoggedInUserUseCase = observeLoggedInUserUseCase ?? getIt(),
        super(ProfileState.create()) {
    on<ProfileUserFetched>(_handleUserFetched, transformer: restartable());
  }

  final ObserveLoggedInUserUseCase _observeLoggedInUserUseCase;

  FutureOr<void> _handleUserFetched(
    ProfileUserFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(
      userUiState: const UiStateInProgress(),
    ));

    await emit.forEach(_observeLoggedInUserUseCase(), onData: (result) {
      return state.copyWith(
        userUiState: UiState.fromResult(result),
      );
    }, onError: (e, s) {
      return state.copyWith(
        userUiState: UiStateFailure.fromError(e),
      );
    });
  }
}

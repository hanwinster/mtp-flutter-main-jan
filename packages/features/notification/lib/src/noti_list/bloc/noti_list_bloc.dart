import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'noti_list_event.dart';
part 'noti_list_state.dart';

class NotiListBloc extends Bloc<NotiListEvent, NotiListState> {
  NotiListBloc({
    GetNotificationsUseCase? getNotificationUseCase,
  })  : _getNotificationsUseCase = getNotificationUseCase ?? getIt(),
        super(const NotiListState()) {
    on<NotiListFetched>(
      _handleNotiListFetched,
      transformer: restartable(),
    );
  }

  final GetNotificationsUseCase _getNotificationsUseCase;

  FutureOr<void> _handleNotiListFetched(
    NotiListFetched event,
    Emitter<NotiListState> emit,
  ) async {
    // Emit the loading state
    emit(state.copyWith(
      notificationsUiState: const UiStateInitial(),
    ));

    // emit(
    //   state.copyWith(
    //     notificationsUiState: const UiStateInProgress(),
    //   ),
    // );

    try {
      // Fetch notifications using the use case
      final result = await _getNotificationsUseCase();

      // Ensure ResultSuccess is correctly used
      emit(state.copyWith(
        notificationsUiState: UiState.fromResult(ResultSuccess(result)),
      ));
    } catch (error) {
      // Handle the error state
      print(error);
      emit(state.copyWith(
        notificationsUiState: UiStateFailure.fromError(error),
      ));
    }
  }
}

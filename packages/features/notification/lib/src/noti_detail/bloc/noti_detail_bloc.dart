import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:ui/ui.dart';

part 'noti_detail_event.dart';
part 'noti_detail_state.dart';

class NotiDetailBloc extends Bloc<NotiDetailEvent, NotiDetailState> {
  NotiDetailBloc({
  required String notiId,GetNotificationsDetailUseCase? getNotificationDetailUseCase,}) :_getNotificationDetailUseCase = getNotificationDetailUseCase ?? getIt(), super(NotiDetailState(notiId:notiId)) {
    on<NotiDetailFetched>(
      _handleDetailFetched,
      transformer: restartable(),
    );
  }

  final GetNotificationsDetailUseCase _getNotificationDetailUseCase;
  FutureOr<void> _handleDetailFetched(
      NotiDetailFetched event,
      Emitter<NotiDetailState> emit,
      ) async {
    emit(
      state.copyWith(
        notiUIstate: const UiStateInProgress(),
      ),
    );
    try {
      // Fetch notifications using the use case
      if (kDebugMode) {
        print("noti id in bloc : ${event.notiId}");
      }
      final result = await _getNotificationDetailUseCase(notiId:event.notiId);

      // Ensure ResultSuccess is correctly used
      emit(state.copyWith(
        notiUIstate: UiState.fromResult(ResultSuccess(result.data)),
      ));
    } catch (error) {
      // Handle the error state
      print(error);
      emit(state.copyWith(
        notiUIstate: UiStateFailure.fromError(error),
      ));
    }

    // await emit.forEach(
    //   _getNotificationDetailUseCase(event.notiId),
    //   onData: (result) => state.copyWith(
    //     courseUiState: UiState.fromResult(result),
    //   ),
    //   onError: (e, s) => state.copyWith(
    //     courseUiState: UiStateFailure.fromError(e),
    //   ),
    // );
  }
}

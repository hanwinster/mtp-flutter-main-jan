import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'live_session_event.dart';

part 'live_session_state.dart';

class LiveSessionBloc
    extends Bloc<LiveSessionEvent, LiveSessionState> {
  LiveSessionBloc({
    required String courseId,
    required String activityId,
    required String materialKey,
    ObserveLiveSessionUseCase? observeLiveSessionUseCase,
  })  : _observeLiveSessionUseCase =
            observeLiveSessionUseCase ?? getIt(),
        super(LiveSessionState(
          liveSessionId: activityId,
          courseId: courseId,
          materialKey: materialKey,
        )) {
    on<LiveSessionFetched>(
      _handleLiveSessionFetched,
      transformer: restartable(),
    );
    on<LiveSessionLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveLiveSessionUseCase _observeLiveSessionUseCase;

  FutureOr<void> _handleLiveSessionFetched(
      LiveSessionFetched event,
      Emitter<LiveSessionState> emit,
      ) async {
    emit(
      state.copyWith(
        liveSessionUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeLiveSessionUseCase(ObserveLiveSessionUseCaseRequest(
        courseId: state.courseId,
        liveSessionId: state.liveSessionId,
      )),
      onData: (result) => state.copyWith(
        liveSessionUiState: UiState.fromResultTransform(
          result,
              (liveSession) => liveSession,
        ),
      ),
      onError: (e, s) => state.copyWith(
        liveSessionUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
      LiveSessionLearnerChanged event,
      Emitter<LiveSessionState> emit,
      ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}

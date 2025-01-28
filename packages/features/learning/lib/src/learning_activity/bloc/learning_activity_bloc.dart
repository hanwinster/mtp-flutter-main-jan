import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/learning_activity/models/models.dart';
import 'package:ui/ui.dart';

part 'learning_activity_event.dart';

part 'learning_activity_state.dart';

class LearningActivityBloc
    extends Bloc<LearningActivityEvent, LearningActivityState> {
  LearningActivityBloc({
    required String courseId,
    required String activityId,
    required String materialKey,
    ObserveLearningActivityUseCase? observeLearningActivityUseCase,
  })  : _observeLearningActivityUseCase =
            observeLearningActivityUseCase ?? getIt(),
        super(LearningActivityState(
          activityId: activityId,
          courseId: courseId,
          materialKey: materialKey,
        )) {
    on<LearningActivityFetched>(
      _handleActivityFetched,
      transformer: restartable(),
    );
    on<LearningActivityLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveLearningActivityUseCase _observeLearningActivityUseCase;

  FutureOr<void> _handleActivityFetched(
      LearningActivityFetched event,
      Emitter<LearningActivityState> emit,
      ) async {
    emit(
      state.copyWith(
        activitiesUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeLearningActivityUseCase(ObserveLearningActivityUseCaseRequest(
        courseId: state.courseId,
        activityId: state.activityId,
      )),
      onData: (result) => state.copyWith(
        activitiesUiState: UiState.fromResultTransform(
          result,
              (summary) => UiLearningActivity.fromDomainModel(summary),
        ),
      ),
      onError: (e, s) => state.copyWith(
        activitiesUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
      LearningActivityLearnerChanged event,
      Emitter<LearningActivityState> emit,
      ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}

import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_learner_event.dart';

part 'course_learner_state.dart';

class CourseLearnerBloc extends Bloc<CourseLearnerEvent, CourseLearnerState> {
  CourseLearnerBloc({
    required String learnerId,
    ObserveCourseLearnerUseCase? observeCourseLearnerUseCase,
  })  : _observeCourseLearnerUseCase = observeCourseLearnerUseCase ?? getIt(),
        super(CourseLearnerState(learnerId: learnerId)) {
    on<CourseLearnerFetched>(
      _handleLearnerFetched,
      transformer: restartable(),
    );
  }

  final ObserveCourseLearnerUseCase _observeCourseLearnerUseCase;

  FutureOr<void> _handleLearnerFetched(
    CourseLearnerFetched event,
    Emitter<CourseLearnerState> emit,
  ) async {
    emit(
      state.copyWith(
        learnerUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseLearnerUseCase(ObserveCourseLearnerUseCaseRequest(
        learnerId: state.learnerId,
      )),
      onData: (result) => state.copyWith(
        learnerUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        learnerUiState: UiStateFailure.fromError(e),
      ),
    );
  }


}

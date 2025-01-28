import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/summary/models/models.dart';
import 'package:ui/ui.dart';

part 'summary_event.dart';

part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc({
    required String courseId,
    required String summaryId,
    required String materialKey,
    required bool isOfflineMode,
    ObserveLearningSummaryUseCase? observeLearningSummaryUseCase,
  })  : _observeLearningSummaryUseCase =
            observeLearningSummaryUseCase ?? getIt(),
        super(SummaryState.create(
          courseId: courseId,
          summaryId: summaryId,
          materialKey: materialKey,
          isOfflineMode: isOfflineMode,
        )) {
    on<SummaryFetched>(
      _handleSummaryFetched,
      transformer: restartable(),
    );
    on<SummaryLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveLearningSummaryUseCase _observeLearningSummaryUseCase;

  FutureOr<void> _handleSummaryFetched(
    SummaryFetched event,
    Emitter<SummaryState> emit,
  ) async {
    emit(
      state.copyWith(
        summaryUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeLearningSummaryUseCase(ObserveLearningSummaryUseCaseRequest(
        courseId: state.courseId,
        summaryId: state.summaryId,
      )),
      onData: (result) => state.copyWith(
        summaryUiState: UiState.fromResultTransform(
          result,
          (summary) => UiSummary.fromDomainModel(summary),
        ),
      ),
      onError: (e, s) => state.copyWith(
        summaryUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
    SummaryLearnerChanged event,
    Emitter<SummaryState> emit,
  ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}

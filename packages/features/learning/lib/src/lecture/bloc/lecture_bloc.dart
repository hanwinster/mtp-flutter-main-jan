import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/lecture/models/models.dart';
import 'package:ui/ui.dart';

part 'lecture_event.dart';

part 'lecture_state.dart';

class LectureBloc extends Bloc<LectureEvent, LectureState> {
  LectureBloc({
    required String lectureId,
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
    ObserveLectureUseCase? observeLectureUseCase,
  })  : _observeLectureUseCase = observeLectureUseCase ?? getIt(),
        super(LectureState.create(
          lectureId: lectureId,
          courseId: courseId,
          materialKey: materialKey,
          isOfflineMode: isOfflineMode,
        )) {
    on<LectureFetched>(
      _handleLectureFetched,
      transformer: restartable(),
    );
    on<LectureLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveLectureUseCase _observeLectureUseCase;

  FutureOr<void> _handleLectureFetched(
    LectureFetched event,
    Emitter<LectureState> emit,
  ) async {
    emit(
      state.copyWith(
        lectureUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeLectureUseCase(ObserveLectureUseCaseRequest(
        courseId: state.courseId,
        lectureId: state.lectureId,
      )),
      onData: (result) => state.copyWith(
        lectureUiState: UiState.fromResultTransform<Lecture, UiLecture>(
          result,
          (lecture) => UiLecture.fromDomainModel(lecture),
        ),
      ),
      onError: (e, s) => state.copyWith(
        lectureUiState: UiStateFailure.fromError(e, s),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
    LectureLearnerChanged event,
    Emitter<LectureState> emit,
  ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}

import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({
    required String sampleId,
    ObserveCourseUseCase? observeCourseUseCase,
  })  : _observeCourseUseCase = observeCourseUseCase ?? getIt(),
        super(CourseState(courseId: sampleId)) {
    on<CourseFetched>(
      _handleCourseFetched,
      transformer: restartable(),
    );
  }

  final ObserveCourseUseCase _observeCourseUseCase;

  FutureOr<void> _handleCourseFetched(
      CourseFetched event,
    Emitter<CourseState> emit,
  ) async {
    emit(
      state.copyWith(
        courseUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseUseCase(ObserveCourseUseCaseRequest(
        courseId: event.courseId,
      )),
      onData: (result) => state.copyWith(
        courseUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        courseUiState: UiStateFailure.fromError(e),
      ),
    );
  }
}

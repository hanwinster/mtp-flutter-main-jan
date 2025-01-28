import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_related_resources_event.dart';
part 'course_related_resources_state.dart';

class CourseRelatedResourcesBloc extends Bloc<CourseRelatedResourcesEvent, CourseRelatedResourcesState> {
  CourseRelatedResourcesBloc({
    required String courseId,
    ObserveCourseRelatedResourcesUseCase? observeCourseRelatedResourcesUseCase,
  })  : _observeCourseRelatedResourcesUseCase = observeCourseRelatedResourcesUseCase ?? getIt(),
        super(CourseRelatedResourcesState.create(courseId: courseId)) {
    on<CourseRelatedResourcesFetched>(
      _handleResourcesFetched,
      transformer: restartable(),
    );
  }

  final ObserveCourseRelatedResourcesUseCase _observeCourseRelatedResourcesUseCase;

  FutureOr<void> _handleResourcesFetched(
      CourseRelatedResourcesFetched event,
    Emitter<CourseRelatedResourcesState> emit,
  ) async {
    emit(
      state.copyWith(
        resourcesUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseRelatedResourcesUseCase(ObserveCourseRelatedResourcesUseCaseRequest(
        courseId: state.courseId,
      )),
      onData: (result) => state.copyWith(
        resourcesUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        resourcesUiState: UiStateFailure.fromError(e),
      ),
    );
  }
}

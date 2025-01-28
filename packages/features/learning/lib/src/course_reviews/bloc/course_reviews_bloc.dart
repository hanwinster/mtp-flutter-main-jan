import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_reviews_event.dart';

part 'course_reviews_state.dart';

class CourseReviewsBloc extends Bloc<CourseReviewsEvent, CourseReviewsState> {
  CourseReviewsBloc({
    required String courseId,
    ObserveCourseReviewsUseCase? observeSampleUseCase,
  })  : _observeCourseReviewsUseCase = observeSampleUseCase ?? getIt(),
        super(CourseReviewsState.create(courseId: courseId)) {
    on<CourseReviewsFetched>(
      _handleReviewsFetched,
      transformer: restartable(),
    );
  }

  final ObserveCourseReviewsUseCase _observeCourseReviewsUseCase;

  FutureOr<void> _handleReviewsFetched(
    CourseReviewsFetched event,
    Emitter<CourseReviewsState> emit,
  ) async {
    emit(
      state.copyWith(
        reviewsUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseReviewsUseCase(ObserveCourseReviewsUseCaseRequest(
        courseId: state.courseId,
      )),
      onData: (result) => state.copyWith(
        reviewsUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        reviewsUiState: UiStateFailure.fromError(e),
      ),
    );
  }
}

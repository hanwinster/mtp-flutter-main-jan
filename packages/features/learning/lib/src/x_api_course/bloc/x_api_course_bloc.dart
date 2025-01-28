import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'x_api_course_event.dart';

part 'x_api_course_state.dart';

class XApiCourseBloc extends Bloc<XApiCourseEvent, XApiCourseState> {
  XApiCourseBloc({
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
    GetXApiCourseUseCase? getApiCourseUseCase,
  })  : _getXApiCourseUseCase = getApiCourseUseCase ?? getIt(),
        super(XApiCourseState.create(
          courseId: courseId,
          materialKey: materialKey,
          isOfflineMode: isOfflineMode,
        )) {
    on<XApiCourseFetched>(
      _handleCourseFetched,
      transformer: restartable(),
    );
    on<XApiCourseCompleted>(
      _handleCourseCompleted,
      transformer: restartable(),
    );
    on<XApiCourseLearnerChanged>(_handleLearnerChanged);
  }

  final GetXApiCourseUseCase _getXApiCourseUseCase;

  Future<void> _handleCourseFetched(
    XApiCourseFetched event,
    Emitter<XApiCourseState> emit,
  ) async {
    emit(
      state.copyWith(
        courseUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _getXApiCourseUseCase(GetXApiCourseUseCaseRequest(
        courseId: state.courseId,
      ));
      emit(
        state.copyWith(
          courseUiState: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching xapi course', e, s);
      emit(state.copyWith(
        courseUiState: UiStateFailure.fromError(e, s),
      ));
    }
  }

  Future<void> _handleCourseCompleted(
    XApiCourseCompleted event,
    Emitter<XApiCourseState> emit,
  ) async {
    emit(
      state.copyWith(
        completedUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _getXApiCourseUseCase(GetXApiCourseUseCaseRequest(
        courseId: state.courseId,
      ));
      emit(
        state.copyWith(
          completedUiState: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching xapi course', e, s);
      emit(state.copyWith(
        completedUiState: UiStateFailure.fromError(e, s),
      ));
    }
  }

  Future<void> _handleLearnerChanged(
    XApiCourseLearnerChanged event,
    Emitter<XApiCourseState> emit,
  ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}

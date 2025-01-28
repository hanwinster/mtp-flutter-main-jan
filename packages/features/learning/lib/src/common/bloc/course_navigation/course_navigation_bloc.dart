import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../models/models.dart';

part 'course_navigation_event.dart';

part 'course_navigation_state.dart';

class CourseNavigationBloc
    extends Bloc<CourseNavigationEvent, CourseNavigationState> {
  CourseNavigationBloc({
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
    UpdateLearningCompletionUseCase? updateLearningCompletionUseCase,
    NavigateOfflineCourseMaterialUseCase? navigateOfflineCourseMaterialUseCase,
  })  : _updateLearningCompletionUseCase =
            updateLearningCompletionUseCase ?? getIt(),
        _navigateOfflineCourseMaterialUseCase =
            navigateOfflineCourseMaterialUseCase ?? getIt(),
        super(
          CourseNavigationState.create(
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          ),
        ) {
    on<CourseNavigationDirectionChanged>(_handleDirectionChanged);
  }

  final UpdateLearningCompletionUseCase _updateLearningCompletionUseCase;
  final NavigateOfflineCourseMaterialUseCase
      _navigateOfflineCourseMaterialUseCase;

  FutureOr<void> _handleDirectionChanged(
    CourseNavigationDirectionChanged event,
    Emitter<CourseNavigationState> emit,
  ) async {
    emit(
      state.copyWith(
        navigationState: const UiStateInProgress(),
      ),
    );

    try {
      if (state.isOfflineMode) {
        final result = await _navigateOfflineCourseMaterialUseCase(
          NavigateOfflineCourseMaterialUseCaseRequest(
            courseId: state.courseId,
            currentSection: state.materialKey,
            direction: event.direction,
          ),
        );
        emit(
          state.copyWith(
            navigationState: result == null
                ? const UiStateEmpty()
                : UiStateSuccess(
                    UiCourseNavigationResult(
                      direction: event.direction,
                      material: result,
                    ),
                  ),
          ),
        );
      } else {
        final result = await _updateLearningCompletionUseCase(
          UpdateLearningCompletionUseCaseRequest(
            courseId: state.courseId,
            currentSection: state.materialKey,
            direction: event.direction,
          ),
        );
        logger.d('Updated learning completion: $result');
        if (result == null) {
          emit(state.copyWith(
            navigationState: const UiStateEmpty(),
          ));
        } else {
          emit(
            state.copyWith(
              navigationState: UiStateSuccess(
                UiCourseNavigationResult(
                  direction: event.direction,
                  material: result,
                ),
              ),
            ),
          );
        }
      }
    } catch (e, s) {
      logger.e('Failed to update learning completion', e, s);
      emit(
        state.copyWith(
          navigationState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}

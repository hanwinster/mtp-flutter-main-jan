import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_completion_event.dart';

part 'course_completion_state.dart';

class CourseCompletionBloc
    extends Bloc<CourseCompletionEvent, CourseCompletionState> {
  CourseCompletionBloc({
    required String courseId,
  }) : super(CourseCompletionState.create(courseId: courseId)) {
    on<CourseCompletionLearnerChanged>(_handleLearnerChanged);
  }

  Future<void> _handleLearnerChanged(
    CourseCompletionLearnerChanged event,
    Emitter<CourseCompletionState> emit,
  ) async {
    emit(state.copyWith(learnerUiState: event.learnerUiState));
  }
}

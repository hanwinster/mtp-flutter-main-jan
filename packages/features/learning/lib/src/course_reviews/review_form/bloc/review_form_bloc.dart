import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/course_reviews/review_form/models/models.dart';
import 'package:ui/ui.dart';

part 'review_form_event.dart';

part 'review_form_state.dart';

class ReviewFormBloc extends Bloc<ReviewFormEvent, ReviewFormState> {
  ReviewFormBloc({
    required String courseId,
    CreateCourseReviewUseCase? createCourseReviewUseCase,
  })  : _createCourseReviewUseCase = createCourseReviewUseCase ?? getIt(),
        super(ReviewFormState.create(courseId: courseId)) {
    on<ReviewFormRatingChanged>(_handleRatingChanged);
    on<ReviewFormRemarkChanged>(_handleCommentChanged);
    on<ReviewFormSubmitted>(_handleSubmitted);
  }

  final CreateCourseReviewUseCase _createCourseReviewUseCase;

  Future<void> _handleRatingChanged(
    ReviewFormRatingChanged event,
    Emitter<ReviewFormState> emit,
  ) async {
    final newValue = RatingState.newValue(state.ratingState, event.rating);
    emit(
      state.copyWith(
        ratingState: newValue,
        ratingError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleCommentChanged(
    ReviewFormRemarkChanged event,
    Emitter<ReviewFormState> emit,
  ) async {
    final newValue = RemarkState.newValue(state.remarkState, event.remark);
    emit(
      state.copyWith(
        remarkState: newValue,
        remarkError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleSubmitted(
    ReviewFormSubmitted event,
    Emitter<ReviewFormState> emit,
  ) async {
    final validatedRating = RatingState.validated(state.ratingState.value);
    final validatedRemark = RemarkState.validated(state.remarkState.value);

    emit(state.copyWith(
      ratingState: validatedRating,
      ratingError: () => validatedRating.displayError,
      remarkState: validatedRemark,
      remarkError: () => validatedRemark.displayError,
    ));

    final isValid = validatedRating.isValid;
    if (!isValid) {
      return;
    }

    emit(state.copyWith(
      formSubmissionUiState: const UiStateInProgress(),
    ));
    try {
      final result =
          await _createCourseReviewUseCase(CreateCourseReviewUseCaseRequest(
        courseId: state.courseId,
        rating: validatedRating.value,
        remark: validatedRemark.value,
      ));
      emit(
        state.copyWith(
          formSubmissionUiState: const UiStateSuccess(NullValue()),
        ),
      );
    } catch (e, s) {
      logger.e('Error submitting review', e, s);
      emit(
        state.copyWith(
          formSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}

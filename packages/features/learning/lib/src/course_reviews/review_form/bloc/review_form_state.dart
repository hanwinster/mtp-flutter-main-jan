part of 'review_form_bloc.dart';

final class ReviewFormState extends Equatable {
  const ReviewFormState({
    required this.courseId,
    this.ratingState = const RatingState.unvalidated(),
    this.ratingError,
    this.remarkState = const RemarkState.unvalidated(),
    this.remarkError,
    this.formSubmissionUiState = const UiStateInitial(),
  });

  final String courseId;
  final RatingState ratingState;
  final FormFieldValidationError? ratingError;
  final RemarkState remarkState;
  final FormFieldValidationError? remarkError;
  final UiState<NullValue> formSubmissionUiState;

  factory ReviewFormState.create({
    required String courseId,
  }) {
    return ReviewFormState(
      courseId: courseId,
    );
  }

  @override
  List<Object?> get props => [
        courseId,
        ratingState,
        ratingError,
        remarkState,
        remarkError,
        formSubmissionUiState,
      ];

  ReviewFormState copyWith({
    String? courseId,
    RatingState? ratingState,
    ValueGetter<FormFieldValidationError?>? ratingError,
    RemarkState? remarkState,
    ValueGetter<FormFieldValidationError?>? remarkError,
    UiState<NullValue>? formSubmissionUiState,
  }) {
    return ReviewFormState(
      courseId: courseId ?? this.courseId,
      ratingState: ratingState ?? this.ratingState,
      ratingError: ratingError != null ? ratingError() : this.ratingError,
      remarkState: remarkState ?? this.remarkState,
      remarkError: remarkError != null ? remarkError() : this.remarkError,
      formSubmissionUiState:
          formSubmissionUiState ?? this.formSubmissionUiState,
    );
  }
}

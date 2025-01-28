part of 'course_learner_bloc.dart';

final class CourseLearnerState extends Equatable {
  const CourseLearnerState({
    required this.learnerId,
    this.learnerUiState = const UiStateInitial(),
  });

  final String learnerId;
  final UiState<CourseLearner> learnerUiState;

  factory CourseLearnerState.create({
    required String courseId,
  }) {
    return CourseLearnerState(
      learnerId: courseId,
    );
  }

  @override
  List<Object> get props => [
        learnerId,
        learnerUiState,
      ];


  CourseLearnerState copyWith({
    String? learnerId,
    UiState<CourseLearner>? learnerUiState,
  }) {
    return CourseLearnerState(
      learnerId: learnerId ?? this.learnerId,
      learnerUiState: learnerUiState ?? this.learnerUiState,
    );
  }
}
part of 'lecture_bloc.dart';

sealed class LectureEvent extends Equatable {
  const LectureEvent();
}

class LectureFetched extends LectureEvent {
  const LectureFetched();

  @override
  List<Object> get props => [];
}

class LectureLearnerChanged extends LectureEvent {
  final UiState<CourseLearner> learnerUiState;

  const LectureLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}
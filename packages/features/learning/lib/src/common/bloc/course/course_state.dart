part of 'course_bloc.dart';

final class CourseState extends Equatable {
  const CourseState({
    required this.courseId,
    this.courseUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<Course> courseUiState;

  factory CourseState.create({
    required String courseId,
  }) {
    return CourseState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        courseUiState,
      ];


  CourseState copyWith({
    String? courseId,
    UiState<Course>? courseUiState,
  }) {
    return CourseState(
      courseId: courseId ?? this.courseId,
      courseUiState: courseUiState ?? this.courseUiState,
    );
  }
}
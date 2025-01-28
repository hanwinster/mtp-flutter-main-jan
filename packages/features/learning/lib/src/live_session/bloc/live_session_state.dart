part of 'live_session_bloc.dart';

final class LiveSessionState extends Equatable {
  const LiveSessionState({
    required this.liveSessionId,
    required this.courseId,
    required this.materialKey,
    this.liveSessionUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String liveSessionId;
  final String courseId;
  final String materialKey;
  final UiState<LiveSession> liveSessionUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory LiveSessionState.create({
    required String activityId,
    required String courseId,
    required String materialKey,
  }) {
    return LiveSessionState(
      liveSessionId: activityId,
      courseId: courseId,
      materialKey: materialKey,
    );
  }

  @override
  List<Object> get props =>
      [
        liveSessionId,
        courseId,
        materialKey,
        liveSessionUiState,
        courseLearnerUiState,
      ];

  LiveSessionState copyWith({
    String? liveSessionId,
    String? courseId,
    String? materialKey,
    UiState<LiveSession>? liveSessionUiState,
    UiState<CourseLearner>? courseLearnerUiState,
  }) {
    return LiveSessionState(
      liveSessionId: liveSessionId ?? this.liveSessionId,
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      liveSessionUiState: liveSessionUiState ?? this.liveSessionUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
    );
  }
}
part of 'course_learner_bloc.dart';

sealed class CourseLearnerEvent extends Equatable {
  const CourseLearnerEvent();
}

class CourseLearnerFetched extends CourseLearnerEvent {
  const CourseLearnerFetched();

  @override
  List<Object> get props => [];
}
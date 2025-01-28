part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeCourseCategoriesFetched extends HomeEvent {
  const HomeCourseCategoriesFetched();

  @override
  List<Object?> get props => [];
}

final class HomeCoursesFetched extends HomeEvent {
  const HomeCoursesFetched();

  @override
  List<Object?> get props => [];
}

final class VersionCheckRequested extends HomeEvent {
  const VersionCheckRequested();
  
  @override
  List<Object?> get props => [];
}

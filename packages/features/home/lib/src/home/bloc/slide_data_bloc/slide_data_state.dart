part of 'slide_data_bloc.dart';

sealed class SlideDataState extends Equatable {
  const SlideDataState();

  @override
  List<Object> get props => [];
}

final class SlideDataInitial extends SlideDataState {}

final class SlideDataLoading extends SlideDataState {}

final class SlideDataLoaded extends SlideDataState {
  final List<SlideModel> slides;

  const SlideDataLoaded({required this.slides});

  @override
  List<Object> get props => [slides];
}

final class SlideDataError extends SlideDataState {
  final UiStateFailure error;

  const SlideDataError({required this.error});

  @override
  List<Object> get props => [error];
}


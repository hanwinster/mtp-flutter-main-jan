part of 'video_cubit.dart';

sealed class VideoState extends Equatable{

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoLoaded extends VideoState {
  final HomePageVideoModel video;

  VideoLoaded({required this.video});

  @override
  List<Object> get props => [video];
}

final class VideoError extends VideoState {
  final String message;

  VideoError({required this.message});

  @override
  List<Object> get props => [message];
}

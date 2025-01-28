part of 'community_video_bloc.dart';

sealed class CommunityVideoState extends Equatable {
  const CommunityVideoState();

  @override
  List<Object> get props => [];
}

final class CommunityVideoInitial extends CommunityVideoState {}

final class CommunityVideoLoading extends CommunityVideoState {}

final class CommunityVideoLoaded extends CommunityVideoState {
  final List<CommunityVideoModel> communityVideos;
  final bool isFirstTimeDataFetched;
  final int timestamp;

  const CommunityVideoLoaded(this.communityVideos, this.isFirstTimeDataFetched, this.timestamp);

  @override
  List<Object> get props => [communityVideos, isFirstTimeDataFetched, timestamp];
}

final class CommunityVideoNoMoreData extends CommunityVideoState {}

final class CommunityVideoError extends CommunityVideoState {
  final String message;

  const CommunityVideoError(this.message);

  @override
  List<Object> get props => [message];
}

final class ChangedVideoTypeState extends CommunityVideoState {
  final String type;

  const ChangedVideoTypeState(this.type);

  @override
  List<Object> get props => [type];
}

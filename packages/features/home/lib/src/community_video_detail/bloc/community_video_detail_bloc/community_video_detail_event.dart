part of 'community_video_detail_bloc.dart';

sealed class CommunityVideoDetailEvent extends Equatable {
  const CommunityVideoDetailEvent();
}

final class GetCommunityVideoDetail extends CommunityVideoDetailEvent {
  final int videoId;
  final int? viewCount;

  const GetCommunityVideoDetail({
    required this.videoId,
    this.viewCount,
  });

  @override
  List<Object> get props => [videoId];
}
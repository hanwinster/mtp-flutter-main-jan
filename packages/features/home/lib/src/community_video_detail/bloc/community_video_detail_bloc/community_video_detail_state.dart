part of 'community_video_detail_bloc.dart';

sealed class CommunityVideoDetailState extends Equatable {
  const CommunityVideoDetailState();

  @override
  List<Object> get props => [];
}

final class CommunityVideoDetailInitial extends CommunityVideoDetailState {}

final class CommunityVideoDetailLoading extends CommunityVideoDetailState {}

final class CommunityVideoDetailSuccess extends CommunityVideoDetailState {
  final CommunityVideoModel communityVideoModel;
  final List<CommunityVideoModel> relatedCommunityVideoList;

  const CommunityVideoDetailSuccess({
    required this.communityVideoModel,
    required this.relatedCommunityVideoList,
  });

  @override
  List<Object> get props => [communityVideoModel, relatedCommunityVideoList];
}

final class CommunityVideoDetailError extends CommunityVideoDetailState {}

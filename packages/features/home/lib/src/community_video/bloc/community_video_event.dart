part of 'community_video_bloc.dart';

sealed class CommunityVideoEvent extends Equatable {
  const CommunityVideoEvent();

  @override
  List<Object?> get props => [];
}

final class GetCommunityVideoListEvent extends CommunityVideoEvent {}

final class GetCommunityVideoListLoadMoreEvent extends CommunityVideoEvent {}

final class SearchCommunityVideoListEvent extends CommunityVideoEvent {
  final String search;

  const SearchCommunityVideoListEvent({
    required this.search,
  });
}

final class ChangeCommunityVideoListTypeEvent extends CommunityVideoEvent {
  final String type;

  const ChangeCommunityVideoListTypeEvent({
    required this.type,
  });
}

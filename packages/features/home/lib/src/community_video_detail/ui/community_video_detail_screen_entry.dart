import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video_detail/bloc/community_video_detail_bloc/community_video_detail_bloc.dart';

import 'community_video_detail_screen.dart';

typedef VideoDetailClickCallback = void Function(String videoId);

class CommunityVideoDetailScreenEntry extends StatelessWidget {
  const CommunityVideoDetailScreenEntry({
    super.key,
    required this.videoId, required this.onCommunityVideoDetailClick,
  });

  final VideoDetailClickCallback onCommunityVideoDetailClick;
  final String videoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityVideoDetailBloc()
        ..add(GetCommunityVideoDetail(videoId: int.parse(videoId), viewCount: 1)),
      child: CommunityVideoDetailScreen(onCommunityVideoDetailClick: onCommunityVideoDetailClick),
    );
  }
}

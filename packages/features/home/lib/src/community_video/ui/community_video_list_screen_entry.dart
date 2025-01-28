import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video/bloc/community_video_bloc.dart';
import 'package:home/src/community_video/ui/community_video_list_screen.dart';

typedef CLVideoDetailClickCallback = void Function(String videoId);

class CommunityVideoListScreenEntry extends StatelessWidget {
  const CommunityVideoListScreenEntry({
    super.key, required this.onCommunityVideoDetailClick,
  });

  final CLVideoDetailClickCallback onCommunityVideoDetailClick;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityVideoBloc()..add(GetCommunityVideoListEvent()),
      child: CommunityVideoListScreen(onCommunityVideoDetailClick: onCommunityVideoDetailClick,),
    );
  }
}

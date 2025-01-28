import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_post_comment_list/bloc/bloc.dart';
import 'package:thematic_group/src/post/detail/bloc/post_detail_bloc.dart';
import 'package:thematic_group/src/post/detail/post_detail_screen.dart';

import '../../group_post_list/bloc/posts_bloc.dart';

typedef OnPostDetailEditTapped = void Function({
  required String group_id,
  required ThematicGroupPost post,
});

class PostDetailScreenEntry extends StatelessWidget {
  final OnPostDetailEditTapped onPostDetailEditTapped;
  final String postId;
  final String groupId;

  const PostDetailScreenEntry({
    super.key,
    required this.postId,
    required this.groupId,
    required this.onPostDetailEditTapped,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostsBloc()..add(PostsFetched(groupId: groupId, pageSize: 15)),
        ),
        BlocProvider(
            create: (context) => PostDetailBloc(
                  postId: postId,
                )..add(PostDetailFetched())),
        BlocProvider(
            create: (context) => GroupPostCommentListBloc(
                  postId: postId,
                  groupId: groupId,
                )..add(const GroupPostCommentListFetched())),
      ],
      child: PostDetailScreen(
        postId: postId,
        groupId: groupId,
        onPostDetailEditTapped: onPostDetailEditTapped,
      ),
    );
  }
}

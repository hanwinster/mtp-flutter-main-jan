import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_edit_screen.dart';
import '../bloc/post_edit_bloc.dart';

typedef OnPostEdited = void Function(GroupPendingPostData pendingPostData);

class PostEditScreenEntry extends StatelessWidget {
  final String postId;
  final String groupId;
  final OnPostEdited onPostCreated;
  final ThematicGroupPost post;

  const PostEditScreenEntry({
    super.key,
    required this.postId,
    required this.groupId,
    required this.onPostCreated,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostEditBloc(
        postId: postId,
      )..add(FectchUserEvent()),
      child: PostEditScreen(
        postId: postId,
        groupId: groupId,
        onPostCreated: onPostCreated,
        post: post
      ),
    );
  }
}

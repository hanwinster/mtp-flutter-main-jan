import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_comment_input_bloc.dart';
import 'post_comment_input.dart';

class PostCommentInputEntry extends StatelessWidget {
  const PostCommentInputEntry({
    super.key,
    required this.postId,
    this.comment,
  });

  final String postId;
  final BlogPostComment? comment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCommentInputBloc(
        postId: postId,
        comment: comment,
      ),
      child: PostCommentInput(
        comment: comment,
      ),
    );
  }
}

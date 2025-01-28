import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_comment_reply_input_bloc.dart';
import 'post_comment_reply_input.dart';

class PostCommentReplyInputEntry extends StatelessWidget {
  const PostCommentReplyInputEntry({
    super.key,
    required this.postId,
    required this.replyToComment,
    this.reply,
  });

  final String postId;
  final ThematicGroupPostComment replyToComment;
  final ThematicGroupPostCommentReply? reply;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCommentReplyInputBloc(
        postId: postId,
        replyToComment: replyToComment,
        reply: reply,
      ),
      child: PostCommentReplyInput(
        reply: reply,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_comment_input_bloc.dart';
import 'post_comment_input.dart';

class PostCommentInputEntry extends StatelessWidget {
  const PostCommentInputEntry({
    super.key,
    required this.postId,
    required this.type
  });

  final String postId;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCommentInputBloc(
        Id: postId,
        type: type
      ),
      child: PostCommentInput(type: type,),
    );
  }
}

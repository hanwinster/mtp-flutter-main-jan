import 'package:blog/blog.dart';
import 'package:blog/src/postdetails/bloc/post_details_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_details_screen.dart';

typedef PostTagTapCallback = void Function(BlogPostTag tag);

typedef TakeQuizTapCallback = void Function({
  required String postId,
  required bool isRetake,
});

typedef MarkAsReadTapCallback = void Function({
  required String postId,
});

class PostDetailsScreenEntry extends StatelessWidget {
  const PostDetailsScreenEntry({
    super.key,
    required this.postId,
    required this.onPostTapped,
    required this.onTagTapped,
    required this.onTakeQuizTapped,
  });

  final String postId;
  final PostTapCallback onPostTapped;
  final PostTagTapCallback onTagTapped;
  final TakeQuizTapCallback onTakeQuizTapped;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostDetailsBloc(postId: postId)
        ..add(const PostDetailsFetched())
        ..add(const PostDetailsCategoriesFetched())
        ..add(const PostDetailsRecommendedPostsFetched())
        ..add(const PostDetailsCommentsFetched()),
      child: PostDetailsScreen(
        onPostTapped: onPostTapped,
        onTagTapped: onTagTapped,
        onTakeQuizTapped: onTakeQuizTapped,
      ),
    );
  }
}

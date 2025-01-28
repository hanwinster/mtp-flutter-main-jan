import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_quiz_bloc.dart';
import 'post_quiz_screen.dart';

typedef PostQuizCompletedCallback = void Function({
  required String postId,
  required BlogPostQuizUserAnswerResult result,
});

class PostQuizScreenEntry extends StatelessWidget {
  const PostQuizScreenEntry({
    super.key,
    required this.postId,
    required this.onPostQuizCompleted,
  });

  final String postId;
  final PostQuizCompletedCallback onPostQuizCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostQuizBloc(
        postId: postId,
      )..add(const PostQuizQuestionsFetched()),
      child: PostQuizScreen(
        onPostQuizCompleted: onPostQuizCompleted,
      ),
    );
  }
}
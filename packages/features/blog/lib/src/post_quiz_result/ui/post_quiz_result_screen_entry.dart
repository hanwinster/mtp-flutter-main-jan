import 'package:blog/src/post_quiz_result/ui/post_quiz_result_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

typedef PostQuizResultClosedCallback = void Function();
typedef PostQuizResultRetakeQuizCallback = void Function({
  required String postId,
});

class PostQuizResultScreenEntry extends StatelessWidget {
  const PostQuizResultScreenEntry({
    super.key,
    required this.postId,
    required this.result,
    required this.onClosed,
    required this.onRetakeQuiz,
  });

  final String postId;
  final BlogPostQuizUserAnswerResult result;
  final PostQuizResultClosedCallback onClosed;
  final PostQuizResultRetakeQuizCallback onRetakeQuiz;

  @override
  Widget build(BuildContext context) {
    return PostQuizResultScreen(
      postId: postId,
      result: result,
      onClosed: onClosed,
      onRetakeQuiz: onRetakeQuiz,
    );
  }
}

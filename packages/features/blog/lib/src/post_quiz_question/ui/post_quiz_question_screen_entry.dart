import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_quiz_question_bloc.dart';
import 'post_quiz_question_screen.dart';

class PostQuizQuestionScreenEntry extends StatelessWidget {
  const PostQuizQuestionScreenEntry({
    super.key,
    required this.postId,
    required this.currentQuestionIndex,
    required this.onPageIndexChanged,
    required this.isFirstQuestion,
    required this.isLastQuestion,
    required this.question,
    required this.onSubmitted,
  });

  final String postId;
  final int currentQuestionIndex;
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final BlogPostQuizQuestion question;
  final Function() onSubmitted;
  final Function(int) onPageIndexChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostQuizQuestionBloc(
        postId: postId,
        currentQuestionIndex: currentQuestionIndex,
        question: question,
        isFirstQuestion: isFirstQuestion,
        isLastQuestion: isLastQuestion,
      ),
      child: PostQuizQuestionScreen(
        currentQuestionIndex: currentQuestionIndex,
        question: question,
        onSubmitted: onSubmitted,
        onPageIndexChanged: onPageIndexChanged,
      ),
    );
  }
}

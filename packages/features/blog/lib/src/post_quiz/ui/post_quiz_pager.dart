import 'package:base/base.dart';
import 'package:blog/src/post_quiz_question/post_quiz_question.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class PostQuizPager extends StatefulWidget {
  const PostQuizPager({
    super.key,
    required this.postId,
    required this.questions,
  });

  final String postId;
  final List<BlogPostQuizQuestion> questions;

  @override
  State<PostQuizPager> createState() => _PostQuizPagerState();
}

class _PostQuizPagerState extends State<PostQuizPager> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = widget.questions.length;
    return BlocListener<PostQuizBloc, PostQuizState>(
      listenWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.questions
            .mapIndexed(
              (index, question) =>
              PostQuizQuestionScreenEntry(
                postId: widget.postId,
                currentQuestionIndex: index,
                question: question,
                isFirstQuestion: index == 0,
                isLastQuestion: index == totalQuestions - 1,
                onPageIndexChanged: (pageIndex) {
                  context
                      .read<PostQuizBloc>()
                      .add(PostQuizPageIndexChanged(pageIndex));
                },
                onSubmitted: () {
                  context
                      .read<PostQuizBloc>()
                      .add(const PostQuizUserAnsweredSubmitted());
                },
              ),
        )
            .toList(),
      ),
    );
  }
}

import 'package:blog/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/post_quiz_bloc.dart';
import 'components/components.dart';
import 'post_quiz_pager.dart';

class PostQuizScreen extends StatelessWidget {
  const PostQuizScreen({
    super.key,
    required this.onPostQuizCompleted,
  });

  final PostQuizCompletedCallback onPostQuizCompleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.blogPostQuizTitle,
          style: context.textTheme.titleMedium,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PostQuizBloc, PostQuizState>(
              listenWhen: (previous, current) =>
                  previous.userAnswersSubmissionUiState !=
                  current.userAnswersSubmissionUiState,
              listener: (context, state) {
                if (state.userAnswersSubmissionUiState is UiStateSuccess) {
                  final result = state.userAnswersSubmissionUiState.dataOrNull;
                  if (result != null) {
                    onPostQuizCompleted(
                      postId: state.postId,
                      result: result,
                    );
                  }
                } else if (state.userAnswersSubmissionUiState
                    is UiStateFailure) {
                  showSnackBar(
                      context,
                      state.userAnswersSubmissionUiState
                          .messageOrEmpty(context));
                }
              })
        ],
        child: BlocBuilder<PostQuizBloc, PostQuizState>(
          buildWhen: (previous, current) =>
              previous.questionsUiState != current.questionsUiState,
          builder: (context, state) {
            return state.questionsUiState.toView(
              context,
              successViewBuilder: (questions) {
                return Column(
                  children: [
                    const PageIndicator(),
                    const SizedBox(height: Grid.two),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Grid.two),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PageNumber(),
                          OverallScore(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PostQuizPager(
                        postId: state.postId,
                        questions: questions,
                      ),
                    ),
                  ],
                );
              },
              onRetried: () {
                context
                    .read<PostQuizBloc>()
                    .add(const PostQuizQuestionsFetched());
              },
            );
          },
        ),
      ),
    );
  }
}

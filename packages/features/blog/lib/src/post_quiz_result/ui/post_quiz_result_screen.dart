import 'dart:math';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../blog.dart';

class PostQuizResultScreen extends StatelessWidget {
  const PostQuizResultScreen({
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
    final isPass = result.isPass;
    final double resultIconSize =
        min(MediaQuery.of(context).size.width * 0.5, 256);
    final resultIcon =
        isPass ? MtpAssets.images.quizPass : MtpAssets.images.quizRetry;
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () => onClosed(),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: Column(
              children: [
                _HeaderSection(
                  result: result,
                ),
                const SizedBox(height: Grid.three),
                resultIcon.svg(
                  width: resultIconSize,
                  height: resultIconSize,
                ),
                const SizedBox(height: Grid.three),
                _ScoreSectionView(
                  result: result,
                  isPass: isPass,
                ),
                const SizedBox(height: Grid.three),
                _CorrectAnswersSection(
                  message: result.text,
                  questions: result.questions,
                ),
                const SizedBox(height: Grid.three),
                _BottomButtonBar(
                  onRetakeQuiz: () {
                    onRetakeQuiz(postId: postId);
                  },
                  onContinue: () {
                    onClosed();
                  },
                ),
                const SizedBox(height: Grid.two),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final BlogPostQuizUserAnswerResult result;

  const _HeaderSection({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final isPass = result.isPass;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          isPass
              ? context.l10n.blogQuizCompletionLabelPass
              : context.l10n.blogQuizCompletionLabelNotPass,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Grid.two),
        Text(
          result.proceedMessage,
          style: context.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ScoreSectionView extends StatelessWidget {
  final BlogPostQuizUserAnswerResult result;
  final bool isPass;

  const _ScoreSectionView({
    required this.result,
    required this.isPass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.l10n.blogQuizCompletionLabelScore,
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: Grid.two),
        RichText(
          text: TextSpan(
            text: (result.score).format(context.locale),
            style: context.textTheme.displaySmall?.copyWith(
              color: isPass
                  ? context.colorScheme.success
                  : context.colorScheme.error,
            ),
            children: [
              TextSpan(
                text: " / ${100.format(context.locale)}",
                style: context.textTheme.displaySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: Grid.two),
        Text(
          context.l10n.blogQuizCompletionLabelQuizType,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CorrectAnswersSection extends StatelessWidget {
  const _CorrectAnswersSection(
      {required this.message, required this.questions});

  final String message;
  final List<BlogPostQuizQuestion> questions;

  List<Widget> _buildAnswerItems(BuildContext context) {
    return questions.mapIndexed((index, question) {
      final formattedAnswers =
          question.correctAnswers.map((e) => parseTextFromHtml(e)).join(', ');
      final formattedIndex = (index + 1).format(context.locale);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Grid.half),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedIndex,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: Grid.one),
            Expanded(
              child: Text(
                formattedAnswers,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MtpHtmlPlainText(
              message,
              textStyle: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: Grid.two),
            ..._buildAnswerItems(context),
          ],
        ),
      ),
    );
  }
}

class _BottomButtonBar extends StatelessWidget {
  const _BottomButtonBar({
    required this.onContinue,
    required this.onRetakeQuiz,
  });

  final Function() onContinue;
  final Function() onRetakeQuiz;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MtpPrimaryButton(
            labelText: context.l10n.blogQuizCompletionButtonTextRetakeQuiz,
            onPressed: () => onRetakeQuiz(),
          ),
        ),
        const SizedBox(width: Grid.one),
        Expanded(
          child: MtpOutlinedButton(
            labelText: context.l10n.blogQuizCompletionButtonTextContinue,
            onPressed: () => onContinue(),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/post_details_bloc.dart';
import '../post_details_screen_entry.dart';

class PostMarkAsReadSection extends StatelessWidget {
  const PostMarkAsReadSection({
    super.key,
    required this.onTakeQuizTapped,
  });

  final TakeQuizTapCallback onTakeQuizTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.postUiState != current.postUiState,
      builder: (context, state) {
        final post = state.postUiState.dataOrNull;
        if (post == null) {
          return const SizedBox.shrink();
        }

        if (post.hasQuiz) {
          if (post.hasRead) {
            return _TakeQuizButton(
              label: context.l10n.postLabelReadAndTookQuiz,
              backgroundColor: context.colorScheme.success,
              icon: const Icon(Icons.check_circle),
              onPressed: () {
                onTakeQuizTapped(postId: post.id, isRetake: false);
              },
            );
          } else {
            return _TakeQuizButton(
              label: context.l10n.postButtonTextTakeQuiz,
              backgroundColor: context.colorScheme.primary,
              onPressed: () {
                onTakeQuizTapped(postId: post.id, isRetake: false);
              },
            );
          }
        } else {
          if (post.hasRead) {
            return _ReadStatusIndicator(
              message: context.l10n.postLabelAlreadyRead,
            );
          }
          return BlocBuilder<PostDetailsBloc, PostDetailsState>(
            buildWhen: (previous, current) =>
                previous.markAsReadSubmissionUiState !=
                current.markAsReadSubmissionUiState,
            builder: (context, state) {
              return MtpPrimarySubmitButton(
                isInProgress: state.markAsReadSubmissionUiState.isInProgress,
                onPressed: () {
                  context.read<PostDetailsBloc>().add(
                        const PostDetailsMarkAsReadRequested(),
                      );
                },
                labelText: context.l10n.postButtonTextMarkAsRead,
              );
            },
          );
        }
      },
    );
  }
}

class _TakeQuizButton extends StatelessWidget {
  const _TakeQuizButton({
    required this.label,
    required this.backgroundColor,
    this.icon,
    required this.onPressed,
  });

  final String label;
  final Color backgroundColor;
  final Function() onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(
        icon: icon!,
        style:
        context.theme.materialThemeData.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
        label: Text(
          label,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ElevatedButton(
        style:
        context.theme.materialThemeData.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

class _ReadStatusIndicator extends StatelessWidget {
  const _ReadStatusIndicator({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: context.colorScheme.outline.withOpacity(0.12)),
        borderRadius: BorderRadius.circular(Grid.half),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Grid.two, vertical: Grid.two),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
      buildWhen: (previous, current) =>
          previous.commentCreatingStatus != current.commentCreatingStatus ||
          previous.commentUpdatingStatus != current.commentUpdatingStatus,
      builder: (context, state) {
        bool isInProgress = state.commentCreatingStatus.isInProgress ||
            state.commentUpdatingStatus.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpOutlinedButton(
            label: Text(context.l10n.postButtonTextSubmitComment),
            onPressed: isInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<PostCommentInputBloc>()
                        .add(const PostCommentInputSubmitted());
                  },
          ),
        );
      },
    );
  }
}

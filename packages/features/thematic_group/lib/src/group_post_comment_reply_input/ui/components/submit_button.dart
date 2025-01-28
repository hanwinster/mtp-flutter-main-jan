import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentReplyInputBloc, PostCommentReplyInputState>(
      buildWhen: (previous, current) =>
          previous.replyCreatingStatus != current.replyCreatingStatus ||
          previous.replyUpdatingStatus != current.replyUpdatingStatus,
      builder: (context, state) {
        bool isInProgress = state.replyCreatingStatus.isInProgress ||
            state.replyUpdatingStatus.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpOutlinedButton(
            label: Text(context.l10n.postButtonTextSubmitComment),
            onPressed: isInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<PostCommentReplyInputBloc>()
                        .add(const PostCommentReplyInputSubmitted());
                  },
          ),
        );
      },
    );
  }
}

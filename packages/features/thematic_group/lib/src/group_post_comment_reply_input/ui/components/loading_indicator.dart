import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentReplyInputBloc, PostCommentReplyInputState>(
      buildWhen: (previous, current) {
        return previous.replyCreatingStatus !=
                current.replyCreatingStatus ||
            previous.replyUpdatingStatus != current.replyUpdatingStatus;
      },
      builder: (context, state) {
        final isInProgress = state.replyCreatingStatus.isInProgress ||
            state.replyUpdatingStatus.isInProgress;
        if (isInProgress) {
          return const MtpLinearProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

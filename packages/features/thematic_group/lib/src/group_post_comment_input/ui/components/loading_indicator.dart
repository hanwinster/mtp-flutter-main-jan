import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
      buildWhen: (previous, current) {
        return previous.commentCreatingStatus !=
                current.commentCreatingStatus ||
            previous.commentUpdatingStatus != current.commentUpdatingStatus;
      },
      builder: (context, state) {
        final isInProgress = state.commentCreatingStatus.isInProgress ||
            state.commentUpdatingStatus.isInProgress;
        if (isInProgress) {
          return const MtpLinearProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

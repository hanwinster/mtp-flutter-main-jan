import 'package:blog/src/postdetails/bloc/post_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class PostLoadingIndicator extends StatelessWidget {
  const PostLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.postUiState != current.postUiState,
      builder: (context, state) {
        if (state.postUiState.isNotInProgress) {
          return const SizedBox.shrink();
        }

        return const Column(
          children: [
            LinearProgressIndicator(
              minHeight: 2,
            ),
            SizedBox(height: Grid.two),
          ],
        );
      },
    );
  }
}

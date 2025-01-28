import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostQuizBloc, PostQuizState>(
      buildWhen: (previous, current) =>
      previous.currentPageIndex != current.currentPageIndex ||
          previous.totalPages != current.totalPages,
      builder: (context, state) {
        return LinearProgressIndicator(
          minHeight: 1,
          value: (state.currentPageIndex + 1) / state.totalPages,
          valueColor: AlwaysStoppedAnimation(context.colorScheme.primary),
          backgroundColor: context.colorScheme.primary.withOpacity(0.2),
        );
      },
    );
  }
}

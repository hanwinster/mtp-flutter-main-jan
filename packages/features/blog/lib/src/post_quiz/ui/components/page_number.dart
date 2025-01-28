import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class PageNumber extends StatelessWidget {
  const PageNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostQuizBloc, PostQuizState>(
      buildWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex ||
          previous.totalPages != current.totalPages,
      builder: (context, state) {
        return Text(
          context.l10n.blogPostQuizLabelFormattedQuestionCount(
            state.currentPageIndex + 1,
            state.totalPages,
          ),
          style: context.textTheme.labelSmall,
        );
      },
    );
  }
}

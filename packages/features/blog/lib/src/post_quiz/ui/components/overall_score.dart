import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class OverallScore extends StatelessWidget {
  const OverallScore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostQuizBloc, PostQuizState>(
      buildWhen: (previous, current) =>
          previous.overallScore != current.overallScore,
      builder: (context, state) {
        return Text(
          context.l10n
              .blogPostQuizLabelFormattedOverallScore(state.overallScore ?? 0),
          style: context.textTheme.labelSmall,
        );
      },
    );
  }
}

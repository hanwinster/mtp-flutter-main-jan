import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/course_learner/bloc.dart';

class CircularLearningProgress extends StatelessWidget {
  final double strokeWidth;
  final double size;
  final Color? progressColor;

  const CircularLearningProgress({
    super.key,
    this.strokeWidth = 1.0,
    this.size = 36.0,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = progressColor ?? context.colorScheme.primary;
    return BlocBuilder<CourseLearnerBloc, CourseLearnerState>(
      buildWhen: (previous, current) =>
          previous.learnerUiState != current.learnerUiState,
      builder: (context, state) {
        return state.learnerUiState.toView(
          context,
          loadingViewBuilder: (data) {
            return SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            );
          },
          successViewBuilder: (learner) {
            final progress = learner.percentage / 100;
            return SizedBox(
              height: size,
              width: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Progress Circle
                  SizedBox(
                    height: size,
                    width: size,
                    child: CircularProgressIndicator(
                      strokeWidth: strokeWidth,
                      value: progress,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      backgroundColor: color.withOpacity(0.12),
                    ),
                  ),
                  // Centered Progress Label
                  Text(
                    '${(progress * 100).toInt().format(context.locale)}%',
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        if (state.isFormSubmissionInProgress) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(
              left: Grid.two, right: Grid.two, bottom: Grid.three),
          child: Align(
            alignment: Alignment.topCenter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SmoothPageIndicator(
                  count: 2,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: 10.0,
                    dotWidth: (constraints.maxWidth - 8) / 2,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 0,
                    dotColor: context.colorScheme.onSurface.withOpacity(0.12),
                    activeDotColor: context.colorScheme.primary,
                  ),
                  controller: pageController,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

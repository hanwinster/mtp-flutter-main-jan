import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/my_courses/bloc/bloc.dart';
import 'package:ui/ui.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({super.key});

  static const ongoingPageIndex = 0;
  static const completedPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBloc, MyCoursesState>(
      buildWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: SegmentedButton<int>(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return context.colorScheme.onPrimary;
                  }
                  return context.colorScheme.onSurface;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return context.colorScheme.primary;
                  }
                  return context.colorScheme.surface;
                },
              ),
            ),
            showSelectedIcon: false,
            multiSelectionEnabled: false,
            segments: [
              ButtonSegment(
                label: Text(context.l10n.ongoing),
                value: ongoingPageIndex,
              ),
              ButtonSegment(
                label: Text(context.l10n.completed),
                value: completedPageIndex,
              ),
            ],
            selected: {state.currentPageIndex},
            onSelectionChanged: (values) {
              context.read<MyCoursesBloc>().add(
                    MyCoursesPageChanged(
                      values.first,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}

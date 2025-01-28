import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/course_navigator.dart';
import 'package:ui/ui.dart';

import '../../bloc/course_navigation/bloc.dart';

class CourseNavigationButtonBar extends StatelessWidget {
  const CourseNavigationButtonBar({
    super.key,
    required this.courseNavigator,
    this.isNextEnabled = true,
    this.isPrevEnabled = true,
  });

  final CourseNavigator courseNavigator;
  final bool isPrevEnabled;
  final bool isNextEnabled;

  @override
  Widget build(BuildContext context) {
    final hasPrevious = courseNavigator.hasPreviousMaterial();
    final hasNext = courseNavigator.hasNextMaterial();
    return BlocListener<CourseNavigationBloc, CourseNavigationState>(
      listenWhen: (previous, current) =>
          previous.navigationState != current.navigationState,
      listener: (context, state) {
        if (state.navigationState is UiStateSuccess) {
          final result = state.navigationState.dataOrNull;
          if (result != null) {
            courseNavigator.navigateToMaterial(
              material: state.navigationState.dataOrThrow.material,
              direction: result.direction,
            );
          }
        } else if (state.navigationState is UiStateFailure) {
          showSnackBar(context, state.navigationState.messageOrEmpty(context));
        }
      },
      child: BlocBuilder<CourseNavigationBloc, CourseNavigationState>(
        buildWhen: (previous, current) =>
            previous.navigationState != current.navigationState,
        builder: (context, state) {
          bool isNavigationInProgress = state.navigationState.isInProgress;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MtpOutlinedButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _onPreviousPressed(
                    context: context,
                    hasPrevious: hasPrevious,
                    isNavigationInProgress: isNavigationInProgress,
                  ),
                  labelText: context.l10n.courseButtonTextPrevious,
                ),
              ),
              const SizedBox(width: Grid.one),
              Expanded(
                child: MtpPrimaryButton(
                  icon: const Icon(Icons.arrow_forward),
                  iconAlignment: IconAlignment.end,
                  onPressed: _onNextPressed(
                    context: context,
                    isNavigationInProgress: isNavigationInProgress,
                  ),
                  labelText: context.l10n.courseButtonTextNext,
                  label: isNavigationInProgress ? const MtpLoading() : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Function()? _onPreviousPressed({
    required BuildContext context,
    required bool hasPrevious,
    required bool isNavigationInProgress,
  }) {
    final isNavigable = hasPrevious && isPrevEnabled && !isNavigationInProgress;
    if (!isNavigable) {
      return null;
    }

    final currentMaterialType = courseNavigator.getCurrentMaterialType();
    final isAssessment = currentMaterialType == CourseMaterialType.assessment;
    if (isAssessment) {
      final previousMaterial = courseNavigator.getPreviousMaterial();
      if (previousMaterial == null) {
        return null;
      } else {
        return () {
          courseNavigator.navigateToMaterial(
            material: previousMaterial,
            direction: CourseNavigationDirection.previous,
          );
        };
      }
    }

    return () {
      final previousMaterial = courseNavigator.getPreviousMaterial();
      if (previousMaterial != null) {
        context.read<CourseNavigationBloc>().add(
              const CourseNavigationDirectionChanged(
                CourseNavigationDirection.previous,
              ),
            );
      }
    };
  }

  Function()? _onNextPressed({
    required BuildContext context,
    required bool isNavigationInProgress,
  }) {
    final isNavigable = isNextEnabled && !isNavigationInProgress;
    if (!isNavigable) {
      return null;
    }

    final currentMaterialType = courseNavigator.getCurrentMaterialType();
    final isAssessment = currentMaterialType == CourseMaterialType.assessment;
    if (isAssessment) {
      final nextMaterial = courseNavigator.getNextMaterial();
      if (nextMaterial == null) {
        return null;
      } else {
        return () {
          courseNavigator.navigateToMaterial(
            material: nextMaterial,
            direction: CourseNavigationDirection.next,
          );
        };
      }
    }

    // context.read<CourseNavigationBloc>().add(
    //     const CourseNavigationAssessmentSubmitted());
    return () {
      context.read<CourseNavigationBloc>().add(
            const CourseNavigationDirectionChanged(
              CourseNavigationDirection.next,
            ),
          );
    };
  }
}

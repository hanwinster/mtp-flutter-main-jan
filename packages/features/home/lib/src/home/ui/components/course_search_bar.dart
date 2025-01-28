import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CourseSearchBar extends StatelessWidget {
  const CourseSearchBar({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(Grid.one),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: context.colorScheme.iconMediumEmphasis,
              ),
              const SizedBox(width: Grid.one),
              Expanded(
                child: Text(context.l10n.homeLabelSearchCourses),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

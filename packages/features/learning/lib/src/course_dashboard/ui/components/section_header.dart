import 'package:flutter/material.dart';
import 'package:learning/src/course_dashboard/ui/components/complete_status_indicator.dart';
import 'package:ui/ui.dart';

class SliverSectionHeader extends StatelessWidget {
  const SliverSectionHeader({
    super.key,
    required this.text,
    this.showCompleteStatusIndicator = true,
    this.onTapped,
  });

  final bool showCompleteStatusIndicator;
  final String text;
  final Function()? onTapped;


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: onTapped,
        child: Text(text, style: context.textTheme.titleSmall),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
    required this.isCompleted,
    this.showCompleteStatusIndicator = true,
  });

  final String text;
  final bool isCompleted;
  final bool showCompleteStatusIndicator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: showCompleteStatusIndicator ? 1 : 0,
          child: CompleteStatusIndicator(isCompleted: isCompleted),
        ),
        const SizedBox(width: Grid.two),
        Expanded(
          child: MtpHtmlPlainText(
            text,
            textStyle: context.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}

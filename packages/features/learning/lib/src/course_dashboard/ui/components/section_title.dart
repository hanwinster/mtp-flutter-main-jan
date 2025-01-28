import 'package:flutter/material.dart';

import 'components.dart';

class SliverSectionTile extends StatelessWidget {
  const SliverSectionTile({
    super.key,
    required this.title,
    required this.isCompleted,
    this.showCompleteStatusIndicator = true,
    required this.onTap,
  });

  final String title;
  final bool isCompleted;
  final bool showCompleteStatusIndicator;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: SectionHeader(
          text: title,
          isCompleted: isCompleted,
          showCompleteStatusIndicator: showCompleteStatusIndicator,
        ),
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
      ),
    );
  }
}

class SliverExpansionSectionTile extends StatelessWidget {
  const SliverExpansionSectionTile({
    super.key,
    required this.title,
    required this.children,
    required this.isCompleted,
  });

  final String title;
  final List<Widget> children;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: SectionHeader(
            text: title,
            isCompleted: isCompleted,
          ),
          tilePadding: EdgeInsets.zero,
          children: children,
        ),
      ),
    );
  }
}

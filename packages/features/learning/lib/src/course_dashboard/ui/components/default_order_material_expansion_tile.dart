import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'components.dart';

class DefaultOrderMaterialExpansionTile extends StatefulWidget {
  const DefaultOrderMaterialExpansionTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.children,
  });

  final String title;
  final bool isCompleted;
  final List<Widget> children;

  @override
  State<DefaultOrderMaterialExpansionTile> createState() => _DefaultOrderMaterialExpansionTileState();
}

class _DefaultOrderMaterialExpansionTileState extends State<DefaultOrderMaterialExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Grid.one),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Grid.one),
          border: Border.all(
            color: context.colorScheme.outline.withOpacity(0.12),
            width: 1,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            listTileTheme: ListTileTheme.of(context).copyWith(
              minLeadingWidth: Grid.zero,
            ),
          ),
          child: ExpansionTile(
            backgroundColor: context.colorScheme.primary.withOpacity(0.15),
            collapsedBackgroundColor:
                context.colorScheme.primary.withOpacity(0.15),
            leading: CompleteStatusIndicator(isCompleted: widget.isCompleted),
            title: MtpHtmlPlainText(
              widget.title,
              textStyle: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            trailing: AnimatedRotation(
              turns: _isExpanded ? 0.5 : 0, // Rotate 180 degrees when expanded
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.expand_more, // Single icon that rotates
                color: context.colorScheme.primary,
              ),
            ),
            children: widget.children,
          ),
        ),
      ),
    );
  }
}

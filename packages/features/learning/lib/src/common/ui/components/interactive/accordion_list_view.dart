import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AccordionListView extends StatefulWidget {
  const AccordionListView({
    super.key,
    required this.items,
  });

  final List<InteractiveAccordion> items;

  @override
  State<AccordionListView> createState() => _AccordionListViewState();
}

class _AccordionListViewState extends State<AccordionListView> {
  final Map<String, bool> _expansionStates = {};
  String _selectedId = '';

  bool _isExpanded(String id) {
    return _expansionStates[id] ?? false;
  }

  bool _isSelected(String id) {
    return _selectedId == id;
  }

  @override
  Widget build(BuildContext context) {
    final totalItems = widget.items.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          border: Border.all(
            color: context.colorScheme.outline.withOpacity(0.56),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.items.mapIndexed(
              (index, item) {
                return _AccordionTile(
                  item: item,
                  isFirst: index == 0,
                  isLast: index == totalItems - 1,
                  isSelected: _isSelected(item.id),
                  isExpanded: _isExpanded(item.id),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _expansionStates[item.id] = isExpanded;
                      if (isExpanded) {
                        _selectedId = item.id;
                      } else {
                        _selectedId = '';
                      }
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AccordionTile extends StatelessWidget {
  const _AccordionTile({
    required this.isFirst,
    required this.isLast,
    required this.item,
    required this.isSelected,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  final bool isFirst;
  final bool isLast;
  final InteractiveAccordion item;
  final bool isSelected;
  final bool isExpanded;
  final Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isSelected ? Grid.half : Grid.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: isFirst ? const Radius.circular(Grid.one) : Radius.zero,
            bottom: isLast ? const Radius.circular(Grid.one) : Radius.zero,
          ),
        ),
        child: ExpansionTile(
          onExpansionChanged: onExpansionChanged,
          title: Text(item.title),
          trailing: Icon(isExpanded ? Icons.remove : Icons.add),
          children: [
            if (item.description.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Grid.two),
                child: MtpHtml(
                  item.description,
                  textStyle: context.textTheme.bodyLarge,
                ),
              ),
            ],
            if (item.imageUrl.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MtpImageViewer(
                        imageUrl: item.imageUrl,
                        heroTag: item.imageUrl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Grid.two),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: MtpImage(
                      item.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Grid.two),
            ],
          ],
        ),
      ),
    );
  }
}

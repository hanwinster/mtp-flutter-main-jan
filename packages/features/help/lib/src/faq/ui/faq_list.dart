import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class FaqList extends StatelessWidget {
  const FaqList({
    super.key,
    required this.items,
  });

  final List<Faq> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Grid.two,
        vertical: Grid.two,
      ),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index];
          return Theme(
            data: context.theme.materialThemeData.copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: Grid.two,
              ),
              title: MtpHtml(
                item.question,
                textStyle: context.textTheme.bodyLarge,
              ),
              children: [
                MtpHtml(item.answer),
              ],
            ),
          );
        },
      ),
    );
  }
}

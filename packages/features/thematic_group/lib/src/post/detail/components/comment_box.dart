import 'package:flutter/material.dart';
import 'package:ui/ui.dart';


class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surfaceContainerHighest,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Grid.one),
              child: Icon(Icons.image,
                  color: context.colorScheme.onSurfaceVariant),
            ),
          ),
        ),
        const SizedBox(width: Grid.one),
        Expanded(
          child: MtpOutlinedButton(
            onPressed: onTap,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.postLabelPlaceholderComment,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        )
      ],
    );
  }
}

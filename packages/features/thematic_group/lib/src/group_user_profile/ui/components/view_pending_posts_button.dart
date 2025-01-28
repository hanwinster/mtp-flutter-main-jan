import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ViewPendingPostsButton extends StatelessWidget {
  const ViewPendingPostsButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffE36363), width: 1),
          foregroundColor: Colors.blue,
        ),
        child: Text(context.l10n.groupButtonTextViewPendingPosts,
            style: context.textTheme.labelMedium
                ?.copyWith(color: const Color(0xffE36363))),
      ),
    );
  }
}

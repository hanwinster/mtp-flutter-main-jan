import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class UserManualContent extends StatelessWidget {
  const UserManualContent({
    super.key,
    required this.manuals,
  });

  final List<UserManual> manuals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Grid.two),
      separatorBuilder: (context, index) => const SizedBox(height: Grid.one),
      itemCount: manuals.length,
      itemBuilder: (context, index) {
        final manual = manuals[index];
        return Material(
          color: context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Grid.one),
          ),
          child: InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse(manual.url))) {
                logger.e('Could not launch ${manual.url}');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(Grid.two),
              child: Text(
                manual.title,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

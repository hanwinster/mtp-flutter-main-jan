import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'components/pending_post_item.dart';

class PendingPostScreen extends StatelessWidget {
  final User user;
  final DateTime createdAt;
  final File? imageUrl;
  final File? uploadedVideoUrl;
  final String? description;

  const PendingPostScreen({
    super.key,
    required this.user,
    required this.imageUrl,
    required this.description,
    required this.uploadedVideoUrl,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          context.l10n.groupLabelWaitingApproval,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: context.colorScheme.success,
                    size: 56,
                  ),
                  const SizedBox(height: Grid.two),
                  Text(
                    "Now Your post is pending to admin's Approval.\nWe will verify you soon",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.l10n.groupLabelPreview,
                style: context.textTheme.titleMedium,
              ),
            ),
            PendingPostItem(
              user: user,
              createdAt: createdAt,
              description: description,
              imageUrl: imageUrl,
              uploadedVideoUrl: uploadedVideoUrl,
            ),
            const Spacer(flex: 2),
            SizedBox(
              width: double.infinity,
              child: MtpPrimaryButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pop(context);
                },
                labelText: context.l10n.groupButtonTextBackToFeed,
              ),
            ),
            const SizedBox(height: Grid.two),
          ],
        ),
      ),
    );
  }
}

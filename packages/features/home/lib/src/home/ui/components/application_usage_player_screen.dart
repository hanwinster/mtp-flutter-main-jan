import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ApplicationUsagePlayerScreen extends StatelessWidget {
  const ApplicationUsagePlayerScreen({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.userGuide,
          style: context.textTheme.titleSmall,
        ),
      ),
      body: MtpVideoFullScreenPlayer(videoUrl: videoUrl)
    );
  }
}

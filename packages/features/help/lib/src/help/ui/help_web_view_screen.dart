import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class HelpWebViewScreen extends StatelessWidget {
  const HelpWebViewScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: MtpWebView(url: url),
    );
  }
}

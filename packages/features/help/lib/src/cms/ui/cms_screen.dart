import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CmsScreen extends StatelessWidget {
  const CmsScreen({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: MtpWebView(url: url),
    );
  }
}
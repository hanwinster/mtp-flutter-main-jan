import 'package:flutter/material.dart';

import 'cms_screen.dart';

class CmsScreenEntry extends StatelessWidget {
  const CmsScreenEntry({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CmsScreen(
      title: title,
      url: url,
    );
  }
}

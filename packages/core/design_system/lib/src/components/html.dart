import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart' as html_parser;
import 'package:url_launcher/url_launcher.dart';

class MtpHtml extends StatelessWidget {
  const MtpHtml(
    this.html, {
    super.key,
    this.textStyle,
  });

  final String html;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: textStyle ?? context.textTheme.bodyLarge,
      onTapImage: (src) {
        final imageUrl = src.sources.firstOrNull?.url;
        if (imageUrl == null) {
          return;
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MtpImageViewer(
              imageUrl: imageUrl,
              heroTag: imageUrl,
            ),
          ),
        );
      },
      onTapUrl: (url) async {
        Uri uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          logger.e('Could not launch $uri');
        }
        return true;
      },
    );
  }
}

String parseTextFromHtml(String htmlContent) {
  // Parse the HTML content
  Document document = html_parser.parse(htmlContent);

  // Extract the plain text from the document
  String plainText = document.body?.text ?? '';

  return plainText.trim();
}

class MtpHtmlPlainText extends StatelessWidget {
  const MtpHtmlPlainText(
    this.html, {
    super.key,
    this.maxLines,
    this.overflow,
    this.textStyle,
  });

  final String html;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      parseTextFromHtml(html),
      maxLines: maxLines,
      overflow: overflow,
      style: textStyle ?? context.textTheme.bodyLarge,
    );
  }
}

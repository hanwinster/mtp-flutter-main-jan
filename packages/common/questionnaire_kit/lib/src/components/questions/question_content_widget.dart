import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

class QuestionContentWidget extends StatelessWidget {
  const QuestionContentWidget({
    super.key,
    required this.content,
    this.style,
    this.padding,
  });

  final QuestionContent content;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (content is EmptyContent) {
      return const SizedBox.shrink();
    }

    Widget? contentWidget;
    if (content is TextContent) {
      contentWidget = _buildTextContent(context, content as TextContent);
    } else if (content is HtmlContent) {
      contentWidget = _buildHtmlContent(context, content as HtmlContent);
    }

    if (contentWidget == null) {
      return const SizedBox.shrink();
    }

    if (padding != null) {
      return Padding(
        padding: padding!,
        child: contentWidget,
      );
    }

    return contentWidget;
  }

  Widget _buildTextContent(BuildContext context, TextContent textContent) {
    return Text(
      textContent.text,
      style: style,
    );
  }

  Widget _buildHtmlContent(BuildContext context, HtmlContent htmlContent) {
    return MtpHtml(
      htmlContent.html,
      textStyle: style,
    );
  }
}

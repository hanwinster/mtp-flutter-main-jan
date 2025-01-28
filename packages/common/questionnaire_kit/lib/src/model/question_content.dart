import 'package:base/base.dart';

abstract class QuestionContent extends Equatable {
  const QuestionContent({
    required this.value,
  });

  final String value;
}

class TextContent extends QuestionContent {
  final String text;

  const TextContent(this.text): super(value: text);

  @override
  List<Object> get props => [text];
}

class HtmlContent extends QuestionContent {
  final String html;

  const HtmlContent(this.html): super(value: html);

  @override
  List<Object> get props => [html];
}

class ImageContent extends QuestionContent {
  final String imageUrl;

  const ImageContent(this.imageUrl): super(value: imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class EmptyContent extends QuestionContent {
  const EmptyContent(): super(value: '');

  @override
  List<Object> get props => [];
}

import 'package:base/base.dart';

class BlogPostTag extends Equatable {
  const BlogPostTag({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
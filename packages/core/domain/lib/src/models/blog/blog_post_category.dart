import 'package:base/base.dart';

class BlogPostCategory extends Equatable {
  final String id;
  final String name;

  const BlogPostCategory({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
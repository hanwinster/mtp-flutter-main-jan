import 'package:base/base.dart';

class Subject extends Equatable {

  final String id;
  final String title;
  final String slug;
  final int published;
  final int weight;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;


  const Subject({
    required this.id,
    required this.title,
    required this.slug,
    required this.published,
    required this.weight,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props =>
      [id, title, slug, published, weight, deletedAt, createdAt, updatedAt,];
}
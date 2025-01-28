import 'package:base/base.dart';

class SlideModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final int weight;
  final int published;
  final String createdAt;
  final String updatedAt;
  final SlideImageModel slide;

  const SlideModel({
    required this.id,
    required this.title,
    required this.description,
    required this.weight,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.slide,
  });

  @override
  List<Object> get props => [
    id,
    title,
    description,
    weight,
    published,
    createdAt,
    updatedAt,
    slide,
  ];
}


class SlideImageModel extends Equatable {
  final String original;
  final String thumb;
  final String medium;
  final String large;

  const SlideImageModel({
    required this.original,
    required this.thumb,
    required this.medium,
    required this.large,
  });

  @override
  List<Object> get props => [original, thumb, medium, large];
}
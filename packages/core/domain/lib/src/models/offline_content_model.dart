import 'package:base/base.dart';
import 'package:domain/src/models/step_model.dart';

class OfflineContentModel extends Equatable {
  final int id;
  final String title;
  final String titleMM;
  final List<StepModel> steps;
  final String slug;
  final int published;
  final int userId;
  final String createdAt;
  final String updatedAt;

  const OfflineContentModel({
    required this.id,
    required this.title,
    required this.titleMM,
    required this.steps,
    required this.slug,
    required this.published,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        titleMM,
        steps,
        slug,
        published,
        userId,
        createdAt,
        updatedAt,
      ];
}
import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class LearningActivityEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final MediaEntity? media;
  final String courseId;
  final String lectureId;
  final List<InteractiveFeatureEntity> interactiveFeatures;

  const LearningActivityEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.media,
    required this.courseId,
    required this.lectureId,
    required this.interactiveFeatures,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        media,
        courseId,
        lectureId,
        interactiveFeatures,
      ];

  LearningActivity toDomainModel() {
    return LearningActivity(
      id: id,
      title: title,
      description: description,
      media: media?.toDomainModel(),
      lectureId: lectureId,
      interactiveFeatures: interactiveFeatures.map((e) => e.toDomainModel()).toList(),
    );
  }
}

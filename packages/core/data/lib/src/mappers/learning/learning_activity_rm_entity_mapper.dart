import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';

import '../mappers.dart';

extension LearningActivityRMEntityMapper on LearningActivityRM {
  LearningActivityEntity toEntity() {
    return LearningActivityEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      media: _parseLearningActivityMedia(),
      courseId: courseId?.toString() ?? '',
      lectureId: lectureId?.toString() ?? '',
      interactiveFeatures:
          interactiveFeatures?.map((e) => e.toEntity()).toList() ?? [],
    );
  }

  MediaEntity? _parseLearningActivityMedia() {
    return mediaList
        ?.firstWhereOrNull(
          (element) => element.modelId == id,
    )
        ?.toEntity();
  }
}

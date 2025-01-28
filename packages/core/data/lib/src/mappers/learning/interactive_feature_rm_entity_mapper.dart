import 'package:api/api.dart';
import 'package:database/database.dart';

import '../mappers.dart';

extension InteractiveFeatureRMEntityMapper on InteractiveFeatureRM {
  InteractiveFeatureEntity toEntity() {
    return InteractiveFeatureEntity(
      id: id?.toString() ?? '',
      title: title ?? '',
      courseId: courseId?.toString() ?? '',
      attachedTo: attachedTo?.toString() ?? '',
      attachedToId: attachedToId?.toString() ?? '',
      type: type?.toEntity() ?? InteractiveFeatureTypeEntity.unknown,
      position: position ?? -1,
      placement: placement?.toEntity() ?? InteractiveFeaturePlacementEntity.unknown,
      description: description ?? '',
      backTitle: backTitle ?? '',
      backDescription: backDescription ?? '',
      options: answers?.map((e) => e.toEntity()).toList(),
      correctAnswer: rightAnswer ?? -1,
      image: image ?? '',
      backImage: backImage ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      deletedAt: null,
    );
  }
}

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';

import '../mappers.dart';

extension LearningSummaryRMEntityMapper on LearningSummaryRM {
  LearningSummaryEntity toEntity() {
    return LearningSummaryEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      title: title ?? '',
      description: description ?? '',
      media: _parseSummaryMedia(),
      courseId: courseId?.toString() ?? '',
      lectureId: lectureId?.toString() ?? '',
        interactiveFeatures: interactiveFeatures?.map((e) => e.toEntity()).toList() ?? []
    );
  }

  MediaEntity? _parseSummaryMedia() {
    return mediaList
        ?.firstWhereOrNull(
          (element) => element.modelId == id,
    )
        ?.toEntity();
  }
}

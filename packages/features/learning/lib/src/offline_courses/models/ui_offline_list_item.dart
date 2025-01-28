import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class UiOfflineListItem extends Equatable {
  const UiOfflineListItem();
}

class UiOfflineCourseItem extends UiOfflineListItem {
  const UiOfflineCourseItem({
    required this.course,
  });

  final OfflineCourse course;

  @override
  List<Object> get props => [course];
}

class UiOfflineCourseMediaItem extends UiOfflineListItem {
  const UiOfflineCourseMediaItem({
    required this.courseMedia,
  });

  final OfflineCourseMedia courseMedia;

  @override
  List<Object> get props => [courseMedia];
}

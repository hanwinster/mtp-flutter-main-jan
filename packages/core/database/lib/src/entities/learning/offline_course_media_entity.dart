import 'package:base/base.dart';
import 'package:domain/domain.dart';

class OfflineCourseMediaEntity extends Equatable {
  final String id;
  final String courseId;
  final String url;
  final String title;
  final String thumbnail;

  const OfflineCourseMediaEntity({
    required this.id,
    required this.courseId,
    required this.url,
    required this.title,
    required this.thumbnail,
  });

  @override
  List<Object> get props => [id, courseId, url, title, thumbnail];

  OfflineCourseMedia toDomainModel() {
    return OfflineCourseMedia(
      id: id,
      courseId: courseId,
      url: url,
      title: title,
      thumbnail: thumbnail,
    );
  }
}

import 'package:base/base.dart';

class OfflineCourseMedia extends Equatable {
  final String id;
  final String courseId;
  final String title;
  final String url;
  final String thumbnail;

  const OfflineCourseMedia({
    required this.id,
    required this.courseId,
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  @override
  List<Object> get props => [
        id,
        courseId,
        title,
        url,
        thumbnail,
      ];
}

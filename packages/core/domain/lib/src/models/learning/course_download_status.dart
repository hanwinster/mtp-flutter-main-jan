import 'package:base/base.dart';

class CourseDownloadStatus extends Equatable {
  final String courseId;
  final String downloadRecordJson;
  final bool isHandled;

  const CourseDownloadStatus({
    required this.courseId,
    required this.downloadRecordJson,
    this.isHandled = false,
  });

  @override
  List<Object> get props => [
        courseId,
        downloadRecordJson,
        isHandled,
      ];
}

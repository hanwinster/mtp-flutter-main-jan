import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseDownloadStatusEntity extends Equatable {
  final String courseId;
  final String downloadTaskId;
  final String downloadRecordJson;
  final bool isHandled;

  const CourseDownloadStatusEntity({
    required this.courseId,
    required this.downloadTaskId,
    required this.downloadRecordJson,
    required this.isHandled,
  });

  @override
  List<Object?> get props => [
        courseId,
        downloadTaskId,
        downloadRecordJson,
        isHandled,
      ];

  CourseDownloadStatus toDomainModel() {
    return CourseDownloadStatus(
      courseId: courseId,
      downloadRecordJson: downloadRecordJson,
      isHandled: isHandled,
    );
  }

  CourseDownloadStatusEntity copyWith({
    String? courseId,
    String? downloadTaskId,
    String? downloadRecordJson,
    bool? isHandled,
  }) {
    return CourseDownloadStatusEntity(
      courseId: courseId ?? this.courseId,
      downloadTaskId: downloadTaskId ?? this.downloadTaskId,
      downloadRecordJson: downloadRecordJson ?? this.downloadRecordJson,
      isHandled: isHandled ?? this.isHandled,
    );
  }
}

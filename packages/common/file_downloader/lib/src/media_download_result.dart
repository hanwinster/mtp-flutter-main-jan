import 'package:base/base.dart';

sealed class MediaDownloadResult extends Equatable {
  const MediaDownloadResult();
}

class MediaDownloadResultEnqueued extends MediaDownloadResult {
  final String taskId;
  final String filePath;

  const MediaDownloadResultEnqueued({
    required this.taskId,
    required this.filePath
  });

  @override
  List<Object> get props => [taskId, filePath];
}

class MediaDownloadResultFileExists extends MediaDownloadResult {
  final String filePath;

  const MediaDownloadResultFileExists({
    required this.filePath
  });

  @override
  List<Object> get props => [filePath];
}

class MediaDownloadResultError extends MediaDownloadResult {
  const MediaDownloadResultError({
    required this.errorMessage
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

}

class MediaDownloadResultUnknownError extends MediaDownloadResult {
  const MediaDownloadResultUnknownError();

  @override
  List<Object> get props => [];
}
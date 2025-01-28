part of 'media_downloader_bloc.dart';

sealed class MediaDownloaderEvent extends Equatable {
  const MediaDownloaderEvent();
}

class MediaDownloadRequested extends MediaDownloaderEvent {
  const MediaDownloadRequested({
    required this.courseId,
    required this.url,
  });

  final String courseId;
  final String url;

  @override
  List<Object> get props => [courseId, url];
}

class MediaDownloadSuccess extends MediaDownloaderEvent {
  const MediaDownloadSuccess({
    required this.courseId,
    required this.url,
    required this.title,
  });

  final String courseId;
  final String url;
  final String title;

  @override
  List<Object> get props => [courseId, url, title];
}
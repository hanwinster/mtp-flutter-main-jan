part of 'file_download_bloc.dart';

sealed class FileDownloadEvent extends Equatable {
  const FileDownloadEvent();
}

class FileDownloadRequested extends FileDownloadEvent {
  final String url;
  final Media media;

  const FileDownloadRequested({
    required this.url,
    required this.media,
  });

  @override
  List<Object> get props => [url, media];
}

class FileDownloadErrorShown extends FileDownloadEvent {
  const FileDownloadErrorShown();

  @override
  List<Object> get props => [];
}

class FileDownloadCompleted extends FileDownloadEvent {
  const FileDownloadCompleted(this.filePath,);

  final String filePath;

  @override
  List<Object> get props => [filePath];
}

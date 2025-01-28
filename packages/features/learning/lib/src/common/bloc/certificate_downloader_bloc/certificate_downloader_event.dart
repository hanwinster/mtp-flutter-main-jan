part of 'certificate_downloader_bloc.dart';

sealed class CertificateDownloaderEvent extends Equatable {
  const CertificateDownloaderEvent();
}

class CertificateDownloaderDownloadRequested extends CertificateDownloaderEvent {
  const CertificateDownloaderDownloadRequested({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object> get props => [courseId];
}
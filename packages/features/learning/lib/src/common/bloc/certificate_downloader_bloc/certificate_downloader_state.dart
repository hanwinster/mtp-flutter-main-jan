part of 'certificate_downloader_bloc.dart';

class CertificateDownloaderState extends Equatable {
  const CertificateDownloaderState({
    this.downloadUiState = const UiStateInitial(),
  });

  final UiState<String> downloadUiState;

  factory CertificateDownloaderState.create() =>
      const CertificateDownloaderState();

  @override
  List<Object> get props => [downloadUiState];

  CertificateDownloaderState copyWith({
    UiState<String>? downloadUiState,
  }) {
    return CertificateDownloaderState(
      downloadUiState: downloadUiState ?? this.downloadUiState,
    );
  }
}

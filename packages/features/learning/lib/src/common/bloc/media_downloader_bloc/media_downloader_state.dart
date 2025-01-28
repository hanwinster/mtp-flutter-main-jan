part of 'media_downloader_bloc.dart';

class MediaDownloaderState extends Equatable {
  const MediaDownloaderState({
    this.downloadUiState = const UiStateInitial(),
  });

  final UiState<String> downloadUiState;

  factory MediaDownloaderState.create() =>
      const MediaDownloaderState();

  @override
  List<Object> get props => [downloadUiState];

  MediaDownloaderState copyWith({
    UiState<String>? downloadUiState,
  }) {
    return MediaDownloaderState(
      downloadUiState: downloadUiState ?? this.downloadUiState,
    );
  }
}

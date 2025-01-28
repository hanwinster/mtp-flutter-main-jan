part of 'file_download_bloc.dart';

class FileDownloadState extends Equatable {
  const FileDownloadState({
    this.taskId = '',
    this.filePath = '',
    this.downloadUiState = const UiStateInitial(),
  });

  final String taskId;
  final String filePath;
  final UiState<String> downloadUiState;

  factory FileDownloadState.empty() => const FileDownloadState();

  @override
  List<Object> get props => [taskId, filePath, downloadUiState];

  FileDownloadState copyWith({
    String? taskId,
    String? filePath,
    UiState<String>? downloadUiState,
  }) {
    return FileDownloadState(
      taskId: taskId ?? this.taskId,
      filePath: filePath ?? this.filePath,
      downloadUiState: downloadUiState ?? this.downloadUiState,
    );
  }
}

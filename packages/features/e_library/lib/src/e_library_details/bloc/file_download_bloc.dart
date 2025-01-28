import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'file_download_event.dart';

part 'file_download_state.dart';

class FileDownloadBloc extends Bloc<FileDownloadEvent, FileDownloadState> {
  FileDownloadBloc({
    MtpFileDownloader? fileDownloader,
  })  : _fileDownloader = fileDownloader ?? getIt(),
        super(FileDownloadState.empty()) {
    on<FileDownloadRequested>(_handleDownloadRequested);
    on<FileDownloadErrorShown>(_handleErrorShown);
    on<FileDownloadCompleted>(_handleDownloadCompleted);
  }

  final MtpFileDownloader _fileDownloader;

  Future<void> _handleDownloadRequested(
    FileDownloadRequested event,
    Emitter<FileDownloadState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          downloadUiState: const UiStateInProgress(),
        ),
      );

      final result = await _fileDownloader.downloadPublicMedia(
          url: event.url, filename: event.media.fileName);
      switch (result) {
        case MediaDownloadResultEnqueued():
          emit(
            state.copyWith(
              taskId: result.taskId,
              filePath: result.filePath,
            ),
          );
          break;
        case MediaDownloadResultFileExists():
          emit(
            state.copyWith(
              downloadUiState: UiStateSuccess(result.filePath),
            ),
          );
          break;
        case MediaDownloadResultError():
          emit(
            state.copyWith(
              downloadUiState: UiStateFailure.client(result.errorMessage),
            ),
          );
          break;
        case MediaDownloadResultUnknownError():
          emit(
            state.copyWith(
              downloadUiState: UiStateFailure.other(
                  'Oops! Something went wrong. Please try again.'),
            ),
          );
          break;
      }
    } catch (e, s) {
      logger.e('Error downloading file', e, s);
      emit(
        state.copyWith(
          downloadUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleErrorShown(
    FileDownloadErrorShown event,
    Emitter<FileDownloadState> emit,
  ) async {
    emit(
      state.copyWith(
        downloadUiState: const UiStateInitial(),
      ),
    );
  }

  Future<void> _handleDownloadCompleted(
    FileDownloadCompleted event,
    Emitter<FileDownloadState> emit,
  ) async {
    emit(
      state.copyWith(
        downloadUiState: UiStateSuccess(event.filePath),
      ),
    );
  }
}

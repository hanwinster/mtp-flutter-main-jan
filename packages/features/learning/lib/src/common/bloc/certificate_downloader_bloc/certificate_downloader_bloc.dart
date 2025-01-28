import 'dart:async';

import 'package:base/base.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'certificate_downloader_event.dart';

part 'certificate_downloader_state.dart';

class CertificateDownloaderBloc
    extends Bloc<CertificateDownloaderEvent, CertificateDownloaderState> {
  CertificateDownloaderBloc({
    MtpFileDownloader? fileDownloader,
  })  : _fileDownloader = fileDownloader ?? getIt(),
        super(CertificateDownloaderState.create()) {
    on<CertificateDownloaderDownloadRequested>(
      _handleDownloadRequested,
    );
  }

  final MtpFileDownloader _fileDownloader;
  final Map<String, Future<void>> _activeDownloads = {};

  FutureOr<void> _handleDownloadRequested(
    CertificateDownloaderDownloadRequested event,
    Emitter<CertificateDownloaderState> emit,
  ) async {
    final courseId = event.courseId;

    try {
      if (_activeDownloads.containsKey(courseId)) {
        // Prevent multiple downloads for the same course
        return;
      }

      emit(state.copyWith(
        downloadUiState: const UiStateInProgress(),
      ));

      final filePath = await _fileDownloader.downloadCertificate(courseId);
      _activeDownloads.remove(courseId);
      emit(state.copyWith(
        downloadUiState: UiStateSuccess(filePath),
      ));
      logger.d('Downloaded certificate for course $courseId');
    } catch (e, s) {
      logger.e('Error downloading certificate', e, s);
    }
  }
}

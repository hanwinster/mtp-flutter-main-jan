import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_cache/offline_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui/ui.dart';

part 'media_downloader_event.dart';

part 'media_downloader_state.dart';

class MediaDownloaderBloc
    extends Bloc<MediaDownloaderEvent, MediaDownloaderState> {
  MediaDownloaderBloc({
    SaveOfflineCourseMediaUseCase? saveOfflineCourseMediaUseCase,
    MtpFileDownloader? fileDownloader,
  })  :
        _saveOfflineCourseMediaUseCase = saveOfflineCourseMediaUseCase ?? getIt(),
        _fileDownloader = fileDownloader ?? getIt(),
        super(MediaDownloaderState.create()) {
    on<MediaDownloadRequested>(
      _handleDownloadRequested,
    );
    on<MediaDownloadSuccess>(
      _handleDownloadSuccess,
    );
  }

  final SaveOfflineCourseMediaUseCase _saveOfflineCourseMediaUseCase;
  final MtpFileDownloader _fileDownloader;

  FutureOr<void> _handleDownloadRequested(
    MediaDownloadRequested event,
    Emitter<MediaDownloaderState> emit,
  ) async {
    final courseId = event.courseId;
    final url = event.url;

    try {
      await _fileDownloader.downloadCourseMedia(courseId: courseId, url: url);
      logger.d('Downloaded media for course $courseId');
    } catch (e, s) {
      logger.e('Error downloading media', e, s);
    }
  }

  Future<void> _handleDownloadSuccess(
    MediaDownloadSuccess event,
    Emitter<MediaDownloaderState> emit,
  ) async {
    try {

      final dir = await getTemporaryDirectory();
      final fileInfo = await OfflineCacheManager().cacheOfflineFile(
        url: event.url,
        filePath: '${dir.path}/${getFileNameFromUrl(event.url)}',
        fileExtension: getExtension(event.url),
      );

      logger.d('File cached: ${fileInfo.path}');
      logger.d('Save media: url: ${event.url}, filePath: ${event.title}');
      await _saveOfflineCourseMediaUseCase(
        SaveOfflineCourseMediaUseCaseRequest(
          courseId: event.courseId,
          url: event.url,
          title: event.title,
        ),
      );
    } catch (e, s) {
      logger.e('Error saving media', e, s);
    }
  }

  String getFileNameFromUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.pathSegments.last;
  }

}

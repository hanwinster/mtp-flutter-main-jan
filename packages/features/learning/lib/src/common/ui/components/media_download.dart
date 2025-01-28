import 'dart:isolate';
import 'dart:ui';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ui/ui.dart';

import '../../bloc/media_downloader_bloc/media_downloader_bloc.dart';

class MediaDownload extends StatelessWidget {
  const MediaDownload({
    super.key,
    required this.courseId,
    required this.url,
    required this.title,
  });

  final String courseId;
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    final type = MediaType.fromUrl(url);
    if (type != MediaType.video && type != MediaType.pdf) {
      return const SizedBox();
    }

    return BlocProvider(
      create: (context) => MediaDownloaderBloc(),
      child: SizedBox(
        width: double.infinity,
        child: _MediaDownloadButton(
          courseId: courseId,
          url: url,
          title: title,
        ),
      ),
    );
  }
}

class _MediaDownloadButton extends StatefulWidget {
  const _MediaDownloadButton({
    required this.courseId,
    required this.url,
    required this.title,
  });

  final String title;
  final String courseId;
  final String url;

  @override
  State<_MediaDownloadButton> createState() => _MediaDownloadButtonState();
}

class _MediaDownloadButtonState extends State<_MediaDownloadButton> {
  final ReceivePort _port = ReceivePort();
  int _progress = 0;
  DownloadTaskStatus _status = DownloadTaskStatus.undefined;

  @override
  void initState() {
    super.initState();

    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback, step: 1);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        logger.d('Download button pressed: $_status');
        if (_status != DownloadTaskStatus.enqueued &&
            _status != DownloadTaskStatus.running) {
          context.read<MediaDownloaderBloc>().add(MediaDownloadRequested(
              courseId: widget.courseId, url: widget.url));
        }
      },
      child: Text(getButtonText(_status)),
    );
  }

  String getButtonText(DownloadTaskStatus status) {
    if (status == DownloadTaskStatus.enqueued ||
        status == DownloadTaskStatus.running) {
      return "${context.l10n.eLibraryDownloading} $_progress %";
    } else if (status == DownloadTaskStatus.complete) {
      return context.l10n.eLibraryDownloadComplete;
    } else {
      return context.l10n.eLibraryDownload;
    }
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;

      setState(() {
        _status = status;
        _progress = progress;
      });

      if (progress == 100 && status == DownloadTaskStatus.complete) {
        context.read<MediaDownloaderBloc>().add(MediaDownloadSuccess(
              courseId: widget.courseId,
              url: widget.url,
              title: widget.title,
            ));
      } else if (status == DownloadTaskStatus.failed) {
        showSnackBar(context, 'Download failed. Please try again.');
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    print(
      'Callback on background isolate: '
      'task ($id) is in status ($status) and process ($progress)',
    );

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }
}

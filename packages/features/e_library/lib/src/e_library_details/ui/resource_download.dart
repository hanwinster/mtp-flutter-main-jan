import 'dart:isolate';
import 'dart:ui';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:e_library/src/e_library_details/bloc/file_download_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_filex/open_filex.dart';
import 'package:ui/ui.dart';

class ResourceDownload extends StatelessWidget {
  const ResourceDownload({
    super.key,
    required this.url,
    required this.media,
  });

  final String url;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileDownloadBloc(),
      child: SizedBox(
        width: double.infinity,
        child: _ResourceDownloadButton(
          url: url,
          media: media,
        ),
      ),
    );
  }
}

class _ResourceDownloadButton extends StatefulWidget {
  const _ResourceDownloadButton({
    required this.url,
    required this.media,
  });

  final String url;
  final Media media;

  @override
  State<_ResourceDownloadButton> createState() =>
      _ResourceDownloadButtonState();
}

class _ResourceDownloadButtonState extends State<_ResourceDownloadButton> {
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
    return BlocListener<FileDownloadBloc, FileDownloadState>(
      listenWhen: (previous, current) {
        return previous.downloadUiState != current.downloadUiState;
      },
      listener: (context, state) {
        if (state.downloadUiState is UiStateSuccess) {
          final filePath =
              (state.downloadUiState as UiStateSuccess).dataOrNull ?? '';
          if (filePath.isEmpty) {
            return;
          }

          showSnackBar(
            context,
            context.l10n.eLibraryDownloadComplete,
            action: SnackBarAction(
              label: context.l10n.eLibraryDownloadPathOpen,
              onPressed: () {
                _openFile(filePath);
              },
            ),
          );
        } else if (state.downloadUiState is UiStateFailure) {
          showSnackBar(context, state.downloadUiState.messageOrEmpty(context));
        }
      },
      child: ElevatedButton(
        onPressed: widget.url.isNotEmpty
            ? () {
                logger.d('Download button pressed: $_status');
                if (_status != DownloadTaskStatus.enqueued &&
                    _status != DownloadTaskStatus.running) {
                  context.read<FileDownloadBloc>().add(
                        FileDownloadRequested(
                          url: widget.url,
                          media: widget.media,
                        ),
                      );
                }
              }
            : null,
        child: Text(getButtonText(_status)),
      ),
    );
  }

  void _openFile(String filePath) async {
    final result = await OpenFilex.open(filePath);
    logger.d("Open file result: $result");
  }

  String getButtonText(DownloadTaskStatus status) {
    if (status == DownloadTaskStatus.enqueued ||
        status == DownloadTaskStatus.running) {
      return "${context.l10n.eLibraryDownloading} ${context.l10n.eLibraryDownloadPercent(_progress)}";
    } else if (status == DownloadTaskStatus.complete) {
      return context.l10n.eLibraryDownloadComplete;
    } else {
      return '${context.l10n.eLibraryDownload} (${widget.media.humanReadableSize})';
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
      final currentFileTaskId = context.read<FileDownloadBloc>().state.taskId;
      final filePath = context.read<FileDownloadBloc>().state.filePath;

      final taskId = (data as List<dynamic>)[0] as String;
      if (currentFileTaskId.isNotEmpty && taskId != currentFileTaskId) {
        return;
      }

      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;

      setState(() {
        _status = status;
        _progress = progress;
      });

      if (progress == 100 && status == DownloadTaskStatus.complete) {
        context.read<FileDownloadBloc>().add(FileDownloadCompleted(filePath));
      } else if (status == DownloadTaskStatus.failed) {
        showSnackBar(context, context.l10n.eLibraryDownloadFail);
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

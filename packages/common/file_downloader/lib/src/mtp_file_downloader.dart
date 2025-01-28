import 'dart:convert';
import 'dart:io';

import 'package:api/api.dart';
import 'package:archive/archive_io.dart';
import 'package:background_downloader/background_downloader.dart' as bd;
import 'package:base/base.dart';
import 'package:data/data.dart';
import 'package:database/database.dart';
import 'package:dio/dio.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart' as fd;
import 'package:offline_cache/offline_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:preferences/preferences.dart';
import 'package:uuid/uuid.dart';


class MtpFileDownloader {
  static MtpFileDownloader? _instance;

  MtpFileDownloader._privateConstructor({
    required this.offlineCourseDao,
    required this.courseDownloadStatusDao,
    required this.prefs,
    required this.api,
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;

  final MtpApi api;
  final PreferencesDataSource prefs;
  final OfflineCourseDao offlineCourseDao;
  final CourseDownloadStatusDao courseDownloadStatusDao;
  final String _apiBaseUrl;

  static Future<MtpFileDownloader> getInstance({
    required String apiBaseUrl,
    MtpApi? api,
    OfflineCourseDao? offlineCourseDao,
    CourseDownloadStatusDao? courseDownloadStatusDao,
    PreferencesDataSource? prefs,
  }) async {
    if (_instance == null) {
      _instance = MtpFileDownloader._privateConstructor(
        apiBaseUrl: apiBaseUrl,
        offlineCourseDao: offlineCourseDao ?? getIt(),
        courseDownloadStatusDao: courseDownloadStatusDao ?? getIt(),
        prefs: prefs ?? getIt(),
        api: api ?? getIt(),
      );
      await _instance!._initialize();
    }
    return _instance!;
  }

  Future<void> _initialize() async {
    await _setupFileDownloader();
  }

  static const String _filenameResourceMapper = 'resource_mapper.json';

  final String _groupIdCourses = 'courses';
  final List<String> _downloadingCourseTaskIds = [];
  static List<String> courseIncludes = [
    'categories',
    'level',
    'type',
    'learner',
    'lectures',
    'learningActivities',
    'quizzes',
    'liveSessions',
    'summaries',
    'quizzes.questions',
    'quizzes.questions.assignment',
    'quizzes.questions.blank_answer',
    'quizzes.questions.long_answer',
    'quizzes.questions.matching_answer',
    'quizzes.questions.multiple_answers',
    'quizzes.questions.rearrange_answer',
    'quizzes.questions.short_answer',
    'quizzes.questions.true_false_answer',
    'assessmentQuestionAnswers',
    'assessmentQuestionAnswers.assessment_user',
    'assessmentQuestionAnswers.current_assessment_user'
  ];

  Future<void> _setupFileDownloader() async {
    await fd.FlutterDownloader.initialize(
      debug: kDebugMode,
      ignoreSsl: true,
    );

    bd.FileDownloader().updates.listen(
      (update) async {
        switch (update) {
          case bd.TaskStatusUpdate():
            // process the TaskStatusUpdate, e.g.
            switch (update.status) {
              case bd.TaskStatus.complete:
                await _processCompletedTask(update.task);
                logger.d('Task ${update.task.taskId} success!');

              case bd.TaskStatus.canceled:
                logger.d('Download was canceled');

              case bd.TaskStatus.paused:
                logger.d('Download was paused');

              default:
                logger.d('Download not successful');
            }
            if (update.task.group == _groupIdCourses) {
              await _saveCourseDownloadStatus(
                task: update.task,
              );
            }
            if (update.status.isFinalState) {
              await _removeCompletedTask(update.task);
            }
          case bd.TaskProgressUpdate():
            if (update.task.group == _groupIdCourses) {
              await _saveCourseDownloadStatus(
                task: update.task,
              );
            }
            logger.d('Task progress - task: ${update.task}');
        }
      },
    );
    await bd.FileDownloader().resumeFromBackground();
    await bd.FileDownloader().trackTasks();
  }

  Future<void> _removeCompletedTask(bd.Task task) async {
    if (task.group == _groupIdCourses) {
      _downloadingCourseTaskIds.remove(task.taskId);
    }
  }

  String _parseCourseIdFromFilename(String filename) {
    return filename.substring(7, filename.length - 4);
  }

  Future<void> _processCompletedTask(bd.Task task) async {
    try {
      if (task.group == _groupIdCourses) {
        final filename = task.filename;
        final zipFilePath = await task.filePath();
        final extractedFolderPath =
            zipFilePath.substring(0, zipFilePath.length - 4);
        final courseId = _parseCourseIdFromFilename(filename);
        // extra
        final inputStream = InputFileStream(zipFilePath);
        final archive = ZipDecoder().decodeBuffer(inputStream);
        await extractArchiveToDisk(archive, extractedFolderPath);
        logger.d('Course extracted to disk: $extractedFolderPath');

        // save to db
        final courseJsonFilePath =
            '$extractedFolderPath/${_buildCourseJsonFileName(courseId: courseId)}';
        final courseJsonFile = File(courseJsonFilePath);
        final courseJson = await courseJsonFile.readAsString();
        logger.d('Course JSON: $courseJson');
        await offlineCourseDao.upsertEntity(
          entity: OfflineCourseEntity(
            course: CourseRM.fromJson(jsonDecode(courseJson)).toEntity(),
          ),
        );

        // save media files
        final resourceMapperFilePath =
            '$extractedFolderPath/$_filenameResourceMapper';
        final resourceMapperJson = await _readJsonFile(resourceMapperFilePath);
        for (final entry in resourceMapperJson.entries) {
          final url = entry.key;
          final resourcePath = entry.value;
          final resourceFilePath = '$extractedFolderPath/$resourcePath';

          final result = await OfflineCacheManager().cacheOfflineFile(
            url: url,
            filePath: resourceFilePath,
            fileExtension: getExtension(url),
          );
          logger.d('Resource cached: ${result.path}');
        }

        // cleanup
        await File(zipFilePath).delete();
        await File(extractedFolderPath).delete(recursive: true);
        _downloadingCourseTaskIds.remove(task.taskId);
      }
    } catch (e, s) {
      logger.e('Error when processing completed task', e, s);
    }
  }

  Future<Map<String, dynamic>> _readJsonFile(String filePath) async {
    try {
      final file = File(filePath);
      String jsonString = await file.readAsString();
      return jsonDecode(jsonString);
    } catch (e) {
      print("Error reading JSON file: $e");
      return {};
    }
  }

  static String buildCourseDownloadUrl({
    required String apiBaseUrl,
    required String courseId,
  }) {
    final uri = Uri.parse('$apiBaseUrl/courses/download/$courseId').replace(
      queryParameters: {
        'include': courseIncludes.join(','),
        'with': 'ordered',
        '_auth': '1',
      },
    );
    logger.d('Course download URL: $uri');
    return uri.toString();
  }

  static String _buildCourseZipFileName({
    required String courseId,
  }) {
    return 'course_$courseId.zip';
  }

  static String _buildCourseJsonFileName({
    required String courseId,
  }) {
    return 'course_$courseId.json';
  }

  Future<String> downloadCourse({
    required String courseId,
  }) async {
    final accessToken = await prefs.getAccessToken();
    if (accessToken == null) {
      throw Exception('Required to login first');
    }

    final task = bd.DownloadTask(
      url: buildCourseDownloadUrl(apiBaseUrl: _apiBaseUrl, courseId: courseId),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      filename: _buildCourseZipFileName(courseId: courseId),
      group: _groupIdCourses,
      baseDirectory: bd.BaseDirectory.temporary,
      updates: bd.Updates.statusAndProgress,
      requiresWiFi: false,
      retries: 2,
      priority: 10,
      allowPause: true,
    );
    await bd.FileDownloader().enqueue(task);
    return task.taskId;
  }

  Future<void> _saveCourseDownloadStatus({required bd.Task task}) async {
    final record = await bd.FileDownloader().database.recordForId(task.taskId);
    if (record != null) {
      final courseId = _parseCourseIdFromFilename(task.filename);
      final downloadRecordJson = record.toJson();
      await courseDownloadStatusDao.upsertEntity(
        entity: CourseDownloadStatusEntity(
          courseId: courseId,
          downloadTaskId: task.taskId,
          downloadRecordJson: jsonEncode(downloadRecordJson),
          isHandled: false,
        ),
      );
    }
  }

  Future<String> downloadCertificate(String courseId) async {
    var hasPermission = await checkStoragePermission();
    if (!hasPermission) {
      throw Exception("Permission denied");
    }

    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }

    try {
      final response = await remoteDataSourceCall(() => api.getCertificate(
            courseId: int.parse(courseId),
          ));
      String base64Data = response.base64Data ?? '';
      String serverFileName = response.fileName ?? const Uuid().v4();

      final decodedBytes = base64Decode(base64Data);
      final filePath = '${directory!.path}/$serverFileName';
      return await saveFile(decodedBytes, filePath);
    } catch (e, s) {
      logger.e("Error downloading file:", e, s);
      throw Exception("Error downloading file");
    }
  }

  Future<String> downloadFile(
    String url, {
    Function(int received, int total)? onReceiveProgress,
  }) async {
    var hasPermission = await checkStoragePermission();
    if (!hasPermission) {
      throw Exception("Permission denied");
    }

    logger.d("Downloading file from $url");

    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }

    try {
      final filePath = '${directory!.path}/${getFileNameFromUrl(url)}';
      await Dio().download(
        url,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );
      return filePath;
    } catch (e, s) {
      logger.e("Error downloading file:", e, s);
      throw Exception("Error downloading file");
    }
  }

  // #region Download course media
  Future<void> downloadCourseMedia({
    required String courseId,
    required String url,
  }) async {
    final savedDir = await getTemporaryDirectory();
    logger.d('Saved dir: ${savedDir.path}');
    await fd.FlutterDownloader.enqueue(
      url: url,
      fileName: getFileNameFromUrl(url),
      savedDir: savedDir.path,
      showNotification: true,
      openFileFromNotification: false,
    );
  }

  Future<MediaDownloadResult> downloadPublicMedia({
    required String url,
    required String filename,
  }) async {
    final hasPermission = await checkStoragePermission();
    if (!hasPermission) {
      return MediaDownloadResultError(errorMessage: 'Permission denied');
    }

    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }

    if (directory == null) {
      return MediaDownloadResultError(
        errorMessage: 'Failed to get download directory',
      );
    }

    final file = File('${directory.path}/$filename');
    if (await file.exists()) {
      return MediaDownloadResultFileExists(filePath: file.path);
    }

    final taskId = await fd.FlutterDownloader.enqueue(
      url: url,
      fileName: filename,
      savedDir: directory.path,
      showNotification: true,
      saveInPublicStorage: true,
      openFileFromNotification: true,
    );
    if (taskId == null) {
      return MediaDownloadResultUnknownError();
    }

    return MediaDownloadResultEnqueued(
      taskId: taskId,
      filePath: file.path,
    );
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'offline_file_system.dart';

Future<File> getSingleFile(String url) async {
  final file = await DefaultCacheManager().getSingleFile(url);
  return file;
}

const _offlineCacheKey = 'mtp_offline_cache';
final unlimitedCacheObjects = double.maxFinite.toInt();
const unlimitedCacheDuration = Duration(days: 100 * 365);

class OfflineCacheManager extends CacheManager {
  static final OfflineCacheManager _instance = OfflineCacheManager._();

  factory OfflineCacheManager() {
    return _instance;
  }

  OfflineCacheManager._()
      : super(
          Config(
            _offlineCacheKey,
            stalePeriod: unlimitedCacheDuration,
            maxNrOfCacheObjects: unlimitedCacheObjects,
            fileSystem: OfflineFileSystem(_offlineCacheKey),
          ),
        );

  Future<Uint8List> _getFileBytes(String filePath) async {
    final file = File(filePath);
    return await file.readAsBytes();
  }

  Future<File> cacheOfflineFile({
    required String url,
    required String filePath,
    required String fileExtension,
  }) async {
    final file = await _getFileBytes(filePath);
    return await putFile(
      url,
      file,
      maxAge: unlimitedCacheDuration,
      fileExtension: fileExtension,
    );
  }
}

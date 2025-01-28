import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  // No need to ask this permission on Android 13 (API 33)
  if (Platform.isAndroid) {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    if ((info.version.sdkInt) >= 33) return true;
  }

  final status = await Permission.storage.request();
  if (!status.isGranted) {
    return false;
  }

  return true;
}


String getFileNameFromUrl(String url) {
  Uri uri = Uri.parse(url);
  return uri.pathSegments.last;
}

Future<String> saveFile(List<int> bytes, String filePath) async {
  final file = File(filePath);
  await file.writeAsBytes(bytes);

  print("File saved to $filePath");
  return filePath;
}

String getExtension(String url) {
  return url.split('.').lastOrNull?.toLowerCase() ?? '';
}
import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> getAndroidPackageName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

const String iosAppStoreId = "6444518874";

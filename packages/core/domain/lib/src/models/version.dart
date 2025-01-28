import 'package:base/base.dart';
class Version extends Equatable {
  final String versionName;
  final String versionCode;
  final int androidVersionCode;
  final int iosBundleVersion;

  const Version({
    required this.versionName,
    required this.versionCode,
    required this.androidVersionCode,
    required this.iosBundleVersion,
  });

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        versionName: json['version_name'] as String,
        versionCode: json['version_code'] as String,
        androidVersionCode: json['android_version_code'] as int,
        iosBundleVersion: json['ios_bundle_version'] as int,
      );

  Map<String, dynamic> toJson() => {
        'version_name': versionName,
        'version_code': versionCode,
        'android_version_code': androidVersionCode,
        'ios_bundle_version': iosBundleVersion,
      };

  @override
  List<Object?> get props => [
        versionName,
        versionCode,
        androidVersionCode,
        iosBundleVersion,
      ];
}
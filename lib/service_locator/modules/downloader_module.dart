import 'package:base/base.dart';
import 'package:file_downloader/file_downloader.dart';
import 'package:flavor/flavor.dart';

Future<void> provideDownloaderModule() async {
  getIt.registerSingletonAsync<MtpFileDownloader>(() async {
    final downloader = await MtpFileDownloader.getInstance(
      apiBaseUrl: FlavorConfig.apiBaseUrl,
    );
    return downloader;
  });
}

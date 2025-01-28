import 'package:api/api.dart';
import 'package:base/base.dart';

Future<void> provideApiModule({
  required MtpApi api,
}) async {
  getIt.registerSingleton<MtpApi>(api);
}

import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

Future<void> provideDbModule({
  required DriftMtpDatabase db,
}) async {
  getIt.registerSingleton<DriftMtpDatabase>(db);
  getIt.registerSingleton<MtpDatabase>(db);
}

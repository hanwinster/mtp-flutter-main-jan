import 'dart:developer';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:drift_database/drift_database.dart';
import 'package:flavor/flavor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_preferences/preferences.dart';
import 'package:preferences/preferences.dart';
import 'package:retrofit_api/retrofit_api.dart';

import 'modules/modules.dart';

Future<void> setupServiceLocator({
  HivePreferencesDataSource? prefs,
  DriftMtpDatabase? db,
  MtpApi? api,
}) async {
  final prefs_ = prefs ??
      await HivePreferencesDataSource.create(
        init: (hive) async {
          await hive.initFlutter('hive');
        },
      );

  final db_ =
      db ?? DriftMtpDatabase(Platform.createDatabaseConnection('mtp-db'));

  getIt.registerSingleton<PreferencesDataSource>(prefs_);
  getIt.registerSingleton<NetworkMonitor>(ConnectivityPlusNetworkMonitor());

  final api_ = api ??
      // FakeMtpApi();
      RetrofitMtpApi(
        baseUrl: FlavorConfig.baseUrl,
        apiBaseUrl: FlavorConfig.apiBaseUrl,
        preferencesDataSource: prefs_,
        interceptors: [
          LogInterceptor(
            responseBody: true,
            requestBody: true,
            logPrint: (o) => log(o.toString(), name: 'API'),
          ),
        ],
      );

  await provideAppModule();
  await provideApiModule(api: api_);
  await provideDbModule(db: db_);
  await provideDaosModule(db: db_);
  await provideDataModule(prefs: prefs_);
  await provideDomainModule();
  await provideAnalyticsModule();
  await provideDownloaderModule();
}

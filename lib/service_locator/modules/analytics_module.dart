import 'package:analytics/analytics.dart';
import 'package:base/base.dart';

Future<void> provideAnalyticsModule() async {
  getIt.registerSingleton<AnalyticsService>(AnalyticsServiceImpl());
}

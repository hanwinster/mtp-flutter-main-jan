import 'package:analytics/analytics.dart';

abstract class AnalyticsService {
  Future<void> trackBlogPostView({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  });
  Future<void> trackBlogPostShare({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  });
}
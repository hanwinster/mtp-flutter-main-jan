import 'package:analytics/analytics.dart';
import 'package:analytics/src/internal/internal_analytics_service.dart';
import 'package:base/base.dart';

class AnalyticsServiceImpl extends AnalyticsService {
  AnalyticsServiceImpl({
    InternalAnalyticsService? internalAnalyticsService,
  }) : _internalAnalyticsService = internalAnalyticsService ??
            InternalAnalyticsService(
              api: getIt(),
              blogPostDao: getIt(),
            );

  final InternalAnalyticsService _internalAnalyticsService;

  @override
  Future<void> trackBlogPostShare({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  }) async {
    await _internalAnalyticsService.trackBlogPostShare(
      postId: postId,
      provider: provider,
    );
  }

  @override
  Future<void> trackBlogPostView({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  }) async {
    await _internalAnalyticsService.trackBlogPostView(
      postId: postId,
      provider: provider,
    );
  }
}

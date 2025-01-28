import 'package:analytics/analytics.dart';
import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';

class InternalAnalyticsService extends AnalyticsService {
  InternalAnalyticsService({
    required MtpApi api,
    required BlogPostDao blogPostDao,
  }) : _api = api,
       _blogPostDao = blogPostDao;

  final MtpApi _api;
  final BlogPostDao _blogPostDao;

  @override
  Future<void> trackBlogPostShare({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  }) async {
    try {
      await _api.trackBlogShare(postId: postId);
      await _blogPostDao.incrementShareCount(postId: postId);
    } catch (e, s) {
      logger.e('Failed to track blog post share', e, s);
    }
  }

  @override
  Future<void> trackBlogPostView({
    required String postId,
    AnalyticsProvider provider = AnalyticsProvider.internal,
  }) async {
    try {
    await _api.trackBlogView(postId: postId);
    } catch (e, s) {
      logger.e('Failed to track blog post view', e, s);
    }
  }
}

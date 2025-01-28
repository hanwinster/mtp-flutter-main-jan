import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultBlogPostCategoryRepository extends BlogPostCategoryRepository {
  DefaultBlogPostCategoryRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    BlogPostCategoryDao? blogPostCategoryDao,
  })  : _api = api ?? getIt(),
        _blogPostCategoryDao = blogPostCategoryDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;
  final BlogPostCategoryDao _blogPostCategoryDao;

  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<List<BlogPostCategory>>> observeCategories() async* {
    final languageCode = await _prefs.languageCodeOrDefault;
    final rateLimitKey = '$languageCode:blog-post-categories';
    final result =
        NetworkBoundResult<List<BlogPostCategory>, List<BlogPostCategoryRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getBlogPostCategories(),
      ),
      saveCallResult: (items) async {
        await _blogPostCategoryDao.deleteAllEntities();
        await _blogPostCategoryDao.upsertEntities(
            entities: items.map((e) => e.toEntity()).toList());
      },
      loadFromDb: () => _blogPostCategoryDao
          .observeEntities()
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data == null ||
            rateLimiter.shouldFetch('$languageCode:blog-post-categories');
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );
    yield* result.asStream();
  }
}

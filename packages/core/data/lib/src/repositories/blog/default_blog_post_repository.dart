import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:data/src/util/network_bound_result.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class BlogPostQueryBuilder {
  static String latest({
    required String language,
  }) {
    return '$language:latest';
  }

  static String recommended({
    required String language,
  }) {
    return '$language:recommended';
  }

  static String search({
    required String categoryId,
    required String keyword,
    required String language,
  }) {
    return '$language:category=$categoryId,keyword=$keyword';
  }

  static String tag({
    required String tagId,
    required String language,
  }) {
    return '$language:tag=$tagId';
  }
}

class DefaultBlogPostRepository extends BlogPostRepository {
  DefaultBlogPostRepository({
    MtpApi? api,
    BlogPostDao? blogPostDao,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _blogPostDao = blogPostDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final BlogPostDao _blogPostDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  String _rateLimiterKeyPostDetail({
    required String postId,
    required String language,
  }) =>
      '$language:postDetail-$postId';

  @override
  Stream<Result<BlogPost>> observeBlogPostById({
    required String postId,
  }) async* {
    final language = await _prefs.languageCodeOrDefault;
    final rateLimitKey = _rateLimiterKeyPostDetail(
      postId: postId,
      language: language,
    );
    final result = NetworkBoundResult<BlogPost, BlogPostRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getBlogPost(postId: postId.toIntOrThrow()),
      ),
      saveCallResult: (entity) async {
        await _blogPostDao.upsertEntity(entity: entity.toEntity());
      },
      loadFromDb: () => _blogPostDao
          .observeEntity(
            entityId: postId,
          )
          .map(
            (entity) => entity.toDomainModel(),
          ),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );

    yield* result.asStream();
  }

  @override
  Stream<Result<List<BlogPost>>> observeBlogPosts({
    required String categoryId,
    required String keyword,
  }) async* {
    final query = BlogPostQueryBuilder.search(
      categoryId: categoryId,
      language: await _prefs.languageCodeOrDefault,
      keyword: keyword,
    );
    final rateLimitKey = query;
    final result = NetworkBoundResult<List<BlogPost>, List<BlogPostRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.searchBlogPosts(
          categoryId: int.tryParse(categoryId),
          keyword: keyword,
        ),
      ),
      saveCallResult: (entities) async {
        await _blogPostDao.upsertEntities(
          query: query,
          entities: entities.map((e) => e.toEntity()).toList(),
        );
      },
      loadFromDb: () => _blogPostDao
          .observeEntities(query: query)
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data.isNullOrEmpty || rateLimiter.shouldFetch(rateLimitKey);
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );

    yield* result.asStream();
  }

  @override
  Stream<Result<List<BlogPost>>> observeBlogPostsByTag({
    required String tagId,
  }) async* {
    final query = BlogPostQueryBuilder.tag(
      tagId: tagId,
      language: await _prefs.languageCodeOrDefault,
    );
    final rateLimitKey = BlogPostQueryBuilder.tag(
      tagId: tagId,
      language: await _prefs.languageCodeOrDefault,
    );
    final result = NetworkBoundResult<List<BlogPost>, List<BlogPostRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.searchBlogPosts(tagId: int.parse(tagId)),
      ),
      saveCallResult: (entities) async {
        await _blogPostDao.upsertEntities(
          query: query,
          entities: entities.map((e) => e.toEntity()).toList(),
        );
      },
      loadFromDb: () => _blogPostDao
          .observeEntities(query: query)
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data.isNullOrEmpty || rateLimiter.shouldFetch(rateLimitKey);
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );

    yield* result.asStream();
  }

  @override
  Stream<Result<List<BlogPost>>> observeLatestBlogPosts() async* {
    final query = BlogPostQueryBuilder.latest(
      language: await _prefs.languageCodeOrDefault,
    );
    final rateLimitKey = BlogPostQueryBuilder.latest(
      language: await _prefs.languageCodeOrDefault,
    );
    final result = NetworkBoundResult<List<BlogPost>, List<BlogPostRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getLatestBlogPosts(),
      ),
      saveCallResult: (entities) async {
        await _blogPostDao.upsertEntities(
          query: query,
          entities: entities.map((e) => e.toEntity()).toList(),
        );
      },
      loadFromDb: () => _blogPostDao
          .observeEntities(query: query)
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data.isNullOrEmpty || rateLimiter.shouldFetch(rateLimitKey);
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );

    yield* result.asStream();
  }

  @override
  Stream<Result<List<BlogPost>>> observeRecommendedBlogPosts() async* {
    final query = BlogPostQueryBuilder.recommended(
        language: await _prefs.languageCodeOrDefault);
    final rateLimitKey = BlogPostQueryBuilder.recommended(
      language: await _prefs.languageCodeOrDefault,
    );
    final result = NetworkBoundResult<List<BlogPost>, List<BlogPostRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getRecommendedBlogPosts(),
      ),
      saveCallResult: (entities) async {
        await _blogPostDao.upsertEntities(
          query: query,
          entities: entities.map((e) => e.toEntity()).toList(),
        );
      },
      loadFromDb: () => _blogPostDao
          .observeEntities(query: query)
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data.isNullOrEmpty || rateLimiter.shouldFetch(rateLimitKey);
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );

    yield* result.asStream();
  }

  @override
  Future<void> createReaction({
    required String postId,
    required ReactionType reactionType,
  }) async {
    try {
      final response = await remoteDataSourceCall(
        () => _api.createBlogPostReaction(
            postId: postId.toIntOrThrow(),
            reaction: ReactionTypeRM.fromDomainModel(reactionType).toJson()),
      );
      final post = await _blogPostDao.getEntity(entityId: postId);
      await _blogPostDao.upsertEntity(
        entity: post.copyWith(
          currentReaction: () => response.toEntity(),
          numberOfReactions: post.numberOfReactions + 1,
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> updateReaction({
    required String postId,
    required String reactionId,
    required ReactionType reactionType,
  }) async {
    try {
      final response = await remoteDataSourceCall(
        () => _api.updateBlogPostReaction(
          postId: postId.toIntOrThrow(),
          reactionId: reactionId.toIntOrThrow(),
          reaction: ReactionTypeRM.fromDomainModel(reactionType).toJson(),
        ),
      );
      final post = await _blogPostDao.getEntity(entityId: postId);
      await _blogPostDao.upsertEntity(
        entity: post.copyWith(
          currentReaction: () => response.toEntity(),
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteReaction({
    required String postId,
    required String reactionId,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.deleteBlogPostReaction(
          postId: postId.toIntOrThrow(),
          reactionId: reactionId.toIntOrThrow(),
        ),
      );
      final oldPost = await _blogPostDao.getEntity(entityId: postId);
      final updatedPost = oldPost.copyWith(
        currentReaction: () => null,
        numberOfReactions: oldPost.numberOfReactions - 1,
      );
      await _blogPostDao.upsertEntity(
        entity: updatedPost,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead({
    required String postId,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.markBlogPostAsRead(postId: postId),
      );
      final postEntity = await _blogPostDao.getEntity(entityId: postId);
      await _blogPostDao.upsertEntity(
        entity: postEntity.copyWith(
          hasRead: true,
        ),
      );
    } on Exception {
      rethrow;
    }
  }
}

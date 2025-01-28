// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_mtp_database.dart';

// ignore_for_file: type=lint
class $BlogPostTableTable extends BlogPostTable
    with TableInfo<$BlogPostTableTable, BlogPostEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlogPostTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyUpperMeta =
      const VerificationMeta('bodyUpper');
  @override
  late final GeneratedColumn<String> bodyUpper = GeneratedColumn<String>(
      'body_upper', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _blockQuoteMeta =
      const VerificationMeta('blockQuote');
  @override
  late final GeneratedColumn<String> blockQuote = GeneratedColumn<String>(
      'block_quote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyLowerMeta =
      const VerificationMeta('bodyLower');
  @override
  late final GeneratedColumn<String> bodyLower = GeneratedColumn<String>(
      'body_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _privacyMeta =
      const VerificationMeta('privacy');
  @override
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
      'privacy', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shareCountMeta =
      const VerificationMeta('shareCount');
  @override
  late final GeneratedColumn<int> shareCount = GeneratedColumn<int>(
      'share_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shareLinkMeta =
      const VerificationMeta('shareLink');
  @override
  late final GeneratedColumn<String> shareLink = GeneratedColumn<String>(
      'share_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationUnitMeta =
      const VerificationMeta('durationUnit');
  @override
  late final GeneratedColumnWithTypeConverter<BlogPostDurationUnitEntity,
      String> durationUnit = GeneratedColumn<String>(
          'duration_unit', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<BlogPostDurationUnitEntity>(
          $BlogPostTableTable.$converterdurationUnit);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumnWithTypeConverter<ImageUrlEntity, String> imageUrl =
      GeneratedColumn<String>('image_url', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ImageUrlEntity>(
              $BlogPostTableTable.$converterimageUrl);
  static const VerificationMeta _featuredVideoMeta =
      const VerificationMeta('featuredVideo');
  @override
  late final GeneratedColumn<String> featuredVideo = GeneratedColumn<String>(
      'featured_video', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDisplayVideoMeta =
      const VerificationMeta('isDisplayVideo');
  @override
  late final GeneratedColumn<bool> isDisplayVideo = GeneratedColumn<bool>(
      'is_display_video', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_display_video" IN (0, 1))'));
  static const VerificationMeta _videoLinkMeta =
      const VerificationMeta('videoLink');
  @override
  late final GeneratedColumn<String> videoLink = GeneratedColumn<String>(
      'video_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumnWithTypeConverter<UserEntity?, String> author =
      GeneratedColumn<String>('author', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<UserEntity?>($BlogPostTableTable.$converterauthorn);
  static const VerificationMeta _hasReadMeta =
      const VerificationMeta('hasRead');
  @override
  late final GeneratedColumn<bool> hasRead = GeneratedColumn<bool>(
      'has_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_read" IN (0, 1))'));
  static const VerificationMeta _numberOfReactionsMeta =
      const VerificationMeta('numberOfReactions');
  @override
  late final GeneratedColumn<int> numberOfReactions = GeneratedColumn<int>(
      'number_of_reactions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfCommentsMeta =
      const VerificationMeta('numberOfComments');
  @override
  late final GeneratedColumn<int> numberOfComments = GeneratedColumn<int>(
      'number_of_comments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _overallScoreMeta =
      const VerificationMeta('overallScore');
  @override
  late final GeneratedColumn<int> overallScore = GeneratedColumn<int>(
      'overall_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hasQuizMeta =
      const VerificationMeta('hasQuiz');
  @override
  late final GeneratedColumn<bool> hasQuiz = GeneratedColumn<bool>(
      'has_quiz', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_quiz" IN (0, 1))'));
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumnWithTypeConverter<List<BlogPostCategoryEntity>,
      String> categories = GeneratedColumn<String>(
          'categories', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<BlogPostCategoryEntity>>(
          $BlogPostTableTable.$convertercategories);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<BlogPostTagEntity>, String>
      tags = GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<BlogPostTagEntity>>(
              $BlogPostTableTable.$convertertags);
  static const VerificationMeta _currentReactionMeta =
      const VerificationMeta('currentReaction');
  @override
  late final GeneratedColumnWithTypeConverter<ReactionEntity?, String>
      currentReaction = GeneratedColumn<String>(
              'current_reaction', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<ReactionEntity?>(
              $BlogPostTableTable.$convertercurrentReaction);
  static const VerificationMeta _postReactionsMeta =
      const VerificationMeta('postReactions');
  @override
  late final GeneratedColumnWithTypeConverter<List<ReactionEntity>, String>
      postReactions = GeneratedColumn<String>(
              'post_reactions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ReactionEntity>>(
              $BlogPostTableTable.$converterpostReactions);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        slug,
        title,
        bodyUpper,
        blockQuote,
        bodyLower,
        privacy,
        viewCount,
        shareCount,
        shareLink,
        duration,
        durationUnit,
        imageUrl,
        featuredVideo,
        isDisplayVideo,
        videoLink,
        author,
        hasRead,
        numberOfReactions,
        numberOfComments,
        overallScore,
        hasQuiz,
        categories,
        tags,
        currentReaction,
        postReactions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_posts';
  @override
  VerificationContext validateIntegrity(Insertable<BlogPostEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body_upper')) {
      context.handle(_bodyUpperMeta,
          bodyUpper.isAcceptableOrUnknown(data['body_upper']!, _bodyUpperMeta));
    } else if (isInserting) {
      context.missing(_bodyUpperMeta);
    }
    if (data.containsKey('block_quote')) {
      context.handle(
          _blockQuoteMeta,
          blockQuote.isAcceptableOrUnknown(
              data['block_quote']!, _blockQuoteMeta));
    } else if (isInserting) {
      context.missing(_blockQuoteMeta);
    }
    if (data.containsKey('body_lower')) {
      context.handle(_bodyLowerMeta,
          bodyLower.isAcceptableOrUnknown(data['body_lower']!, _bodyLowerMeta));
    } else if (isInserting) {
      context.missing(_bodyLowerMeta);
    }
    if (data.containsKey('privacy')) {
      context.handle(_privacyMeta,
          privacy.isAcceptableOrUnknown(data['privacy']!, _privacyMeta));
    } else if (isInserting) {
      context.missing(_privacyMeta);
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    } else if (isInserting) {
      context.missing(_viewCountMeta);
    }
    if (data.containsKey('share_count')) {
      context.handle(
          _shareCountMeta,
          shareCount.isAcceptableOrUnknown(
              data['share_count']!, _shareCountMeta));
    } else if (isInserting) {
      context.missing(_shareCountMeta);
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    } else if (isInserting) {
      context.missing(_shareLinkMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    context.handle(_durationUnitMeta, const VerificationResult.success());
    context.handle(_imageUrlMeta, const VerificationResult.success());
    if (data.containsKey('featured_video')) {
      context.handle(
          _featuredVideoMeta,
          featuredVideo.isAcceptableOrUnknown(
              data['featured_video']!, _featuredVideoMeta));
    } else if (isInserting) {
      context.missing(_featuredVideoMeta);
    }
    if (data.containsKey('is_display_video')) {
      context.handle(
          _isDisplayVideoMeta,
          isDisplayVideo.isAcceptableOrUnknown(
              data['is_display_video']!, _isDisplayVideoMeta));
    } else if (isInserting) {
      context.missing(_isDisplayVideoMeta);
    }
    if (data.containsKey('video_link')) {
      context.handle(_videoLinkMeta,
          videoLink.isAcceptableOrUnknown(data['video_link']!, _videoLinkMeta));
    } else if (isInserting) {
      context.missing(_videoLinkMeta);
    }
    context.handle(_authorMeta, const VerificationResult.success());
    if (data.containsKey('has_read')) {
      context.handle(_hasReadMeta,
          hasRead.isAcceptableOrUnknown(data['has_read']!, _hasReadMeta));
    } else if (isInserting) {
      context.missing(_hasReadMeta);
    }
    if (data.containsKey('number_of_reactions')) {
      context.handle(
          _numberOfReactionsMeta,
          numberOfReactions.isAcceptableOrUnknown(
              data['number_of_reactions']!, _numberOfReactionsMeta));
    } else if (isInserting) {
      context.missing(_numberOfReactionsMeta);
    }
    if (data.containsKey('number_of_comments')) {
      context.handle(
          _numberOfCommentsMeta,
          numberOfComments.isAcceptableOrUnknown(
              data['number_of_comments']!, _numberOfCommentsMeta));
    } else if (isInserting) {
      context.missing(_numberOfCommentsMeta);
    }
    if (data.containsKey('overall_score')) {
      context.handle(
          _overallScoreMeta,
          overallScore.isAcceptableOrUnknown(
              data['overall_score']!, _overallScoreMeta));
    } else if (isInserting) {
      context.missing(_overallScoreMeta);
    }
    if (data.containsKey('has_quiz')) {
      context.handle(_hasQuizMeta,
          hasQuiz.isAcceptableOrUnknown(data['has_quiz']!, _hasQuizMeta));
    } else if (isInserting) {
      context.missing(_hasQuizMeta);
    }
    context.handle(_categoriesMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_currentReactionMeta, const VerificationResult.success());
    context.handle(_postReactionsMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlogPostEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlogPostEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      bodyUpper: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_upper'])!,
      blockQuote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}block_quote'])!,
      bodyLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_lower'])!,
      privacy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      shareCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}share_count'])!,
      shareLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}share_link'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      durationUnit: $BlogPostTableTable.$converterdurationUnit.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}duration_unit'])!),
      imageUrl: $BlogPostTableTable.$converterimageUrl.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!),
      featuredVideo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}featured_video'])!,
      isDisplayVideo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_display_video'])!,
      videoLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_link'])!,
      author: $BlogPostTableTable.$converterauthorn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])),
      hasRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_read'])!,
      numberOfReactions: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_reactions'])!,
      numberOfComments: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_comments'])!,
      overallScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}overall_score'])!,
      hasQuiz: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_quiz'])!,
      categories: $BlogPostTableTable.$convertercategories.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}categories'])!),
      tags: $BlogPostTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      currentReaction: $BlogPostTableTable.$convertercurrentReaction.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}current_reaction'])),
      postReactions: $BlogPostTableTable.$converterpostReactions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}post_reactions'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BlogPostTableTable createAlias(String alias) {
    return $BlogPostTableTable(attachedDatabase, alias);
  }

  static TypeConverter<BlogPostDurationUnitEntity, String>
      $converterdurationUnit = const BlogPostDurationUnitConverter();
  static TypeConverter<ImageUrlEntity, String> $converterimageUrl =
      const ImageUrlConverter();
  static TypeConverter<UserEntity, String> $converterauthor =
      const UserConverter();
  static TypeConverter<UserEntity?, String?> $converterauthorn =
      NullAwareTypeConverter.wrap($converterauthor);
  static TypeConverter<List<BlogPostCategoryEntity>, String>
      $convertercategories = const BlogPostCategoryListConverter();
  static TypeConverter<List<BlogPostTagEntity>, String> $convertertags =
      const BlogPostTagListConverter();
  static TypeConverter<ReactionEntity?, String?> $convertercurrentReaction =
      const NullableReactionConverter();
  static TypeConverter<List<ReactionEntity>, String> $converterpostReactions =
      const ReactionListConverter();
}

class BlogPostEntry extends DataClass implements Insertable<BlogPostEntry> {
  final String id;
  final String slug;
  final String title;
  final String bodyUpper;
  final String blockQuote;
  final String bodyLower;
  final String privacy;
  final int viewCount;
  final int shareCount;
  final String shareLink;
  final int duration;
  final BlogPostDurationUnitEntity durationUnit;
  final ImageUrlEntity imageUrl;
  final String featuredVideo;
  final bool isDisplayVideo;
  final String videoLink;
  final UserEntity? author;
  final bool hasRead;
  final int numberOfReactions;
  final int numberOfComments;
  final int overallScore;
  final bool hasQuiz;
  final List<BlogPostCategoryEntity> categories;
  final List<BlogPostTagEntity> tags;
  final ReactionEntity? currentReaction;
  final List<ReactionEntity> postReactions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BlogPostEntry(
      {required this.id,
      required this.slug,
      required this.title,
      required this.bodyUpper,
      required this.blockQuote,
      required this.bodyLower,
      required this.privacy,
      required this.viewCount,
      required this.shareCount,
      required this.shareLink,
      required this.duration,
      required this.durationUnit,
      required this.imageUrl,
      required this.featuredVideo,
      required this.isDisplayVideo,
      required this.videoLink,
      this.author,
      required this.hasRead,
      required this.numberOfReactions,
      required this.numberOfComments,
      required this.overallScore,
      required this.hasQuiz,
      required this.categories,
      required this.tags,
      this.currentReaction,
      required this.postReactions,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['slug'] = Variable<String>(slug);
    map['title'] = Variable<String>(title);
    map['body_upper'] = Variable<String>(bodyUpper);
    map['block_quote'] = Variable<String>(blockQuote);
    map['body_lower'] = Variable<String>(bodyLower);
    map['privacy'] = Variable<String>(privacy);
    map['view_count'] = Variable<int>(viewCount);
    map['share_count'] = Variable<int>(shareCount);
    map['share_link'] = Variable<String>(shareLink);
    map['duration'] = Variable<int>(duration);
    {
      map['duration_unit'] = Variable<String>(
          $BlogPostTableTable.$converterdurationUnit.toSql(durationUnit));
    }
    {
      map['image_url'] = Variable<String>(
          $BlogPostTableTable.$converterimageUrl.toSql(imageUrl));
    }
    map['featured_video'] = Variable<String>(featuredVideo);
    map['is_display_video'] = Variable<bool>(isDisplayVideo);
    map['video_link'] = Variable<String>(videoLink);
    if (!nullToAbsent || author != null) {
      map['author'] =
          Variable<String>($BlogPostTableTable.$converterauthorn.toSql(author));
    }
    map['has_read'] = Variable<bool>(hasRead);
    map['number_of_reactions'] = Variable<int>(numberOfReactions);
    map['number_of_comments'] = Variable<int>(numberOfComments);
    map['overall_score'] = Variable<int>(overallScore);
    map['has_quiz'] = Variable<bool>(hasQuiz);
    {
      map['categories'] = Variable<String>(
          $BlogPostTableTable.$convertercategories.toSql(categories));
    }
    {
      map['tags'] =
          Variable<String>($BlogPostTableTable.$convertertags.toSql(tags));
    }
    if (!nullToAbsent || currentReaction != null) {
      map['current_reaction'] = Variable<String>(
          $BlogPostTableTable.$convertercurrentReaction.toSql(currentReaction));
    }
    {
      map['post_reactions'] = Variable<String>(
          $BlogPostTableTable.$converterpostReactions.toSql(postReactions));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BlogPostTableCompanion toCompanion(bool nullToAbsent) {
    return BlogPostTableCompanion(
      id: Value(id),
      slug: Value(slug),
      title: Value(title),
      bodyUpper: Value(bodyUpper),
      blockQuote: Value(blockQuote),
      bodyLower: Value(bodyLower),
      privacy: Value(privacy),
      viewCount: Value(viewCount),
      shareCount: Value(shareCount),
      shareLink: Value(shareLink),
      duration: Value(duration),
      durationUnit: Value(durationUnit),
      imageUrl: Value(imageUrl),
      featuredVideo: Value(featuredVideo),
      isDisplayVideo: Value(isDisplayVideo),
      videoLink: Value(videoLink),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      hasRead: Value(hasRead),
      numberOfReactions: Value(numberOfReactions),
      numberOfComments: Value(numberOfComments),
      overallScore: Value(overallScore),
      hasQuiz: Value(hasQuiz),
      categories: Value(categories),
      tags: Value(tags),
      currentReaction: currentReaction == null && nullToAbsent
          ? const Value.absent()
          : Value(currentReaction),
      postReactions: Value(postReactions),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BlogPostEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlogPostEntry(
      id: serializer.fromJson<String>(json['id']),
      slug: serializer.fromJson<String>(json['slug']),
      title: serializer.fromJson<String>(json['title']),
      bodyUpper: serializer.fromJson<String>(json['bodyUpper']),
      blockQuote: serializer.fromJson<String>(json['blockQuote']),
      bodyLower: serializer.fromJson<String>(json['bodyLower']),
      privacy: serializer.fromJson<String>(json['privacy']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      shareCount: serializer.fromJson<int>(json['shareCount']),
      shareLink: serializer.fromJson<String>(json['shareLink']),
      duration: serializer.fromJson<int>(json['duration']),
      durationUnit:
          serializer.fromJson<BlogPostDurationUnitEntity>(json['durationUnit']),
      imageUrl: serializer.fromJson<ImageUrlEntity>(json['imageUrl']),
      featuredVideo: serializer.fromJson<String>(json['featuredVideo']),
      isDisplayVideo: serializer.fromJson<bool>(json['isDisplayVideo']),
      videoLink: serializer.fromJson<String>(json['videoLink']),
      author: serializer.fromJson<UserEntity?>(json['author']),
      hasRead: serializer.fromJson<bool>(json['hasRead']),
      numberOfReactions: serializer.fromJson<int>(json['numberOfReactions']),
      numberOfComments: serializer.fromJson<int>(json['numberOfComments']),
      overallScore: serializer.fromJson<int>(json['overallScore']),
      hasQuiz: serializer.fromJson<bool>(json['hasQuiz']),
      categories:
          serializer.fromJson<List<BlogPostCategoryEntity>>(json['categories']),
      tags: serializer.fromJson<List<BlogPostTagEntity>>(json['tags']),
      currentReaction:
          serializer.fromJson<ReactionEntity?>(json['currentReaction']),
      postReactions:
          serializer.fromJson<List<ReactionEntity>>(json['postReactions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'slug': serializer.toJson<String>(slug),
      'title': serializer.toJson<String>(title),
      'bodyUpper': serializer.toJson<String>(bodyUpper),
      'blockQuote': serializer.toJson<String>(blockQuote),
      'bodyLower': serializer.toJson<String>(bodyLower),
      'privacy': serializer.toJson<String>(privacy),
      'viewCount': serializer.toJson<int>(viewCount),
      'shareCount': serializer.toJson<int>(shareCount),
      'shareLink': serializer.toJson<String>(shareLink),
      'duration': serializer.toJson<int>(duration),
      'durationUnit':
          serializer.toJson<BlogPostDurationUnitEntity>(durationUnit),
      'imageUrl': serializer.toJson<ImageUrlEntity>(imageUrl),
      'featuredVideo': serializer.toJson<String>(featuredVideo),
      'isDisplayVideo': serializer.toJson<bool>(isDisplayVideo),
      'videoLink': serializer.toJson<String>(videoLink),
      'author': serializer.toJson<UserEntity?>(author),
      'hasRead': serializer.toJson<bool>(hasRead),
      'numberOfReactions': serializer.toJson<int>(numberOfReactions),
      'numberOfComments': serializer.toJson<int>(numberOfComments),
      'overallScore': serializer.toJson<int>(overallScore),
      'hasQuiz': serializer.toJson<bool>(hasQuiz),
      'categories': serializer.toJson<List<BlogPostCategoryEntity>>(categories),
      'tags': serializer.toJson<List<BlogPostTagEntity>>(tags),
      'currentReaction': serializer.toJson<ReactionEntity?>(currentReaction),
      'postReactions': serializer.toJson<List<ReactionEntity>>(postReactions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BlogPostEntry copyWith(
          {String? id,
          String? slug,
          String? title,
          String? bodyUpper,
          String? blockQuote,
          String? bodyLower,
          String? privacy,
          int? viewCount,
          int? shareCount,
          String? shareLink,
          int? duration,
          BlogPostDurationUnitEntity? durationUnit,
          ImageUrlEntity? imageUrl,
          String? featuredVideo,
          bool? isDisplayVideo,
          String? videoLink,
          Value<UserEntity?> author = const Value.absent(),
          bool? hasRead,
          int? numberOfReactions,
          int? numberOfComments,
          int? overallScore,
          bool? hasQuiz,
          List<BlogPostCategoryEntity>? categories,
          List<BlogPostTagEntity>? tags,
          Value<ReactionEntity?> currentReaction = const Value.absent(),
          List<ReactionEntity>? postReactions,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BlogPostEntry(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        bodyUpper: bodyUpper ?? this.bodyUpper,
        blockQuote: blockQuote ?? this.blockQuote,
        bodyLower: bodyLower ?? this.bodyLower,
        privacy: privacy ?? this.privacy,
        viewCount: viewCount ?? this.viewCount,
        shareCount: shareCount ?? this.shareCount,
        shareLink: shareLink ?? this.shareLink,
        duration: duration ?? this.duration,
        durationUnit: durationUnit ?? this.durationUnit,
        imageUrl: imageUrl ?? this.imageUrl,
        featuredVideo: featuredVideo ?? this.featuredVideo,
        isDisplayVideo: isDisplayVideo ?? this.isDisplayVideo,
        videoLink: videoLink ?? this.videoLink,
        author: author.present ? author.value : this.author,
        hasRead: hasRead ?? this.hasRead,
        numberOfReactions: numberOfReactions ?? this.numberOfReactions,
        numberOfComments: numberOfComments ?? this.numberOfComments,
        overallScore: overallScore ?? this.overallScore,
        hasQuiz: hasQuiz ?? this.hasQuiz,
        categories: categories ?? this.categories,
        tags: tags ?? this.tags,
        currentReaction: currentReaction.present
            ? currentReaction.value
            : this.currentReaction,
        postReactions: postReactions ?? this.postReactions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BlogPostEntry copyWithCompanion(BlogPostTableCompanion data) {
    return BlogPostEntry(
      id: data.id.present ? data.id.value : this.id,
      slug: data.slug.present ? data.slug.value : this.slug,
      title: data.title.present ? data.title.value : this.title,
      bodyUpper: data.bodyUpper.present ? data.bodyUpper.value : this.bodyUpper,
      blockQuote:
          data.blockQuote.present ? data.blockQuote.value : this.blockQuote,
      bodyLower: data.bodyLower.present ? data.bodyLower.value : this.bodyLower,
      privacy: data.privacy.present ? data.privacy.value : this.privacy,
      viewCount: data.viewCount.present ? data.viewCount.value : this.viewCount,
      shareCount:
          data.shareCount.present ? data.shareCount.value : this.shareCount,
      shareLink: data.shareLink.present ? data.shareLink.value : this.shareLink,
      duration: data.duration.present ? data.duration.value : this.duration,
      durationUnit: data.durationUnit.present
          ? data.durationUnit.value
          : this.durationUnit,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      featuredVideo: data.featuredVideo.present
          ? data.featuredVideo.value
          : this.featuredVideo,
      isDisplayVideo: data.isDisplayVideo.present
          ? data.isDisplayVideo.value
          : this.isDisplayVideo,
      videoLink: data.videoLink.present ? data.videoLink.value : this.videoLink,
      author: data.author.present ? data.author.value : this.author,
      hasRead: data.hasRead.present ? data.hasRead.value : this.hasRead,
      numberOfReactions: data.numberOfReactions.present
          ? data.numberOfReactions.value
          : this.numberOfReactions,
      numberOfComments: data.numberOfComments.present
          ? data.numberOfComments.value
          : this.numberOfComments,
      overallScore: data.overallScore.present
          ? data.overallScore.value
          : this.overallScore,
      hasQuiz: data.hasQuiz.present ? data.hasQuiz.value : this.hasQuiz,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      tags: data.tags.present ? data.tags.value : this.tags,
      currentReaction: data.currentReaction.present
          ? data.currentReaction.value
          : this.currentReaction,
      postReactions: data.postReactions.present
          ? data.postReactions.value
          : this.postReactions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostEntry(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('title: $title, ')
          ..write('bodyUpper: $bodyUpper, ')
          ..write('blockQuote: $blockQuote, ')
          ..write('bodyLower: $bodyLower, ')
          ..write('privacy: $privacy, ')
          ..write('viewCount: $viewCount, ')
          ..write('shareCount: $shareCount, ')
          ..write('shareLink: $shareLink, ')
          ..write('duration: $duration, ')
          ..write('durationUnit: $durationUnit, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('featuredVideo: $featuredVideo, ')
          ..write('isDisplayVideo: $isDisplayVideo, ')
          ..write('videoLink: $videoLink, ')
          ..write('author: $author, ')
          ..write('hasRead: $hasRead, ')
          ..write('numberOfReactions: $numberOfReactions, ')
          ..write('numberOfComments: $numberOfComments, ')
          ..write('overallScore: $overallScore, ')
          ..write('hasQuiz: $hasQuiz, ')
          ..write('categories: $categories, ')
          ..write('tags: $tags, ')
          ..write('currentReaction: $currentReaction, ')
          ..write('postReactions: $postReactions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        slug,
        title,
        bodyUpper,
        blockQuote,
        bodyLower,
        privacy,
        viewCount,
        shareCount,
        shareLink,
        duration,
        durationUnit,
        imageUrl,
        featuredVideo,
        isDisplayVideo,
        videoLink,
        author,
        hasRead,
        numberOfReactions,
        numberOfComments,
        overallScore,
        hasQuiz,
        categories,
        tags,
        currentReaction,
        postReactions,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlogPostEntry &&
          other.id == this.id &&
          other.slug == this.slug &&
          other.title == this.title &&
          other.bodyUpper == this.bodyUpper &&
          other.blockQuote == this.blockQuote &&
          other.bodyLower == this.bodyLower &&
          other.privacy == this.privacy &&
          other.viewCount == this.viewCount &&
          other.shareCount == this.shareCount &&
          other.shareLink == this.shareLink &&
          other.duration == this.duration &&
          other.durationUnit == this.durationUnit &&
          other.imageUrl == this.imageUrl &&
          other.featuredVideo == this.featuredVideo &&
          other.isDisplayVideo == this.isDisplayVideo &&
          other.videoLink == this.videoLink &&
          other.author == this.author &&
          other.hasRead == this.hasRead &&
          other.numberOfReactions == this.numberOfReactions &&
          other.numberOfComments == this.numberOfComments &&
          other.overallScore == this.overallScore &&
          other.hasQuiz == this.hasQuiz &&
          other.categories == this.categories &&
          other.tags == this.tags &&
          other.currentReaction == this.currentReaction &&
          other.postReactions == this.postReactions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BlogPostTableCompanion extends UpdateCompanion<BlogPostEntry> {
  final Value<String> id;
  final Value<String> slug;
  final Value<String> title;
  final Value<String> bodyUpper;
  final Value<String> blockQuote;
  final Value<String> bodyLower;
  final Value<String> privacy;
  final Value<int> viewCount;
  final Value<int> shareCount;
  final Value<String> shareLink;
  final Value<int> duration;
  final Value<BlogPostDurationUnitEntity> durationUnit;
  final Value<ImageUrlEntity> imageUrl;
  final Value<String> featuredVideo;
  final Value<bool> isDisplayVideo;
  final Value<String> videoLink;
  final Value<UserEntity?> author;
  final Value<bool> hasRead;
  final Value<int> numberOfReactions;
  final Value<int> numberOfComments;
  final Value<int> overallScore;
  final Value<bool> hasQuiz;
  final Value<List<BlogPostCategoryEntity>> categories;
  final Value<List<BlogPostTagEntity>> tags;
  final Value<ReactionEntity?> currentReaction;
  final Value<List<ReactionEntity>> postReactions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BlogPostTableCompanion({
    this.id = const Value.absent(),
    this.slug = const Value.absent(),
    this.title = const Value.absent(),
    this.bodyUpper = const Value.absent(),
    this.blockQuote = const Value.absent(),
    this.bodyLower = const Value.absent(),
    this.privacy = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.shareCount = const Value.absent(),
    this.shareLink = const Value.absent(),
    this.duration = const Value.absent(),
    this.durationUnit = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.featuredVideo = const Value.absent(),
    this.isDisplayVideo = const Value.absent(),
    this.videoLink = const Value.absent(),
    this.author = const Value.absent(),
    this.hasRead = const Value.absent(),
    this.numberOfReactions = const Value.absent(),
    this.numberOfComments = const Value.absent(),
    this.overallScore = const Value.absent(),
    this.hasQuiz = const Value.absent(),
    this.categories = const Value.absent(),
    this.tags = const Value.absent(),
    this.currentReaction = const Value.absent(),
    this.postReactions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlogPostTableCompanion.insert({
    required String id,
    required String slug,
    required String title,
    required String bodyUpper,
    required String blockQuote,
    required String bodyLower,
    required String privacy,
    required int viewCount,
    required int shareCount,
    required String shareLink,
    required int duration,
    required BlogPostDurationUnitEntity durationUnit,
    required ImageUrlEntity imageUrl,
    required String featuredVideo,
    required bool isDisplayVideo,
    required String videoLink,
    this.author = const Value.absent(),
    required bool hasRead,
    required int numberOfReactions,
    required int numberOfComments,
    required int overallScore,
    required bool hasQuiz,
    required List<BlogPostCategoryEntity> categories,
    required List<BlogPostTagEntity> tags,
    this.currentReaction = const Value.absent(),
    required List<ReactionEntity> postReactions,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        slug = Value(slug),
        title = Value(title),
        bodyUpper = Value(bodyUpper),
        blockQuote = Value(blockQuote),
        bodyLower = Value(bodyLower),
        privacy = Value(privacy),
        viewCount = Value(viewCount),
        shareCount = Value(shareCount),
        shareLink = Value(shareLink),
        duration = Value(duration),
        durationUnit = Value(durationUnit),
        imageUrl = Value(imageUrl),
        featuredVideo = Value(featuredVideo),
        isDisplayVideo = Value(isDisplayVideo),
        videoLink = Value(videoLink),
        hasRead = Value(hasRead),
        numberOfReactions = Value(numberOfReactions),
        numberOfComments = Value(numberOfComments),
        overallScore = Value(overallScore),
        hasQuiz = Value(hasQuiz),
        categories = Value(categories),
        tags = Value(tags),
        postReactions = Value(postReactions),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BlogPostEntry> custom({
    Expression<String>? id,
    Expression<String>? slug,
    Expression<String>? title,
    Expression<String>? bodyUpper,
    Expression<String>? blockQuote,
    Expression<String>? bodyLower,
    Expression<String>? privacy,
    Expression<int>? viewCount,
    Expression<int>? shareCount,
    Expression<String>? shareLink,
    Expression<int>? duration,
    Expression<String>? durationUnit,
    Expression<String>? imageUrl,
    Expression<String>? featuredVideo,
    Expression<bool>? isDisplayVideo,
    Expression<String>? videoLink,
    Expression<String>? author,
    Expression<bool>? hasRead,
    Expression<int>? numberOfReactions,
    Expression<int>? numberOfComments,
    Expression<int>? overallScore,
    Expression<bool>? hasQuiz,
    Expression<String>? categories,
    Expression<String>? tags,
    Expression<String>? currentReaction,
    Expression<String>? postReactions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slug != null) 'slug': slug,
      if (title != null) 'title': title,
      if (bodyUpper != null) 'body_upper': bodyUpper,
      if (blockQuote != null) 'block_quote': blockQuote,
      if (bodyLower != null) 'body_lower': bodyLower,
      if (privacy != null) 'privacy': privacy,
      if (viewCount != null) 'view_count': viewCount,
      if (shareCount != null) 'share_count': shareCount,
      if (shareLink != null) 'share_link': shareLink,
      if (duration != null) 'duration': duration,
      if (durationUnit != null) 'duration_unit': durationUnit,
      if (imageUrl != null) 'image_url': imageUrl,
      if (featuredVideo != null) 'featured_video': featuredVideo,
      if (isDisplayVideo != null) 'is_display_video': isDisplayVideo,
      if (videoLink != null) 'video_link': videoLink,
      if (author != null) 'author': author,
      if (hasRead != null) 'has_read': hasRead,
      if (numberOfReactions != null) 'number_of_reactions': numberOfReactions,
      if (numberOfComments != null) 'number_of_comments': numberOfComments,
      if (overallScore != null) 'overall_score': overallScore,
      if (hasQuiz != null) 'has_quiz': hasQuiz,
      if (categories != null) 'categories': categories,
      if (tags != null) 'tags': tags,
      if (currentReaction != null) 'current_reaction': currentReaction,
      if (postReactions != null) 'post_reactions': postReactions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlogPostTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? slug,
      Value<String>? title,
      Value<String>? bodyUpper,
      Value<String>? blockQuote,
      Value<String>? bodyLower,
      Value<String>? privacy,
      Value<int>? viewCount,
      Value<int>? shareCount,
      Value<String>? shareLink,
      Value<int>? duration,
      Value<BlogPostDurationUnitEntity>? durationUnit,
      Value<ImageUrlEntity>? imageUrl,
      Value<String>? featuredVideo,
      Value<bool>? isDisplayVideo,
      Value<String>? videoLink,
      Value<UserEntity?>? author,
      Value<bool>? hasRead,
      Value<int>? numberOfReactions,
      Value<int>? numberOfComments,
      Value<int>? overallScore,
      Value<bool>? hasQuiz,
      Value<List<BlogPostCategoryEntity>>? categories,
      Value<List<BlogPostTagEntity>>? tags,
      Value<ReactionEntity?>? currentReaction,
      Value<List<ReactionEntity>>? postReactions,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BlogPostTableCompanion(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      bodyUpper: bodyUpper ?? this.bodyUpper,
      blockQuote: blockQuote ?? this.blockQuote,
      bodyLower: bodyLower ?? this.bodyLower,
      privacy: privacy ?? this.privacy,
      viewCount: viewCount ?? this.viewCount,
      shareCount: shareCount ?? this.shareCount,
      shareLink: shareLink ?? this.shareLink,
      duration: duration ?? this.duration,
      durationUnit: durationUnit ?? this.durationUnit,
      imageUrl: imageUrl ?? this.imageUrl,
      featuredVideo: featuredVideo ?? this.featuredVideo,
      isDisplayVideo: isDisplayVideo ?? this.isDisplayVideo,
      videoLink: videoLink ?? this.videoLink,
      author: author ?? this.author,
      hasRead: hasRead ?? this.hasRead,
      numberOfReactions: numberOfReactions ?? this.numberOfReactions,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      overallScore: overallScore ?? this.overallScore,
      hasQuiz: hasQuiz ?? this.hasQuiz,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      currentReaction: currentReaction ?? this.currentReaction,
      postReactions: postReactions ?? this.postReactions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (bodyUpper.present) {
      map['body_upper'] = Variable<String>(bodyUpper.value);
    }
    if (blockQuote.present) {
      map['block_quote'] = Variable<String>(blockQuote.value);
    }
    if (bodyLower.present) {
      map['body_lower'] = Variable<String>(bodyLower.value);
    }
    if (privacy.present) {
      map['privacy'] = Variable<String>(privacy.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (shareCount.present) {
      map['share_count'] = Variable<int>(shareCount.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String>(shareLink.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (durationUnit.present) {
      map['duration_unit'] = Variable<String>(
          $BlogPostTableTable.$converterdurationUnit.toSql(durationUnit.value));
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(
          $BlogPostTableTable.$converterimageUrl.toSql(imageUrl.value));
    }
    if (featuredVideo.present) {
      map['featured_video'] = Variable<String>(featuredVideo.value);
    }
    if (isDisplayVideo.present) {
      map['is_display_video'] = Variable<bool>(isDisplayVideo.value);
    }
    if (videoLink.present) {
      map['video_link'] = Variable<String>(videoLink.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(
          $BlogPostTableTable.$converterauthorn.toSql(author.value));
    }
    if (hasRead.present) {
      map['has_read'] = Variable<bool>(hasRead.value);
    }
    if (numberOfReactions.present) {
      map['number_of_reactions'] = Variable<int>(numberOfReactions.value);
    }
    if (numberOfComments.present) {
      map['number_of_comments'] = Variable<int>(numberOfComments.value);
    }
    if (overallScore.present) {
      map['overall_score'] = Variable<int>(overallScore.value);
    }
    if (hasQuiz.present) {
      map['has_quiz'] = Variable<bool>(hasQuiz.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
          $BlogPostTableTable.$convertercategories.toSql(categories.value));
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $BlogPostTableTable.$convertertags.toSql(tags.value));
    }
    if (currentReaction.present) {
      map['current_reaction'] = Variable<String>($BlogPostTableTable
          .$convertercurrentReaction
          .toSql(currentReaction.value));
    }
    if (postReactions.present) {
      map['post_reactions'] = Variable<String>($BlogPostTableTable
          .$converterpostReactions
          .toSql(postReactions.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostTableCompanion(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('title: $title, ')
          ..write('bodyUpper: $bodyUpper, ')
          ..write('blockQuote: $blockQuote, ')
          ..write('bodyLower: $bodyLower, ')
          ..write('privacy: $privacy, ')
          ..write('viewCount: $viewCount, ')
          ..write('shareCount: $shareCount, ')
          ..write('shareLink: $shareLink, ')
          ..write('duration: $duration, ')
          ..write('durationUnit: $durationUnit, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('featuredVideo: $featuredVideo, ')
          ..write('isDisplayVideo: $isDisplayVideo, ')
          ..write('videoLink: $videoLink, ')
          ..write('author: $author, ')
          ..write('hasRead: $hasRead, ')
          ..write('numberOfReactions: $numberOfReactions, ')
          ..write('numberOfComments: $numberOfComments, ')
          ..write('overallScore: $overallScore, ')
          ..write('hasQuiz: $hasQuiz, ')
          ..write('categories: $categories, ')
          ..write('tags: $tags, ')
          ..write('currentReaction: $currentReaction, ')
          ..write('postReactions: $postReactions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BlogPostQueryTableTable extends BlogPostQueryTable
    with TableInfo<$BlogPostQueryTableTable, BlogPostQueryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlogPostQueryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idsMeta = const VerificationMeta('ids');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> ids =
      GeneratedColumn<String>('ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($BlogPostQueryTableTable.$converterids);
  @override
  List<GeneratedColumn> get $columns => [query, ids];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_queries';
  @override
  VerificationContext validateIntegrity(Insertable<BlogPostQueryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    context.handle(_idsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  BlogPostQueryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlogPostQueryEntry(
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      ids: $BlogPostQueryTableTable.$converterids.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ids'])!),
    );
  }

  @override
  $BlogPostQueryTableTable createAlias(String alias) {
    return $BlogPostQueryTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterids =
      const StringListConverter();
}

class BlogPostQueryEntry extends DataClass
    implements Insertable<BlogPostQueryEntry> {
  final String query;
  final List<String> ids;
  const BlogPostQueryEntry({required this.query, required this.ids});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    {
      map['ids'] =
          Variable<String>($BlogPostQueryTableTable.$converterids.toSql(ids));
    }
    return map;
  }

  BlogPostQueryTableCompanion toCompanion(bool nullToAbsent) {
    return BlogPostQueryTableCompanion(
      query: Value(query),
      ids: Value(ids),
    );
  }

  factory BlogPostQueryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlogPostQueryEntry(
      query: serializer.fromJson<String>(json['query']),
      ids: serializer.fromJson<List<String>>(json['ids']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'ids': serializer.toJson<List<String>>(ids),
    };
  }

  BlogPostQueryEntry copyWith({String? query, List<String>? ids}) =>
      BlogPostQueryEntry(
        query: query ?? this.query,
        ids: ids ?? this.ids,
      );
  BlogPostQueryEntry copyWithCompanion(BlogPostQueryTableCompanion data) {
    return BlogPostQueryEntry(
      query: data.query.present ? data.query.value : this.query,
      ids: data.ids.present ? data.ids.value : this.ids,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostQueryEntry(')
          ..write('query: $query, ')
          ..write('ids: $ids')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(query, ids);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlogPostQueryEntry &&
          other.query == this.query &&
          other.ids == this.ids);
}

class BlogPostQueryTableCompanion extends UpdateCompanion<BlogPostQueryEntry> {
  final Value<String> query;
  final Value<List<String>> ids;
  final Value<int> rowid;
  const BlogPostQueryTableCompanion({
    this.query = const Value.absent(),
    this.ids = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlogPostQueryTableCompanion.insert({
    required String query,
    required List<String> ids,
    this.rowid = const Value.absent(),
  })  : query = Value(query),
        ids = Value(ids);
  static Insertable<BlogPostQueryEntry> custom({
    Expression<String>? query,
    Expression<String>? ids,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (ids != null) 'ids': ids,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlogPostQueryTableCompanion copyWith(
      {Value<String>? query, Value<List<String>>? ids, Value<int>? rowid}) {
    return BlogPostQueryTableCompanion(
      query: query ?? this.query,
      ids: ids ?? this.ids,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (ids.present) {
      map['ids'] = Variable<String>(
          $BlogPostQueryTableTable.$converterids.toSql(ids.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostQueryTableCompanion(')
          ..write('query: $query, ')
          ..write('ids: $ids, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BlogPostCommentTableTable extends BlogPostCommentTable
    with TableInfo<$BlogPostCommentTableTable, BlogPostCommentEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlogPostCommentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
      'post_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumnWithTypeConverter<UserEntity?, String> user =
      GeneratedColumn<String>('user', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<UserEntity?>(
              $BlogPostCommentTableTable.$converterusern);
  static const VerificationMeta _currentReactionMeta =
      const VerificationMeta('currentReaction');
  @override
  late final GeneratedColumnWithTypeConverter<ReactionEntity?, String>
      currentReaction = GeneratedColumn<String>(
              'current_reaction', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<ReactionEntity?>(
              $BlogPostCommentTableTable.$convertercurrentReaction);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _replyCountMeta =
      const VerificationMeta('replyCount');
  @override
  late final GeneratedColumn<int> replyCount = GeneratedColumn<int>(
      'reply_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfReactionsMeta =
      const VerificationMeta('numberOfReactions');
  @override
  late final GeneratedColumn<int> numberOfReactions = GeneratedColumn<int>(
      'number_of_reactions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        postId,
        comment,
        user,
        currentReaction,
        imageUrl,
        videoUrl,
        replyCount,
        numberOfReactions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_comments';
  @override
  VerificationContext validateIntegrity(
      Insertable<BlogPostCommentEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    context.handle(_userMeta, const VerificationResult.success());
    context.handle(_currentReactionMeta, const VerificationResult.success());
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('reply_count')) {
      context.handle(
          _replyCountMeta,
          replyCount.isAcceptableOrUnknown(
              data['reply_count']!, _replyCountMeta));
    } else if (isInserting) {
      context.missing(_replyCountMeta);
    }
    if (data.containsKey('number_of_reactions')) {
      context.handle(
          _numberOfReactionsMeta,
          numberOfReactions.isAcceptableOrUnknown(
              data['number_of_reactions']!, _numberOfReactionsMeta));
    } else if (isInserting) {
      context.missing(_numberOfReactionsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlogPostCommentEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlogPostCommentEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      postId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      user: $BlogPostCommentTableTable.$converterusern.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user'])),
      currentReaction: $BlogPostCommentTableTable.$convertercurrentReaction
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}current_reaction'])),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url'])!,
      replyCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reply_count'])!,
      numberOfReactions: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_reactions'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BlogPostCommentTableTable createAlias(String alias) {
    return $BlogPostCommentTableTable(attachedDatabase, alias);
  }

  static TypeConverter<UserEntity, String> $converteruser =
      const UserConverter();
  static TypeConverter<UserEntity?, String?> $converterusern =
      NullAwareTypeConverter.wrap($converteruser);
  static TypeConverter<ReactionEntity?, String?> $convertercurrentReaction =
      const NullableReactionConverter();
}

class BlogPostCommentEntry extends DataClass
    implements Insertable<BlogPostCommentEntry> {
  final String id;
  final String postId;
  final String comment;
  final UserEntity? user;
  final ReactionEntity? currentReaction;
  final String imageUrl;
  final String videoUrl;
  final int replyCount;
  final int numberOfReactions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BlogPostCommentEntry(
      {required this.id,
      required this.postId,
      required this.comment,
      this.user,
      this.currentReaction,
      required this.imageUrl,
      required this.videoUrl,
      required this.replyCount,
      required this.numberOfReactions,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['post_id'] = Variable<String>(postId);
    map['comment'] = Variable<String>(comment);
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(
          $BlogPostCommentTableTable.$converterusern.toSql(user));
    }
    if (!nullToAbsent || currentReaction != null) {
      map['current_reaction'] = Variable<String>($BlogPostCommentTableTable
          .$convertercurrentReaction
          .toSql(currentReaction));
    }
    map['image_url'] = Variable<String>(imageUrl);
    map['video_url'] = Variable<String>(videoUrl);
    map['reply_count'] = Variable<int>(replyCount);
    map['number_of_reactions'] = Variable<int>(numberOfReactions);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BlogPostCommentTableCompanion toCompanion(bool nullToAbsent) {
    return BlogPostCommentTableCompanion(
      id: Value(id),
      postId: Value(postId),
      comment: Value(comment),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      currentReaction: currentReaction == null && nullToAbsent
          ? const Value.absent()
          : Value(currentReaction),
      imageUrl: Value(imageUrl),
      videoUrl: Value(videoUrl),
      replyCount: Value(replyCount),
      numberOfReactions: Value(numberOfReactions),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BlogPostCommentEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlogPostCommentEntry(
      id: serializer.fromJson<String>(json['id']),
      postId: serializer.fromJson<String>(json['postId']),
      comment: serializer.fromJson<String>(json['comment']),
      user: serializer.fromJson<UserEntity?>(json['user']),
      currentReaction:
          serializer.fromJson<ReactionEntity?>(json['currentReaction']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      replyCount: serializer.fromJson<int>(json['replyCount']),
      numberOfReactions: serializer.fromJson<int>(json['numberOfReactions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'postId': serializer.toJson<String>(postId),
      'comment': serializer.toJson<String>(comment),
      'user': serializer.toJson<UserEntity?>(user),
      'currentReaction': serializer.toJson<ReactionEntity?>(currentReaction),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'replyCount': serializer.toJson<int>(replyCount),
      'numberOfReactions': serializer.toJson<int>(numberOfReactions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BlogPostCommentEntry copyWith(
          {String? id,
          String? postId,
          String? comment,
          Value<UserEntity?> user = const Value.absent(),
          Value<ReactionEntity?> currentReaction = const Value.absent(),
          String? imageUrl,
          String? videoUrl,
          int? replyCount,
          int? numberOfReactions,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BlogPostCommentEntry(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        comment: comment ?? this.comment,
        user: user.present ? user.value : this.user,
        currentReaction: currentReaction.present
            ? currentReaction.value
            : this.currentReaction,
        imageUrl: imageUrl ?? this.imageUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        replyCount: replyCount ?? this.replyCount,
        numberOfReactions: numberOfReactions ?? this.numberOfReactions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BlogPostCommentEntry copyWithCompanion(BlogPostCommentTableCompanion data) {
    return BlogPostCommentEntry(
      id: data.id.present ? data.id.value : this.id,
      postId: data.postId.present ? data.postId.value : this.postId,
      comment: data.comment.present ? data.comment.value : this.comment,
      user: data.user.present ? data.user.value : this.user,
      currentReaction: data.currentReaction.present
          ? data.currentReaction.value
          : this.currentReaction,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      replyCount:
          data.replyCount.present ? data.replyCount.value : this.replyCount,
      numberOfReactions: data.numberOfReactions.present
          ? data.numberOfReactions.value
          : this.numberOfReactions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostCommentEntry(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('user: $user, ')
          ..write('currentReaction: $currentReaction, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('replyCount: $replyCount, ')
          ..write('numberOfReactions: $numberOfReactions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, postId, comment, user, currentReaction,
      imageUrl, videoUrl, replyCount, numberOfReactions, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlogPostCommentEntry &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.comment == this.comment &&
          other.user == this.user &&
          other.currentReaction == this.currentReaction &&
          other.imageUrl == this.imageUrl &&
          other.videoUrl == this.videoUrl &&
          other.replyCount == this.replyCount &&
          other.numberOfReactions == this.numberOfReactions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BlogPostCommentTableCompanion
    extends UpdateCompanion<BlogPostCommentEntry> {
  final Value<String> id;
  final Value<String> postId;
  final Value<String> comment;
  final Value<UserEntity?> user;
  final Value<ReactionEntity?> currentReaction;
  final Value<String> imageUrl;
  final Value<String> videoUrl;
  final Value<int> replyCount;
  final Value<int> numberOfReactions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BlogPostCommentTableCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.comment = const Value.absent(),
    this.user = const Value.absent(),
    this.currentReaction = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.replyCount = const Value.absent(),
    this.numberOfReactions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlogPostCommentTableCompanion.insert({
    required String id,
    required String postId,
    required String comment,
    this.user = const Value.absent(),
    this.currentReaction = const Value.absent(),
    required String imageUrl,
    required String videoUrl,
    required int replyCount,
    required int numberOfReactions,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        postId = Value(postId),
        comment = Value(comment),
        imageUrl = Value(imageUrl),
        videoUrl = Value(videoUrl),
        replyCount = Value(replyCount),
        numberOfReactions = Value(numberOfReactions),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BlogPostCommentEntry> custom({
    Expression<String>? id,
    Expression<String>? postId,
    Expression<String>? comment,
    Expression<String>? user,
    Expression<String>? currentReaction,
    Expression<String>? imageUrl,
    Expression<String>? videoUrl,
    Expression<int>? replyCount,
    Expression<int>? numberOfReactions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (comment != null) 'comment': comment,
      if (user != null) 'user': user,
      if (currentReaction != null) 'current_reaction': currentReaction,
      if (imageUrl != null) 'image_url': imageUrl,
      if (videoUrl != null) 'video_url': videoUrl,
      if (replyCount != null) 'reply_count': replyCount,
      if (numberOfReactions != null) 'number_of_reactions': numberOfReactions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlogPostCommentTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? postId,
      Value<String>? comment,
      Value<UserEntity?>? user,
      Value<ReactionEntity?>? currentReaction,
      Value<String>? imageUrl,
      Value<String>? videoUrl,
      Value<int>? replyCount,
      Value<int>? numberOfReactions,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BlogPostCommentTableCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      comment: comment ?? this.comment,
      user: user ?? this.user,
      currentReaction: currentReaction ?? this.currentReaction,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      replyCount: replyCount ?? this.replyCount,
      numberOfReactions: numberOfReactions ?? this.numberOfReactions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(
          $BlogPostCommentTableTable.$converterusern.toSql(user.value));
    }
    if (currentReaction.present) {
      map['current_reaction'] = Variable<String>($BlogPostCommentTableTable
          .$convertercurrentReaction
          .toSql(currentReaction.value));
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (replyCount.present) {
      map['reply_count'] = Variable<int>(replyCount.value);
    }
    if (numberOfReactions.present) {
      map['number_of_reactions'] = Variable<int>(numberOfReactions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostCommentTableCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('user: $user, ')
          ..write('currentReaction: $currentReaction, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('replyCount: $replyCount, ')
          ..write('numberOfReactions: $numberOfReactions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BlogPostCategoryTableTable extends BlogPostCategoryTable
    with TableInfo<$BlogPostCategoryTableTable, BlogPostCategoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlogPostCategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'));
  static const VerificationMeta _numberOfArticlesMeta =
      const VerificationMeta('numberOfArticles');
  @override
  late final GeneratedColumn<int> numberOfArticles = GeneratedColumn<int>(
      'number_of_articles', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfPublicArticlesMeta =
      const VerificationMeta('numberOfPublicArticles');
  @override
  late final GeneratedColumn<int> numberOfPublicArticles = GeneratedColumn<int>(
      'number_of_public_articles', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        active,
        numberOfArticles,
        numberOfPublicArticles,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<BlogPostCategoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('number_of_articles')) {
      context.handle(
          _numberOfArticlesMeta,
          numberOfArticles.isAcceptableOrUnknown(
              data['number_of_articles']!, _numberOfArticlesMeta));
    } else if (isInserting) {
      context.missing(_numberOfArticlesMeta);
    }
    if (data.containsKey('number_of_public_articles')) {
      context.handle(
          _numberOfPublicArticlesMeta,
          numberOfPublicArticles.isAcceptableOrUnknown(
              data['number_of_public_articles']!, _numberOfPublicArticlesMeta));
    } else if (isInserting) {
      context.missing(_numberOfPublicArticlesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlogPostCategoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlogPostCategoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      numberOfArticles: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_articles'])!,
      numberOfPublicArticles: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}number_of_public_articles'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BlogPostCategoryTableTable createAlias(String alias) {
    return $BlogPostCategoryTableTable(attachedDatabase, alias);
  }
}

class BlogPostCategoryEntry extends DataClass
    implements Insertable<BlogPostCategoryEntry> {
  final String id;
  final String name;
  final bool active;
  final int numberOfArticles;
  final int numberOfPublicArticles;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BlogPostCategoryEntry(
      {required this.id,
      required this.name,
      required this.active,
      required this.numberOfArticles,
      required this.numberOfPublicArticles,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    map['number_of_articles'] = Variable<int>(numberOfArticles);
    map['number_of_public_articles'] = Variable<int>(numberOfPublicArticles);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BlogPostCategoryTableCompanion toCompanion(bool nullToAbsent) {
    return BlogPostCategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
      numberOfArticles: Value(numberOfArticles),
      numberOfPublicArticles: Value(numberOfPublicArticles),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BlogPostCategoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlogPostCategoryEntry(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
      numberOfArticles: serializer.fromJson<int>(json['numberOfArticles']),
      numberOfPublicArticles:
          serializer.fromJson<int>(json['numberOfPublicArticles']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
      'numberOfArticles': serializer.toJson<int>(numberOfArticles),
      'numberOfPublicArticles': serializer.toJson<int>(numberOfPublicArticles),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BlogPostCategoryEntry copyWith(
          {String? id,
          String? name,
          bool? active,
          int? numberOfArticles,
          int? numberOfPublicArticles,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BlogPostCategoryEntry(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        numberOfArticles: numberOfArticles ?? this.numberOfArticles,
        numberOfPublicArticles:
            numberOfPublicArticles ?? this.numberOfPublicArticles,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BlogPostCategoryEntry copyWithCompanion(BlogPostCategoryTableCompanion data) {
    return BlogPostCategoryEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
      numberOfArticles: data.numberOfArticles.present
          ? data.numberOfArticles.value
          : this.numberOfArticles,
      numberOfPublicArticles: data.numberOfPublicArticles.present
          ? data.numberOfPublicArticles.value
          : this.numberOfPublicArticles,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostCategoryEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('numberOfArticles: $numberOfArticles, ')
          ..write('numberOfPublicArticles: $numberOfPublicArticles, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active, numberOfArticles,
      numberOfPublicArticles, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlogPostCategoryEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active &&
          other.numberOfArticles == this.numberOfArticles &&
          other.numberOfPublicArticles == this.numberOfPublicArticles &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BlogPostCategoryTableCompanion
    extends UpdateCompanion<BlogPostCategoryEntry> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> active;
  final Value<int> numberOfArticles;
  final Value<int> numberOfPublicArticles;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BlogPostCategoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.numberOfArticles = const Value.absent(),
    this.numberOfPublicArticles = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlogPostCategoryTableCompanion.insert({
    required String id,
    required String name,
    required bool active,
    required int numberOfArticles,
    required int numberOfPublicArticles,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        active = Value(active),
        numberOfArticles = Value(numberOfArticles),
        numberOfPublicArticles = Value(numberOfPublicArticles),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BlogPostCategoryEntry> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<int>? numberOfArticles,
    Expression<int>? numberOfPublicArticles,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (numberOfArticles != null) 'number_of_articles': numberOfArticles,
      if (numberOfPublicArticles != null)
        'number_of_public_articles': numberOfPublicArticles,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlogPostCategoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<bool>? active,
      Value<int>? numberOfArticles,
      Value<int>? numberOfPublicArticles,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BlogPostCategoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      numberOfArticles: numberOfArticles ?? this.numberOfArticles,
      numberOfPublicArticles:
          numberOfPublicArticles ?? this.numberOfPublicArticles,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (numberOfArticles.present) {
      map['number_of_articles'] = Variable<int>(numberOfArticles.value);
    }
    if (numberOfPublicArticles.present) {
      map['number_of_public_articles'] =
          Variable<int>(numberOfPublicArticles.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogPostCategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('numberOfArticles: $numberOfArticles, ')
          ..write('numberOfPublicArticles: $numberOfPublicArticles, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseAssessmentQuestionTableTable extends CourseAssessmentQuestionTable
    with
        TableInfo<$CourseAssessmentQuestionTableTable,
            CourseAssessmentQuestionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseAssessmentQuestionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> options =
      GeneratedColumn<String>('options', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $CourseAssessmentQuestionTableTable.$converteroptions);
  static const VerificationMeta _correctAnswersMeta =
      const VerificationMeta('correctAnswers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      correctAnswers = GeneratedColumn<String>(
              'correct_answers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $CourseAssessmentQuestionTableTable.$convertercorrectAnswers);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentQuestionTypeEntity,
      String> type = GeneratedColumn<String>('type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<AssessmentQuestionTypeEntity>(
          $CourseAssessmentQuestionTableTable.$convertertype);
  static const VerificationMeta _passingOptionMeta =
      const VerificationMeta('passingOption');
  @override
  late final GeneratedColumnWithTypeConverter<
      AssessmentQuestionPassingOptionEntity,
      String> passingOption = GeneratedColumn<String>(
          'passing_option', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<AssessmentQuestionPassingOptionEntity>(
          $CourseAssessmentQuestionTableTable.$converterpassingOption);
  static const VerificationMeta _userAnswerMeta =
      const VerificationMeta('userAnswer');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentUserAnswerEntity?,
      String> userAnswer = GeneratedColumn<String>(
          'user_answer', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false)
      .withConverter<AssessmentUserAnswerEntity?>(
          $CourseAssessmentQuestionTableTable.$converteruserAnswern);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        question,
        options,
        correctAnswers,
        order,
        type,
        passingOption,
        userAnswer,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_assessment_questions';
  @override
  VerificationContext validateIntegrity(
      Insertable<CourseAssessmentQuestionEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    context.handle(_optionsMeta, const VerificationResult.success());
    context.handle(_correctAnswersMeta, const VerificationResult.success());
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_passingOptionMeta, const VerificationResult.success());
    context.handle(_userAnswerMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseAssessmentQuestionEntry map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseAssessmentQuestionEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      options: $CourseAssessmentQuestionTableTable.$converteroptions.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}options'])!),
      correctAnswers: $CourseAssessmentQuestionTableTable
          .$convertercorrectAnswers
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}correct_answers'])!),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      type: $CourseAssessmentQuestionTableTable.$convertertype.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      passingOption: $CourseAssessmentQuestionTableTable.$converterpassingOption
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}passing_option'])!),
      userAnswer: $CourseAssessmentQuestionTableTable.$converteruserAnswern
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}user_answer'])),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CourseAssessmentQuestionTableTable createAlias(String alias) {
    return $CourseAssessmentQuestionTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteroptions =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertercorrectAnswers =
      const StringListConverter();
  static TypeConverter<AssessmentQuestionTypeEntity, String> $convertertype =
      const AssessmentQuestionTypeConverter();
  static TypeConverter<AssessmentQuestionPassingOptionEntity, String>
      $converterpassingOption =
      const AssessmentQuestionPassingOptionConverter();
  static TypeConverter<AssessmentUserAnswerEntity, String>
      $converteruserAnswer = const AssessmentUserAnswerConverter();
  static TypeConverter<AssessmentUserAnswerEntity?, String?>
      $converteruserAnswern = NullAwareTypeConverter.wrap($converteruserAnswer);
}

class CourseAssessmentQuestionEntry extends DataClass
    implements Insertable<CourseAssessmentQuestionEntry> {
  final String id;
  final String courseId;
  final String question;
  final List<String> options;
  final List<String> correctAnswers;
  final int order;
  final AssessmentQuestionTypeEntity type;
  final AssessmentQuestionPassingOptionEntity passingOption;
  final AssessmentUserAnswerEntity? userAnswer;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const CourseAssessmentQuestionEntry(
      {required this.id,
      required this.courseId,
      required this.question,
      required this.options,
      required this.correctAnswers,
      required this.order,
      required this.type,
      required this.passingOption,
      this.userAnswer,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['course_id'] = Variable<String>(courseId);
    map['question'] = Variable<String>(question);
    {
      map['options'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$converteroptions.toSql(options));
    }
    {
      map['correct_answers'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$convertercorrectAnswers
              .toSql(correctAnswers));
    }
    map['order'] = Variable<int>(order);
    {
      map['type'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$convertertype.toSql(type));
    }
    {
      map['passing_option'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$converterpassingOption
              .toSql(passingOption));
    }
    if (!nullToAbsent || userAnswer != null) {
      map['user_answer'] = Variable<String>($CourseAssessmentQuestionTableTable
          .$converteruserAnswern
          .toSql(userAnswer));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CourseAssessmentQuestionTableCompanion toCompanion(bool nullToAbsent) {
    return CourseAssessmentQuestionTableCompanion(
      id: Value(id),
      courseId: Value(courseId),
      question: Value(question),
      options: Value(options),
      correctAnswers: Value(correctAnswers),
      order: Value(order),
      type: Value(type),
      passingOption: Value(passingOption),
      userAnswer: userAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(userAnswer),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CourseAssessmentQuestionEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseAssessmentQuestionEntry(
      id: serializer.fromJson<String>(json['id']),
      courseId: serializer.fromJson<String>(json['courseId']),
      question: serializer.fromJson<String>(json['question']),
      options: serializer.fromJson<List<String>>(json['options']),
      correctAnswers: serializer.fromJson<List<String>>(json['correctAnswers']),
      order: serializer.fromJson<int>(json['order']),
      type: serializer.fromJson<AssessmentQuestionTypeEntity>(json['type']),
      passingOption: serializer.fromJson<AssessmentQuestionPassingOptionEntity>(
          json['passingOption']),
      userAnswer:
          serializer.fromJson<AssessmentUserAnswerEntity?>(json['userAnswer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'courseId': serializer.toJson<String>(courseId),
      'question': serializer.toJson<String>(question),
      'options': serializer.toJson<List<String>>(options),
      'correctAnswers': serializer.toJson<List<String>>(correctAnswers),
      'order': serializer.toJson<int>(order),
      'type': serializer.toJson<AssessmentQuestionTypeEntity>(type),
      'passingOption': serializer
          .toJson<AssessmentQuestionPassingOptionEntity>(passingOption),
      'userAnswer': serializer.toJson<AssessmentUserAnswerEntity?>(userAnswer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CourseAssessmentQuestionEntry copyWith(
          {String? id,
          String? courseId,
          String? question,
          List<String>? options,
          List<String>? correctAnswers,
          int? order,
          AssessmentQuestionTypeEntity? type,
          AssessmentQuestionPassingOptionEntity? passingOption,
          Value<AssessmentUserAnswerEntity?> userAnswer = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CourseAssessmentQuestionEntry(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        question: question ?? this.question,
        options: options ?? this.options,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        order: order ?? this.order,
        type: type ?? this.type,
        passingOption: passingOption ?? this.passingOption,
        userAnswer: userAnswer.present ? userAnswer.value : this.userAnswer,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CourseAssessmentQuestionEntry copyWithCompanion(
      CourseAssessmentQuestionTableCompanion data) {
    return CourseAssessmentQuestionEntry(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      question: data.question.present ? data.question.value : this.question,
      options: data.options.present ? data.options.value : this.options,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
      order: data.order.present ? data.order.value : this.order,
      type: data.type.present ? data.type.value : this.type,
      passingOption: data.passingOption.present
          ? data.passingOption.value
          : this.passingOption,
      userAnswer:
          data.userAnswer.present ? data.userAnswer.value : this.userAnswer,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseAssessmentQuestionEntry(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('order: $order, ')
          ..write('type: $type, ')
          ..write('passingOption: $passingOption, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      courseId,
      question,
      options,
      correctAnswers,
      order,
      type,
      passingOption,
      userAnswer,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseAssessmentQuestionEntry &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.question == this.question &&
          other.options == this.options &&
          other.correctAnswers == this.correctAnswers &&
          other.order == this.order &&
          other.type == this.type &&
          other.passingOption == this.passingOption &&
          other.userAnswer == this.userAnswer &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CourseAssessmentQuestionTableCompanion
    extends UpdateCompanion<CourseAssessmentQuestionEntry> {
  final Value<String> id;
  final Value<String> courseId;
  final Value<String> question;
  final Value<List<String>> options;
  final Value<List<String>> correctAnswers;
  final Value<int> order;
  final Value<AssessmentQuestionTypeEntity> type;
  final Value<AssessmentQuestionPassingOptionEntity> passingOption;
  final Value<AssessmentUserAnswerEntity?> userAnswer;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CourseAssessmentQuestionTableCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.question = const Value.absent(),
    this.options = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.order = const Value.absent(),
    this.type = const Value.absent(),
    this.passingOption = const Value.absent(),
    this.userAnswer = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseAssessmentQuestionTableCompanion.insert({
    required String id,
    required String courseId,
    required String question,
    required List<String> options,
    required List<String> correctAnswers,
    required int order,
    required AssessmentQuestionTypeEntity type,
    required AssessmentQuestionPassingOptionEntity passingOption,
    this.userAnswer = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        courseId = Value(courseId),
        question = Value(question),
        options = Value(options),
        correctAnswers = Value(correctAnswers),
        order = Value(order),
        type = Value(type),
        passingOption = Value(passingOption),
        createdAt = Value(createdAt);
  static Insertable<CourseAssessmentQuestionEntry> custom({
    Expression<String>? id,
    Expression<String>? courseId,
    Expression<String>? question,
    Expression<String>? options,
    Expression<String>? correctAnswers,
    Expression<int>? order,
    Expression<String>? type,
    Expression<String>? passingOption,
    Expression<String>? userAnswer,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (question != null) 'question': question,
      if (options != null) 'options': options,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (order != null) 'order': order,
      if (type != null) 'type': type,
      if (passingOption != null) 'passing_option': passingOption,
      if (userAnswer != null) 'user_answer': userAnswer,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseAssessmentQuestionTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? courseId,
      Value<String>? question,
      Value<List<String>>? options,
      Value<List<String>>? correctAnswers,
      Value<int>? order,
      Value<AssessmentQuestionTypeEntity>? type,
      Value<AssessmentQuestionPassingOptionEntity>? passingOption,
      Value<AssessmentUserAnswerEntity?>? userAnswer,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CourseAssessmentQuestionTableCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      order: order ?? this.order,
      type: type ?? this.type,
      passingOption: passingOption ?? this.passingOption,
      userAnswer: userAnswer ?? this.userAnswer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (options.present) {
      map['options'] = Variable<String>($CourseAssessmentQuestionTableTable
          .$converteroptions
          .toSql(options.value));
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$convertercorrectAnswers
              .toSql(correctAnswers.value));
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$convertertype.toSql(type.value));
    }
    if (passingOption.present) {
      map['passing_option'] = Variable<String>(
          $CourseAssessmentQuestionTableTable.$converterpassingOption
              .toSql(passingOption.value));
    }
    if (userAnswer.present) {
      map['user_answer'] = Variable<String>($CourseAssessmentQuestionTableTable
          .$converteruserAnswern
          .toSql(userAnswer.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseAssessmentQuestionTableCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('order: $order, ')
          ..write('type: $type, ')
          ..write('passingOption: $passingOption, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseCategoryTableTable extends CourseCategoryTable
    with TableInfo<$CourseCategoryTableTable, CourseCategoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseCategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<CourseCategoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseCategoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseCategoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CourseCategoryTableTable createAlias(String alias) {
    return $CourseCategoryTableTable(attachedDatabase, alias);
  }
}

class CourseCategoryEntry extends DataClass
    implements Insertable<CourseCategoryEntry> {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CourseCategoryEntry(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CourseCategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CourseCategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CourseCategoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseCategoryEntry(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CourseCategoryEntry copyWith(
          {String? id,
          String? name,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CourseCategoryEntry(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CourseCategoryEntry copyWithCompanion(CourseCategoryTableCompanion data) {
    return CourseCategoryEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseCategoryEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseCategoryEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CourseCategoryTableCompanion
    extends UpdateCompanion<CourseCategoryEntry> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CourseCategoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseCategoryTableCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CourseCategoryEntry> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseCategoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CourseCategoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseCategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseTableTable extends CourseTable
    with TableInfo<$CourseTableTable, CourseEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _objectiveMeta =
      const VerificationMeta('objective');
  @override
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
      'objective', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _learningOutcomeMeta =
      const VerificationMeta('learningOutcome');
  @override
  late final GeneratedColumn<String> learningOutcome = GeneratedColumn<String>(
      'learning_outcome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coverImageMeta =
      const VerificationMeta('coverImage');
  @override
  late final GeneratedColumnWithTypeConverter<ImageUrlEntity, String>
      coverImage = GeneratedColumn<String>('cover_image', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ImageUrlEntity>(
              $CourseTableTable.$convertercoverImage);
  static const VerificationMeta _urlLinkMeta =
      const VerificationMeta('urlLink');
  @override
  late final GeneratedColumn<String> urlLink = GeneratedColumn<String>(
      'url_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDisplayVideoMeta =
      const VerificationMeta('isDisplayVideo');
  @override
  late final GeneratedColumn<bool> isDisplayVideo = GeneratedColumn<bool>(
      'is_display_video', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_display_video" IN (0, 1))'));
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumnWithTypeConverter<List<CourseCategoryEntity>,
      String> categories = GeneratedColumn<String>(
          'categories', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<CourseCategoryEntity>>(
          $CourseTableTable.$convertercategories);
  static const VerificationMeta _downloadableOptionMeta =
      const VerificationMeta('downloadableOption');
  @override
  late final GeneratedColumnWithTypeConverter<CourseDownloadableOptionEntity,
      String> downloadableOption = GeneratedColumn<String>(
          'downloadable_option', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<CourseDownloadableOptionEntity>(
          $CourseTableTable.$converterdownloadableOption);
  static const VerificationMeta _courseLevelMeta =
      const VerificationMeta('courseLevel');
  @override
  late final GeneratedColumnWithTypeConverter<CourseLevelEntity, String>
      courseLevel = GeneratedColumn<String>('course_level', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CourseLevelEntity>(
              $CourseTableTable.$convertercourseLevel);
  static const VerificationMeta _courseTypeMeta =
      const VerificationMeta('courseType');
  @override
  late final GeneratedColumnWithTypeConverter<CourseTypeEntity, String>
      courseType = GeneratedColumn<String>('course_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CourseTypeEntity>(
              $CourseTableTable.$convertercourseType);
  static const VerificationMeta _isAllowFeedbackMeta =
      const VerificationMeta('isAllowFeedback');
  @override
  late final GeneratedColumn<bool> isAllowFeedback = GeneratedColumn<bool>(
      'is_allow_feedback', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_allow_feedback" IN (0, 1))'));
  static const VerificationMeta _isAllowDiscussionMeta =
      const VerificationMeta('isAllowDiscussion');
  @override
  late final GeneratedColumn<bool> isAllowDiscussion = GeneratedColumn<bool>(
      'is_allow_discussion', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_allow_discussion" IN (0, 1))'));
  static const VerificationMeta _discussionMeta =
      const VerificationMeta('discussion');
  @override
  late final GeneratedColumnWithTypeConverter<CourseDiscussionEntity?, String>
      discussion = GeneratedColumn<String>('discussion', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<CourseDiscussionEntity?>(
              $CourseTableTable.$converterdiscussionn);
  static const VerificationMeta _acceptableScoreForAssignmentMeta =
      const VerificationMeta('acceptableScoreForAssignment');
  @override
  late final GeneratedColumn<int> acceptableScoreForAssignment =
      GeneratedColumn<int>(
          'acceptable_score_for_assignment', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _acceptableScoreForAssessmentMeta =
      const VerificationMeta('acceptableScoreForAssessment');
  @override
  late final GeneratedColumn<int> acceptableScoreForAssessment =
      GeneratedColumn<int>(
          'acceptable_score_for_assessment', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estimatedDurationMeta =
      const VerificationMeta('estimatedDuration');
  @override
  late final GeneratedColumnWithTypeConverter<CourseDurationEntity, String>
      estimatedDuration = GeneratedColumn<String>(
              'estimated_duration', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CourseDurationEntity>(
              $CourseTableTable.$converterestimatedDuration);
  static const VerificationMeta _numberOfEnrollmentsMeta =
      const VerificationMeta('numberOfEnrollments');
  @override
  late final GeneratedColumn<int> numberOfEnrollments = GeneratedColumn<int>(
      'number_of_enrollments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalLecturesMeta =
      const VerificationMeta('totalLectures');
  @override
  late final GeneratedColumn<int> totalLectures = GeneratedColumn<int>(
      'total_lectures', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalQuizzesMeta =
      const VerificationMeta('totalQuizzes');
  @override
  late final GeneratedColumn<int> totalQuizzes = GeneratedColumn<int>(
      'total_quizzes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _courseOrderTypeMeta =
      const VerificationMeta('courseOrderType');
  @override
  late final GeneratedColumnWithTypeConverter<CourseMaterialOrderTypeEntity,
      String> courseOrderType = GeneratedColumn<String>(
          'course_order_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<CourseMaterialOrderTypeEntity>(
          $CourseTableTable.$convertercourseOrderType);
  static const VerificationMeta _lectureOrderTypeMeta =
      const VerificationMeta('lectureOrderType');
  @override
  late final GeneratedColumnWithTypeConverter<CourseMaterialOrderTypeEntity,
      String> lectureOrderType = GeneratedColumn<String>(
          'lecture_order_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<CourseMaterialOrderTypeEntity>(
          $CourseTableTable.$converterlectureOrderType);
  static const VerificationMeta _courseOrderMeta =
      const VerificationMeta('courseOrder');
  @override
  late final GeneratedColumnWithTypeConverter<List<CourseMaterialEntity>,
      String> courseOrder = GeneratedColumn<String>(
          'course_order', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<CourseMaterialEntity>>(
          $CourseTableTable.$convertercourseOrder);
  static const VerificationMeta _lectureOrderByLectureIdMeta =
      const VerificationMeta('lectureOrderByLectureId');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, List<String>>, String>
      lectureOrderByLectureId = GeneratedColumn<String>(
              'lecture_order_by_lecture_id', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, List<String>>>(
              $CourseTableTable.$converterlectureOrderByLectureId);
  static const VerificationMeta _evaluationMessageMeta =
      const VerificationMeta('evaluationMessage');
  @override
  late final GeneratedColumn<String> evaluationMessage =
      GeneratedColumn<String>('evaluation_message', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isXApiCourseMeta =
      const VerificationMeta('isXApiCourse');
  @override
  late final GeneratedColumn<bool> isXApiCourse = GeneratedColumn<bool>(
      'is_x_api_course', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_x_api_course" IN (0, 1))'));
  static const VerificationMeta _resourceFileUrlMeta =
      const VerificationMeta('resourceFileUrl');
  @override
  late final GeneratedColumn<String> resourceFileUrl = GeneratedColumn<String>(
      'resource_file_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasUserTakenCourseMeta =
      const VerificationMeta('hasUserTakenCourse');
  @override
  late final GeneratedColumn<bool> hasUserTakenCourse = GeneratedColumn<bool>(
      'has_user_taken_course', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_user_taken_course" IN (0, 1))'));
  static const VerificationMeta _isUserCanAccessCourseMeta =
      const VerificationMeta('isUserCanAccessCourse');
  @override
  late final GeneratedColumn<bool> isUserCanAccessCourse =
      GeneratedColumn<bool>('is_user_can_access_course', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_user_can_access_course" IN (0, 1))'));
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumnWithTypeConverter<UserEntity?, String> createdBy =
      GeneratedColumn<String>('created_by', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<UserEntity?>($CourseTableTable.$convertercreatedByn);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        objective,
        learningOutcome,
        coverImage,
        urlLink,
        isDisplayVideo,
        videoUrl,
        categories,
        downloadableOption,
        courseLevel,
        courseType,
        isAllowFeedback,
        isAllowDiscussion,
        discussion,
        acceptableScoreForAssignment,
        acceptableScoreForAssessment,
        estimatedDuration,
        numberOfEnrollments,
        totalLectures,
        totalQuizzes,
        viewCount,
        rating,
        courseOrderType,
        lectureOrderType,
        courseOrder,
        lectureOrderByLectureId,
        evaluationMessage,
        isXApiCourse,
        resourceFileUrl,
        hasUserTakenCourse,
        isUserCanAccessCourse,
        createdBy,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<CourseEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('objective')) {
      context.handle(_objectiveMeta,
          objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta));
    } else if (isInserting) {
      context.missing(_objectiveMeta);
    }
    if (data.containsKey('learning_outcome')) {
      context.handle(
          _learningOutcomeMeta,
          learningOutcome.isAcceptableOrUnknown(
              data['learning_outcome']!, _learningOutcomeMeta));
    } else if (isInserting) {
      context.missing(_learningOutcomeMeta);
    }
    context.handle(_coverImageMeta, const VerificationResult.success());
    if (data.containsKey('url_link')) {
      context.handle(_urlLinkMeta,
          urlLink.isAcceptableOrUnknown(data['url_link']!, _urlLinkMeta));
    } else if (isInserting) {
      context.missing(_urlLinkMeta);
    }
    if (data.containsKey('is_display_video')) {
      context.handle(
          _isDisplayVideoMeta,
          isDisplayVideo.isAcceptableOrUnknown(
              data['is_display_video']!, _isDisplayVideoMeta));
    } else if (isInserting) {
      context.missing(_isDisplayVideoMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    context.handle(_categoriesMeta, const VerificationResult.success());
    context.handle(_downloadableOptionMeta, const VerificationResult.success());
    context.handle(_courseLevelMeta, const VerificationResult.success());
    context.handle(_courseTypeMeta, const VerificationResult.success());
    if (data.containsKey('is_allow_feedback')) {
      context.handle(
          _isAllowFeedbackMeta,
          isAllowFeedback.isAcceptableOrUnknown(
              data['is_allow_feedback']!, _isAllowFeedbackMeta));
    } else if (isInserting) {
      context.missing(_isAllowFeedbackMeta);
    }
    if (data.containsKey('is_allow_discussion')) {
      context.handle(
          _isAllowDiscussionMeta,
          isAllowDiscussion.isAcceptableOrUnknown(
              data['is_allow_discussion']!, _isAllowDiscussionMeta));
    } else if (isInserting) {
      context.missing(_isAllowDiscussionMeta);
    }
    context.handle(_discussionMeta, const VerificationResult.success());
    if (data.containsKey('acceptable_score_for_assignment')) {
      context.handle(
          _acceptableScoreForAssignmentMeta,
          acceptableScoreForAssignment.isAcceptableOrUnknown(
              data['acceptable_score_for_assignment']!,
              _acceptableScoreForAssignmentMeta));
    } else if (isInserting) {
      context.missing(_acceptableScoreForAssignmentMeta);
    }
    if (data.containsKey('acceptable_score_for_assessment')) {
      context.handle(
          _acceptableScoreForAssessmentMeta,
          acceptableScoreForAssessment.isAcceptableOrUnknown(
              data['acceptable_score_for_assessment']!,
              _acceptableScoreForAssessmentMeta));
    } else if (isInserting) {
      context.missing(_acceptableScoreForAssessmentMeta);
    }
    context.handle(_estimatedDurationMeta, const VerificationResult.success());
    if (data.containsKey('number_of_enrollments')) {
      context.handle(
          _numberOfEnrollmentsMeta,
          numberOfEnrollments.isAcceptableOrUnknown(
              data['number_of_enrollments']!, _numberOfEnrollmentsMeta));
    } else if (isInserting) {
      context.missing(_numberOfEnrollmentsMeta);
    }
    if (data.containsKey('total_lectures')) {
      context.handle(
          _totalLecturesMeta,
          totalLectures.isAcceptableOrUnknown(
              data['total_lectures']!, _totalLecturesMeta));
    } else if (isInserting) {
      context.missing(_totalLecturesMeta);
    }
    if (data.containsKey('total_quizzes')) {
      context.handle(
          _totalQuizzesMeta,
          totalQuizzes.isAcceptableOrUnknown(
              data['total_quizzes']!, _totalQuizzesMeta));
    } else if (isInserting) {
      context.missing(_totalQuizzesMeta);
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    } else if (isInserting) {
      context.missing(_viewCountMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    context.handle(_courseOrderTypeMeta, const VerificationResult.success());
    context.handle(_lectureOrderTypeMeta, const VerificationResult.success());
    context.handle(_courseOrderMeta, const VerificationResult.success());
    context.handle(
        _lectureOrderByLectureIdMeta, const VerificationResult.success());
    if (data.containsKey('evaluation_message')) {
      context.handle(
          _evaluationMessageMeta,
          evaluationMessage.isAcceptableOrUnknown(
              data['evaluation_message']!, _evaluationMessageMeta));
    } else if (isInserting) {
      context.missing(_evaluationMessageMeta);
    }
    if (data.containsKey('is_x_api_course')) {
      context.handle(
          _isXApiCourseMeta,
          isXApiCourse.isAcceptableOrUnknown(
              data['is_x_api_course']!, _isXApiCourseMeta));
    } else if (isInserting) {
      context.missing(_isXApiCourseMeta);
    }
    if (data.containsKey('resource_file_url')) {
      context.handle(
          _resourceFileUrlMeta,
          resourceFileUrl.isAcceptableOrUnknown(
              data['resource_file_url']!, _resourceFileUrlMeta));
    } else if (isInserting) {
      context.missing(_resourceFileUrlMeta);
    }
    if (data.containsKey('has_user_taken_course')) {
      context.handle(
          _hasUserTakenCourseMeta,
          hasUserTakenCourse.isAcceptableOrUnknown(
              data['has_user_taken_course']!, _hasUserTakenCourseMeta));
    } else if (isInserting) {
      context.missing(_hasUserTakenCourseMeta);
    }
    if (data.containsKey('is_user_can_access_course')) {
      context.handle(
          _isUserCanAccessCourseMeta,
          isUserCanAccessCourse.isAcceptableOrUnknown(
              data['is_user_can_access_course']!, _isUserCanAccessCourseMeta));
    } else if (isInserting) {
      context.missing(_isUserCanAccessCourseMeta);
    }
    context.handle(_createdByMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      objective: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}objective'])!,
      learningOutcome: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}learning_outcome'])!,
      coverImage: $CourseTableTable.$convertercoverImage.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}cover_image'])!),
      urlLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_link'])!,
      isDisplayVideo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_display_video'])!,
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url'])!,
      categories: $CourseTableTable.$convertercategories.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}categories'])!),
      downloadableOption: $CourseTableTable.$converterdownloadableOption
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}downloadable_option'])!),
      courseLevel: $CourseTableTable.$convertercourseLevel.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}course_level'])!),
      courseType: $CourseTableTable.$convertercourseType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}course_type'])!),
      isAllowFeedback: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_allow_feedback'])!,
      isAllowDiscussion: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_allow_discussion'])!,
      discussion: $CourseTableTable.$converterdiscussionn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}discussion'])),
      acceptableScoreForAssignment: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}acceptable_score_for_assignment'])!,
      acceptableScoreForAssessment: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}acceptable_score_for_assessment'])!,
      estimatedDuration: $CourseTableTable.$converterestimatedDuration.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}estimated_duration'])!),
      numberOfEnrollments: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_enrollments'])!,
      totalLectures: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_lectures'])!,
      totalQuizzes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_quizzes'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      courseOrderType: $CourseTableTable.$convertercourseOrderType.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}course_order_type'])!),
      lectureOrderType: $CourseTableTable.$converterlectureOrderType.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}lecture_order_type'])!),
      courseOrder: $CourseTableTable.$convertercourseOrder.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}course_order'])!),
      lectureOrderByLectureId: $CourseTableTable
          .$converterlectureOrderByLectureId
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}lecture_order_by_lecture_id'])!),
      evaluationMessage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}evaluation_message'])!,
      isXApiCourse: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_x_api_course'])!,
      resourceFileUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}resource_file_url'])!,
      hasUserTakenCourse: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_user_taken_course'])!,
      isUserCanAccessCourse: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_user_can_access_course'])!,
      createdBy: $CourseTableTable.$convertercreatedByn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CourseTableTable createAlias(String alias) {
    return $CourseTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ImageUrlEntity, String> $convertercoverImage =
      const ImageUrlConverter();
  static TypeConverter<List<CourseCategoryEntity>, String>
      $convertercategories = const CourseCategoryListConverter();
  static TypeConverter<CourseDownloadableOptionEntity, String>
      $converterdownloadableOption = const CourseDownloadOptionConverter();
  static TypeConverter<CourseLevelEntity, String> $convertercourseLevel =
      const CourseLevelConverter();
  static TypeConverter<CourseTypeEntity, String> $convertercourseType =
      const CourseTypeConverter();
  static TypeConverter<CourseDiscussionEntity, String> $converterdiscussion =
      const CourseDiscussionConverter();
  static TypeConverter<CourseDiscussionEntity?, String?> $converterdiscussionn =
      NullAwareTypeConverter.wrap($converterdiscussion);
  static TypeConverter<CourseDurationEntity, String>
      $converterestimatedDuration = const CourseDurationConverter();
  static TypeConverter<CourseMaterialOrderTypeEntity, String>
      $convertercourseOrderType = const CourseMaterialOrderTypeConverter();
  static TypeConverter<CourseMaterialOrderTypeEntity, String>
      $converterlectureOrderType = const CourseMaterialOrderTypeConverter();
  static TypeConverter<List<CourseMaterialEntity>, String>
      $convertercourseOrder = const CourseMaterialListConverter();
  static TypeConverter<Map<String, List<String>>, String>
      $converterlectureOrderByLectureId = const LectureOrderMapConverter();
  static TypeConverter<UserEntity, String> $convertercreatedBy =
      const UserConverter();
  static TypeConverter<UserEntity?, String?> $convertercreatedByn =
      NullAwareTypeConverter.wrap($convertercreatedBy);
}

class CourseEntry extends DataClass implements Insertable<CourseEntry> {
  final String id;
  final String title;
  final String description;
  final String objective;
  final String learningOutcome;
  final ImageUrlEntity coverImage;
  final String urlLink;
  final bool isDisplayVideo;
  final String videoUrl;
  final List<CourseCategoryEntity> categories;
  final CourseDownloadableOptionEntity downloadableOption;
  final CourseLevelEntity courseLevel;
  final CourseTypeEntity courseType;
  final bool isAllowFeedback;
  final bool isAllowDiscussion;
  final CourseDiscussionEntity? discussion;
  final int acceptableScoreForAssignment;
  final int acceptableScoreForAssessment;
  final CourseDurationEntity estimatedDuration;
  final int numberOfEnrollments;
  final int totalLectures;
  final int totalQuizzes;
  final int viewCount;
  final double rating;
  final CourseMaterialOrderTypeEntity courseOrderType;
  final CourseMaterialOrderTypeEntity lectureOrderType;
  final List<CourseMaterialEntity> courseOrder;
  final Map<String, List<String>> lectureOrderByLectureId;
  final String evaluationMessage;
  final bool isXApiCourse;
  final String resourceFileUrl;
  final bool hasUserTakenCourse;
  final bool isUserCanAccessCourse;
  final UserEntity? createdBy;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const CourseEntry(
      {required this.id,
      required this.title,
      required this.description,
      required this.objective,
      required this.learningOutcome,
      required this.coverImage,
      required this.urlLink,
      required this.isDisplayVideo,
      required this.videoUrl,
      required this.categories,
      required this.downloadableOption,
      required this.courseLevel,
      required this.courseType,
      required this.isAllowFeedback,
      required this.isAllowDiscussion,
      this.discussion,
      required this.acceptableScoreForAssignment,
      required this.acceptableScoreForAssessment,
      required this.estimatedDuration,
      required this.numberOfEnrollments,
      required this.totalLectures,
      required this.totalQuizzes,
      required this.viewCount,
      required this.rating,
      required this.courseOrderType,
      required this.lectureOrderType,
      required this.courseOrder,
      required this.lectureOrderByLectureId,
      required this.evaluationMessage,
      required this.isXApiCourse,
      required this.resourceFileUrl,
      required this.hasUserTakenCourse,
      required this.isUserCanAccessCourse,
      this.createdBy,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['objective'] = Variable<String>(objective);
    map['learning_outcome'] = Variable<String>(learningOutcome);
    {
      map['cover_image'] = Variable<String>(
          $CourseTableTable.$convertercoverImage.toSql(coverImage));
    }
    map['url_link'] = Variable<String>(urlLink);
    map['is_display_video'] = Variable<bool>(isDisplayVideo);
    map['video_url'] = Variable<String>(videoUrl);
    {
      map['categories'] = Variable<String>(
          $CourseTableTable.$convertercategories.toSql(categories));
    }
    {
      map['downloadable_option'] = Variable<String>($CourseTableTable
          .$converterdownloadableOption
          .toSql(downloadableOption));
    }
    {
      map['course_level'] = Variable<String>(
          $CourseTableTable.$convertercourseLevel.toSql(courseLevel));
    }
    {
      map['course_type'] = Variable<String>(
          $CourseTableTable.$convertercourseType.toSql(courseType));
    }
    map['is_allow_feedback'] = Variable<bool>(isAllowFeedback);
    map['is_allow_discussion'] = Variable<bool>(isAllowDiscussion);
    if (!nullToAbsent || discussion != null) {
      map['discussion'] = Variable<String>(
          $CourseTableTable.$converterdiscussionn.toSql(discussion));
    }
    map['acceptable_score_for_assignment'] =
        Variable<int>(acceptableScoreForAssignment);
    map['acceptable_score_for_assessment'] =
        Variable<int>(acceptableScoreForAssessment);
    {
      map['estimated_duration'] = Variable<String>($CourseTableTable
          .$converterestimatedDuration
          .toSql(estimatedDuration));
    }
    map['number_of_enrollments'] = Variable<int>(numberOfEnrollments);
    map['total_lectures'] = Variable<int>(totalLectures);
    map['total_quizzes'] = Variable<int>(totalQuizzes);
    map['view_count'] = Variable<int>(viewCount);
    map['rating'] = Variable<double>(rating);
    {
      map['course_order_type'] = Variable<String>(
          $CourseTableTable.$convertercourseOrderType.toSql(courseOrderType));
    }
    {
      map['lecture_order_type'] = Variable<String>(
          $CourseTableTable.$converterlectureOrderType.toSql(lectureOrderType));
    }
    {
      map['course_order'] = Variable<String>(
          $CourseTableTable.$convertercourseOrder.toSql(courseOrder));
    }
    {
      map['lecture_order_by_lecture_id'] = Variable<String>($CourseTableTable
          .$converterlectureOrderByLectureId
          .toSql(lectureOrderByLectureId));
    }
    map['evaluation_message'] = Variable<String>(evaluationMessage);
    map['is_x_api_course'] = Variable<bool>(isXApiCourse);
    map['resource_file_url'] = Variable<String>(resourceFileUrl);
    map['has_user_taken_course'] = Variable<bool>(hasUserTakenCourse);
    map['is_user_can_access_course'] = Variable<bool>(isUserCanAccessCourse);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(
          $CourseTableTable.$convertercreatedByn.toSql(createdBy));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CourseTableCompanion toCompanion(bool nullToAbsent) {
    return CourseTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      objective: Value(objective),
      learningOutcome: Value(learningOutcome),
      coverImage: Value(coverImage),
      urlLink: Value(urlLink),
      isDisplayVideo: Value(isDisplayVideo),
      videoUrl: Value(videoUrl),
      categories: Value(categories),
      downloadableOption: Value(downloadableOption),
      courseLevel: Value(courseLevel),
      courseType: Value(courseType),
      isAllowFeedback: Value(isAllowFeedback),
      isAllowDiscussion: Value(isAllowDiscussion),
      discussion: discussion == null && nullToAbsent
          ? const Value.absent()
          : Value(discussion),
      acceptableScoreForAssignment: Value(acceptableScoreForAssignment),
      acceptableScoreForAssessment: Value(acceptableScoreForAssessment),
      estimatedDuration: Value(estimatedDuration),
      numberOfEnrollments: Value(numberOfEnrollments),
      totalLectures: Value(totalLectures),
      totalQuizzes: Value(totalQuizzes),
      viewCount: Value(viewCount),
      rating: Value(rating),
      courseOrderType: Value(courseOrderType),
      lectureOrderType: Value(lectureOrderType),
      courseOrder: Value(courseOrder),
      lectureOrderByLectureId: Value(lectureOrderByLectureId),
      evaluationMessage: Value(evaluationMessage),
      isXApiCourse: Value(isXApiCourse),
      resourceFileUrl: Value(resourceFileUrl),
      hasUserTakenCourse: Value(hasUserTakenCourse),
      isUserCanAccessCourse: Value(isUserCanAccessCourse),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CourseEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      objective: serializer.fromJson<String>(json['objective']),
      learningOutcome: serializer.fromJson<String>(json['learningOutcome']),
      coverImage: serializer.fromJson<ImageUrlEntity>(json['coverImage']),
      urlLink: serializer.fromJson<String>(json['urlLink']),
      isDisplayVideo: serializer.fromJson<bool>(json['isDisplayVideo']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      categories:
          serializer.fromJson<List<CourseCategoryEntity>>(json['categories']),
      downloadableOption: serializer
          .fromJson<CourseDownloadableOptionEntity>(json['downloadableOption']),
      courseLevel: serializer.fromJson<CourseLevelEntity>(json['courseLevel']),
      courseType: serializer.fromJson<CourseTypeEntity>(json['courseType']),
      isAllowFeedback: serializer.fromJson<bool>(json['isAllowFeedback']),
      isAllowDiscussion: serializer.fromJson<bool>(json['isAllowDiscussion']),
      discussion:
          serializer.fromJson<CourseDiscussionEntity?>(json['discussion']),
      acceptableScoreForAssignment:
          serializer.fromJson<int>(json['acceptableScoreForAssignment']),
      acceptableScoreForAssessment:
          serializer.fromJson<int>(json['acceptableScoreForAssessment']),
      estimatedDuration:
          serializer.fromJson<CourseDurationEntity>(json['estimatedDuration']),
      numberOfEnrollments:
          serializer.fromJson<int>(json['numberOfEnrollments']),
      totalLectures: serializer.fromJson<int>(json['totalLectures']),
      totalQuizzes: serializer.fromJson<int>(json['totalQuizzes']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      rating: serializer.fromJson<double>(json['rating']),
      courseOrderType: serializer
          .fromJson<CourseMaterialOrderTypeEntity>(json['courseOrderType']),
      lectureOrderType: serializer
          .fromJson<CourseMaterialOrderTypeEntity>(json['lectureOrderType']),
      courseOrder:
          serializer.fromJson<List<CourseMaterialEntity>>(json['courseOrder']),
      lectureOrderByLectureId: serializer
          .fromJson<Map<String, List<String>>>(json['lectureOrderByLectureId']),
      evaluationMessage: serializer.fromJson<String>(json['evaluationMessage']),
      isXApiCourse: serializer.fromJson<bool>(json['isXApiCourse']),
      resourceFileUrl: serializer.fromJson<String>(json['resourceFileUrl']),
      hasUserTakenCourse: serializer.fromJson<bool>(json['hasUserTakenCourse']),
      isUserCanAccessCourse:
          serializer.fromJson<bool>(json['isUserCanAccessCourse']),
      createdBy: serializer.fromJson<UserEntity?>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'objective': serializer.toJson<String>(objective),
      'learningOutcome': serializer.toJson<String>(learningOutcome),
      'coverImage': serializer.toJson<ImageUrlEntity>(coverImage),
      'urlLink': serializer.toJson<String>(urlLink),
      'isDisplayVideo': serializer.toJson<bool>(isDisplayVideo),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'categories': serializer.toJson<List<CourseCategoryEntity>>(categories),
      'downloadableOption':
          serializer.toJson<CourseDownloadableOptionEntity>(downloadableOption),
      'courseLevel': serializer.toJson<CourseLevelEntity>(courseLevel),
      'courseType': serializer.toJson<CourseTypeEntity>(courseType),
      'isAllowFeedback': serializer.toJson<bool>(isAllowFeedback),
      'isAllowDiscussion': serializer.toJson<bool>(isAllowDiscussion),
      'discussion': serializer.toJson<CourseDiscussionEntity?>(discussion),
      'acceptableScoreForAssignment':
          serializer.toJson<int>(acceptableScoreForAssignment),
      'acceptableScoreForAssessment':
          serializer.toJson<int>(acceptableScoreForAssessment),
      'estimatedDuration':
          serializer.toJson<CourseDurationEntity>(estimatedDuration),
      'numberOfEnrollments': serializer.toJson<int>(numberOfEnrollments),
      'totalLectures': serializer.toJson<int>(totalLectures),
      'totalQuizzes': serializer.toJson<int>(totalQuizzes),
      'viewCount': serializer.toJson<int>(viewCount),
      'rating': serializer.toJson<double>(rating),
      'courseOrderType':
          serializer.toJson<CourseMaterialOrderTypeEntity>(courseOrderType),
      'lectureOrderType':
          serializer.toJson<CourseMaterialOrderTypeEntity>(lectureOrderType),
      'courseOrder': serializer.toJson<List<CourseMaterialEntity>>(courseOrder),
      'lectureOrderByLectureId':
          serializer.toJson<Map<String, List<String>>>(lectureOrderByLectureId),
      'evaluationMessage': serializer.toJson<String>(evaluationMessage),
      'isXApiCourse': serializer.toJson<bool>(isXApiCourse),
      'resourceFileUrl': serializer.toJson<String>(resourceFileUrl),
      'hasUserTakenCourse': serializer.toJson<bool>(hasUserTakenCourse),
      'isUserCanAccessCourse': serializer.toJson<bool>(isUserCanAccessCourse),
      'createdBy': serializer.toJson<UserEntity?>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CourseEntry copyWith(
          {String? id,
          String? title,
          String? description,
          String? objective,
          String? learningOutcome,
          ImageUrlEntity? coverImage,
          String? urlLink,
          bool? isDisplayVideo,
          String? videoUrl,
          List<CourseCategoryEntity>? categories,
          CourseDownloadableOptionEntity? downloadableOption,
          CourseLevelEntity? courseLevel,
          CourseTypeEntity? courseType,
          bool? isAllowFeedback,
          bool? isAllowDiscussion,
          Value<CourseDiscussionEntity?> discussion = const Value.absent(),
          int? acceptableScoreForAssignment,
          int? acceptableScoreForAssessment,
          CourseDurationEntity? estimatedDuration,
          int? numberOfEnrollments,
          int? totalLectures,
          int? totalQuizzes,
          int? viewCount,
          double? rating,
          CourseMaterialOrderTypeEntity? courseOrderType,
          CourseMaterialOrderTypeEntity? lectureOrderType,
          List<CourseMaterialEntity>? courseOrder,
          Map<String, List<String>>? lectureOrderByLectureId,
          String? evaluationMessage,
          bool? isXApiCourse,
          String? resourceFileUrl,
          bool? hasUserTakenCourse,
          bool? isUserCanAccessCourse,
          Value<UserEntity?> createdBy = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CourseEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        objective: objective ?? this.objective,
        learningOutcome: learningOutcome ?? this.learningOutcome,
        coverImage: coverImage ?? this.coverImage,
        urlLink: urlLink ?? this.urlLink,
        isDisplayVideo: isDisplayVideo ?? this.isDisplayVideo,
        videoUrl: videoUrl ?? this.videoUrl,
        categories: categories ?? this.categories,
        downloadableOption: downloadableOption ?? this.downloadableOption,
        courseLevel: courseLevel ?? this.courseLevel,
        courseType: courseType ?? this.courseType,
        isAllowFeedback: isAllowFeedback ?? this.isAllowFeedback,
        isAllowDiscussion: isAllowDiscussion ?? this.isAllowDiscussion,
        discussion: discussion.present ? discussion.value : this.discussion,
        acceptableScoreForAssignment:
            acceptableScoreForAssignment ?? this.acceptableScoreForAssignment,
        acceptableScoreForAssessment:
            acceptableScoreForAssessment ?? this.acceptableScoreForAssessment,
        estimatedDuration: estimatedDuration ?? this.estimatedDuration,
        numberOfEnrollments: numberOfEnrollments ?? this.numberOfEnrollments,
        totalLectures: totalLectures ?? this.totalLectures,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        viewCount: viewCount ?? this.viewCount,
        rating: rating ?? this.rating,
        courseOrderType: courseOrderType ?? this.courseOrderType,
        lectureOrderType: lectureOrderType ?? this.lectureOrderType,
        courseOrder: courseOrder ?? this.courseOrder,
        lectureOrderByLectureId:
            lectureOrderByLectureId ?? this.lectureOrderByLectureId,
        evaluationMessage: evaluationMessage ?? this.evaluationMessage,
        isXApiCourse: isXApiCourse ?? this.isXApiCourse,
        resourceFileUrl: resourceFileUrl ?? this.resourceFileUrl,
        hasUserTakenCourse: hasUserTakenCourse ?? this.hasUserTakenCourse,
        isUserCanAccessCourse:
            isUserCanAccessCourse ?? this.isUserCanAccessCourse,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CourseEntry copyWithCompanion(CourseTableCompanion data) {
    return CourseEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      objective: data.objective.present ? data.objective.value : this.objective,
      learningOutcome: data.learningOutcome.present
          ? data.learningOutcome.value
          : this.learningOutcome,
      coverImage:
          data.coverImage.present ? data.coverImage.value : this.coverImage,
      urlLink: data.urlLink.present ? data.urlLink.value : this.urlLink,
      isDisplayVideo: data.isDisplayVideo.present
          ? data.isDisplayVideo.value
          : this.isDisplayVideo,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      downloadableOption: data.downloadableOption.present
          ? data.downloadableOption.value
          : this.downloadableOption,
      courseLevel:
          data.courseLevel.present ? data.courseLevel.value : this.courseLevel,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      isAllowFeedback: data.isAllowFeedback.present
          ? data.isAllowFeedback.value
          : this.isAllowFeedback,
      isAllowDiscussion: data.isAllowDiscussion.present
          ? data.isAllowDiscussion.value
          : this.isAllowDiscussion,
      discussion:
          data.discussion.present ? data.discussion.value : this.discussion,
      acceptableScoreForAssignment: data.acceptableScoreForAssignment.present
          ? data.acceptableScoreForAssignment.value
          : this.acceptableScoreForAssignment,
      acceptableScoreForAssessment: data.acceptableScoreForAssessment.present
          ? data.acceptableScoreForAssessment.value
          : this.acceptableScoreForAssessment,
      estimatedDuration: data.estimatedDuration.present
          ? data.estimatedDuration.value
          : this.estimatedDuration,
      numberOfEnrollments: data.numberOfEnrollments.present
          ? data.numberOfEnrollments.value
          : this.numberOfEnrollments,
      totalLectures: data.totalLectures.present
          ? data.totalLectures.value
          : this.totalLectures,
      totalQuizzes: data.totalQuizzes.present
          ? data.totalQuizzes.value
          : this.totalQuizzes,
      viewCount: data.viewCount.present ? data.viewCount.value : this.viewCount,
      rating: data.rating.present ? data.rating.value : this.rating,
      courseOrderType: data.courseOrderType.present
          ? data.courseOrderType.value
          : this.courseOrderType,
      lectureOrderType: data.lectureOrderType.present
          ? data.lectureOrderType.value
          : this.lectureOrderType,
      courseOrder:
          data.courseOrder.present ? data.courseOrder.value : this.courseOrder,
      lectureOrderByLectureId: data.lectureOrderByLectureId.present
          ? data.lectureOrderByLectureId.value
          : this.lectureOrderByLectureId,
      evaluationMessage: data.evaluationMessage.present
          ? data.evaluationMessage.value
          : this.evaluationMessage,
      isXApiCourse: data.isXApiCourse.present
          ? data.isXApiCourse.value
          : this.isXApiCourse,
      resourceFileUrl: data.resourceFileUrl.present
          ? data.resourceFileUrl.value
          : this.resourceFileUrl,
      hasUserTakenCourse: data.hasUserTakenCourse.present
          ? data.hasUserTakenCourse.value
          : this.hasUserTakenCourse,
      isUserCanAccessCourse: data.isUserCanAccessCourse.present
          ? data.isUserCanAccessCourse.value
          : this.isUserCanAccessCourse,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('objective: $objective, ')
          ..write('learningOutcome: $learningOutcome, ')
          ..write('coverImage: $coverImage, ')
          ..write('urlLink: $urlLink, ')
          ..write('isDisplayVideo: $isDisplayVideo, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('categories: $categories, ')
          ..write('downloadableOption: $downloadableOption, ')
          ..write('courseLevel: $courseLevel, ')
          ..write('courseType: $courseType, ')
          ..write('isAllowFeedback: $isAllowFeedback, ')
          ..write('isAllowDiscussion: $isAllowDiscussion, ')
          ..write('discussion: $discussion, ')
          ..write(
              'acceptableScoreForAssignment: $acceptableScoreForAssignment, ')
          ..write(
              'acceptableScoreForAssessment: $acceptableScoreForAssessment, ')
          ..write('estimatedDuration: $estimatedDuration, ')
          ..write('numberOfEnrollments: $numberOfEnrollments, ')
          ..write('totalLectures: $totalLectures, ')
          ..write('totalQuizzes: $totalQuizzes, ')
          ..write('viewCount: $viewCount, ')
          ..write('rating: $rating, ')
          ..write('courseOrderType: $courseOrderType, ')
          ..write('lectureOrderType: $lectureOrderType, ')
          ..write('courseOrder: $courseOrder, ')
          ..write('lectureOrderByLectureId: $lectureOrderByLectureId, ')
          ..write('evaluationMessage: $evaluationMessage, ')
          ..write('isXApiCourse: $isXApiCourse, ')
          ..write('resourceFileUrl: $resourceFileUrl, ')
          ..write('hasUserTakenCourse: $hasUserTakenCourse, ')
          ..write('isUserCanAccessCourse: $isUserCanAccessCourse, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        description,
        objective,
        learningOutcome,
        coverImage,
        urlLink,
        isDisplayVideo,
        videoUrl,
        categories,
        downloadableOption,
        courseLevel,
        courseType,
        isAllowFeedback,
        isAllowDiscussion,
        discussion,
        acceptableScoreForAssignment,
        acceptableScoreForAssessment,
        estimatedDuration,
        numberOfEnrollments,
        totalLectures,
        totalQuizzes,
        viewCount,
        rating,
        courseOrderType,
        lectureOrderType,
        courseOrder,
        lectureOrderByLectureId,
        evaluationMessage,
        isXApiCourse,
        resourceFileUrl,
        hasUserTakenCourse,
        isUserCanAccessCourse,
        createdBy,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.objective == this.objective &&
          other.learningOutcome == this.learningOutcome &&
          other.coverImage == this.coverImage &&
          other.urlLink == this.urlLink &&
          other.isDisplayVideo == this.isDisplayVideo &&
          other.videoUrl == this.videoUrl &&
          other.categories == this.categories &&
          other.downloadableOption == this.downloadableOption &&
          other.courseLevel == this.courseLevel &&
          other.courseType == this.courseType &&
          other.isAllowFeedback == this.isAllowFeedback &&
          other.isAllowDiscussion == this.isAllowDiscussion &&
          other.discussion == this.discussion &&
          other.acceptableScoreForAssignment ==
              this.acceptableScoreForAssignment &&
          other.acceptableScoreForAssessment ==
              this.acceptableScoreForAssessment &&
          other.estimatedDuration == this.estimatedDuration &&
          other.numberOfEnrollments == this.numberOfEnrollments &&
          other.totalLectures == this.totalLectures &&
          other.totalQuizzes == this.totalQuizzes &&
          other.viewCount == this.viewCount &&
          other.rating == this.rating &&
          other.courseOrderType == this.courseOrderType &&
          other.lectureOrderType == this.lectureOrderType &&
          other.courseOrder == this.courseOrder &&
          other.lectureOrderByLectureId == this.lectureOrderByLectureId &&
          other.evaluationMessage == this.evaluationMessage &&
          other.isXApiCourse == this.isXApiCourse &&
          other.resourceFileUrl == this.resourceFileUrl &&
          other.hasUserTakenCourse == this.hasUserTakenCourse &&
          other.isUserCanAccessCourse == this.isUserCanAccessCourse &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CourseTableCompanion extends UpdateCompanion<CourseEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> objective;
  final Value<String> learningOutcome;
  final Value<ImageUrlEntity> coverImage;
  final Value<String> urlLink;
  final Value<bool> isDisplayVideo;
  final Value<String> videoUrl;
  final Value<List<CourseCategoryEntity>> categories;
  final Value<CourseDownloadableOptionEntity> downloadableOption;
  final Value<CourseLevelEntity> courseLevel;
  final Value<CourseTypeEntity> courseType;
  final Value<bool> isAllowFeedback;
  final Value<bool> isAllowDiscussion;
  final Value<CourseDiscussionEntity?> discussion;
  final Value<int> acceptableScoreForAssignment;
  final Value<int> acceptableScoreForAssessment;
  final Value<CourseDurationEntity> estimatedDuration;
  final Value<int> numberOfEnrollments;
  final Value<int> totalLectures;
  final Value<int> totalQuizzes;
  final Value<int> viewCount;
  final Value<double> rating;
  final Value<CourseMaterialOrderTypeEntity> courseOrderType;
  final Value<CourseMaterialOrderTypeEntity> lectureOrderType;
  final Value<List<CourseMaterialEntity>> courseOrder;
  final Value<Map<String, List<String>>> lectureOrderByLectureId;
  final Value<String> evaluationMessage;
  final Value<bool> isXApiCourse;
  final Value<String> resourceFileUrl;
  final Value<bool> hasUserTakenCourse;
  final Value<bool> isUserCanAccessCourse;
  final Value<UserEntity?> createdBy;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CourseTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.objective = const Value.absent(),
    this.learningOutcome = const Value.absent(),
    this.coverImage = const Value.absent(),
    this.urlLink = const Value.absent(),
    this.isDisplayVideo = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.categories = const Value.absent(),
    this.downloadableOption = const Value.absent(),
    this.courseLevel = const Value.absent(),
    this.courseType = const Value.absent(),
    this.isAllowFeedback = const Value.absent(),
    this.isAllowDiscussion = const Value.absent(),
    this.discussion = const Value.absent(),
    this.acceptableScoreForAssignment = const Value.absent(),
    this.acceptableScoreForAssessment = const Value.absent(),
    this.estimatedDuration = const Value.absent(),
    this.numberOfEnrollments = const Value.absent(),
    this.totalLectures = const Value.absent(),
    this.totalQuizzes = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.rating = const Value.absent(),
    this.courseOrderType = const Value.absent(),
    this.lectureOrderType = const Value.absent(),
    this.courseOrder = const Value.absent(),
    this.lectureOrderByLectureId = const Value.absent(),
    this.evaluationMessage = const Value.absent(),
    this.isXApiCourse = const Value.absent(),
    this.resourceFileUrl = const Value.absent(),
    this.hasUserTakenCourse = const Value.absent(),
    this.isUserCanAccessCourse = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    required String objective,
    required String learningOutcome,
    required ImageUrlEntity coverImage,
    required String urlLink,
    required bool isDisplayVideo,
    required String videoUrl,
    required List<CourseCategoryEntity> categories,
    required CourseDownloadableOptionEntity downloadableOption,
    required CourseLevelEntity courseLevel,
    required CourseTypeEntity courseType,
    required bool isAllowFeedback,
    required bool isAllowDiscussion,
    this.discussion = const Value.absent(),
    required int acceptableScoreForAssignment,
    required int acceptableScoreForAssessment,
    required CourseDurationEntity estimatedDuration,
    required int numberOfEnrollments,
    required int totalLectures,
    required int totalQuizzes,
    required int viewCount,
    required double rating,
    required CourseMaterialOrderTypeEntity courseOrderType,
    required CourseMaterialOrderTypeEntity lectureOrderType,
    required List<CourseMaterialEntity> courseOrder,
    required Map<String, List<String>> lectureOrderByLectureId,
    required String evaluationMessage,
    required bool isXApiCourse,
    required String resourceFileUrl,
    required bool hasUserTakenCourse,
    required bool isUserCanAccessCourse,
    this.createdBy = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        objective = Value(objective),
        learningOutcome = Value(learningOutcome),
        coverImage = Value(coverImage),
        urlLink = Value(urlLink),
        isDisplayVideo = Value(isDisplayVideo),
        videoUrl = Value(videoUrl),
        categories = Value(categories),
        downloadableOption = Value(downloadableOption),
        courseLevel = Value(courseLevel),
        courseType = Value(courseType),
        isAllowFeedback = Value(isAllowFeedback),
        isAllowDiscussion = Value(isAllowDiscussion),
        acceptableScoreForAssignment = Value(acceptableScoreForAssignment),
        acceptableScoreForAssessment = Value(acceptableScoreForAssessment),
        estimatedDuration = Value(estimatedDuration),
        numberOfEnrollments = Value(numberOfEnrollments),
        totalLectures = Value(totalLectures),
        totalQuizzes = Value(totalQuizzes),
        viewCount = Value(viewCount),
        rating = Value(rating),
        courseOrderType = Value(courseOrderType),
        lectureOrderType = Value(lectureOrderType),
        courseOrder = Value(courseOrder),
        lectureOrderByLectureId = Value(lectureOrderByLectureId),
        evaluationMessage = Value(evaluationMessage),
        isXApiCourse = Value(isXApiCourse),
        resourceFileUrl = Value(resourceFileUrl),
        hasUserTakenCourse = Value(hasUserTakenCourse),
        isUserCanAccessCourse = Value(isUserCanAccessCourse),
        createdAt = Value(createdAt);
  static Insertable<CourseEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? objective,
    Expression<String>? learningOutcome,
    Expression<String>? coverImage,
    Expression<String>? urlLink,
    Expression<bool>? isDisplayVideo,
    Expression<String>? videoUrl,
    Expression<String>? categories,
    Expression<String>? downloadableOption,
    Expression<String>? courseLevel,
    Expression<String>? courseType,
    Expression<bool>? isAllowFeedback,
    Expression<bool>? isAllowDiscussion,
    Expression<String>? discussion,
    Expression<int>? acceptableScoreForAssignment,
    Expression<int>? acceptableScoreForAssessment,
    Expression<String>? estimatedDuration,
    Expression<int>? numberOfEnrollments,
    Expression<int>? totalLectures,
    Expression<int>? totalQuizzes,
    Expression<int>? viewCount,
    Expression<double>? rating,
    Expression<String>? courseOrderType,
    Expression<String>? lectureOrderType,
    Expression<String>? courseOrder,
    Expression<String>? lectureOrderByLectureId,
    Expression<String>? evaluationMessage,
    Expression<bool>? isXApiCourse,
    Expression<String>? resourceFileUrl,
    Expression<bool>? hasUserTakenCourse,
    Expression<bool>? isUserCanAccessCourse,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (objective != null) 'objective': objective,
      if (learningOutcome != null) 'learning_outcome': learningOutcome,
      if (coverImage != null) 'cover_image': coverImage,
      if (urlLink != null) 'url_link': urlLink,
      if (isDisplayVideo != null) 'is_display_video': isDisplayVideo,
      if (videoUrl != null) 'video_url': videoUrl,
      if (categories != null) 'categories': categories,
      if (downloadableOption != null) 'downloadable_option': downloadableOption,
      if (courseLevel != null) 'course_level': courseLevel,
      if (courseType != null) 'course_type': courseType,
      if (isAllowFeedback != null) 'is_allow_feedback': isAllowFeedback,
      if (isAllowDiscussion != null) 'is_allow_discussion': isAllowDiscussion,
      if (discussion != null) 'discussion': discussion,
      if (acceptableScoreForAssignment != null)
        'acceptable_score_for_assignment': acceptableScoreForAssignment,
      if (acceptableScoreForAssessment != null)
        'acceptable_score_for_assessment': acceptableScoreForAssessment,
      if (estimatedDuration != null) 'estimated_duration': estimatedDuration,
      if (numberOfEnrollments != null)
        'number_of_enrollments': numberOfEnrollments,
      if (totalLectures != null) 'total_lectures': totalLectures,
      if (totalQuizzes != null) 'total_quizzes': totalQuizzes,
      if (viewCount != null) 'view_count': viewCount,
      if (rating != null) 'rating': rating,
      if (courseOrderType != null) 'course_order_type': courseOrderType,
      if (lectureOrderType != null) 'lecture_order_type': lectureOrderType,
      if (courseOrder != null) 'course_order': courseOrder,
      if (lectureOrderByLectureId != null)
        'lecture_order_by_lecture_id': lectureOrderByLectureId,
      if (evaluationMessage != null) 'evaluation_message': evaluationMessage,
      if (isXApiCourse != null) 'is_x_api_course': isXApiCourse,
      if (resourceFileUrl != null) 'resource_file_url': resourceFileUrl,
      if (hasUserTakenCourse != null)
        'has_user_taken_course': hasUserTakenCourse,
      if (isUserCanAccessCourse != null)
        'is_user_can_access_course': isUserCanAccessCourse,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? objective,
      Value<String>? learningOutcome,
      Value<ImageUrlEntity>? coverImage,
      Value<String>? urlLink,
      Value<bool>? isDisplayVideo,
      Value<String>? videoUrl,
      Value<List<CourseCategoryEntity>>? categories,
      Value<CourseDownloadableOptionEntity>? downloadableOption,
      Value<CourseLevelEntity>? courseLevel,
      Value<CourseTypeEntity>? courseType,
      Value<bool>? isAllowFeedback,
      Value<bool>? isAllowDiscussion,
      Value<CourseDiscussionEntity?>? discussion,
      Value<int>? acceptableScoreForAssignment,
      Value<int>? acceptableScoreForAssessment,
      Value<CourseDurationEntity>? estimatedDuration,
      Value<int>? numberOfEnrollments,
      Value<int>? totalLectures,
      Value<int>? totalQuizzes,
      Value<int>? viewCount,
      Value<double>? rating,
      Value<CourseMaterialOrderTypeEntity>? courseOrderType,
      Value<CourseMaterialOrderTypeEntity>? lectureOrderType,
      Value<List<CourseMaterialEntity>>? courseOrder,
      Value<Map<String, List<String>>>? lectureOrderByLectureId,
      Value<String>? evaluationMessage,
      Value<bool>? isXApiCourse,
      Value<String>? resourceFileUrl,
      Value<bool>? hasUserTakenCourse,
      Value<bool>? isUserCanAccessCourse,
      Value<UserEntity?>? createdBy,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CourseTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      objective: objective ?? this.objective,
      learningOutcome: learningOutcome ?? this.learningOutcome,
      coverImage: coverImage ?? this.coverImage,
      urlLink: urlLink ?? this.urlLink,
      isDisplayVideo: isDisplayVideo ?? this.isDisplayVideo,
      videoUrl: videoUrl ?? this.videoUrl,
      categories: categories ?? this.categories,
      downloadableOption: downloadableOption ?? this.downloadableOption,
      courseLevel: courseLevel ?? this.courseLevel,
      courseType: courseType ?? this.courseType,
      isAllowFeedback: isAllowFeedback ?? this.isAllowFeedback,
      isAllowDiscussion: isAllowDiscussion ?? this.isAllowDiscussion,
      discussion: discussion ?? this.discussion,
      acceptableScoreForAssignment:
          acceptableScoreForAssignment ?? this.acceptableScoreForAssignment,
      acceptableScoreForAssessment:
          acceptableScoreForAssessment ?? this.acceptableScoreForAssessment,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      numberOfEnrollments: numberOfEnrollments ?? this.numberOfEnrollments,
      totalLectures: totalLectures ?? this.totalLectures,
      totalQuizzes: totalQuizzes ?? this.totalQuizzes,
      viewCount: viewCount ?? this.viewCount,
      rating: rating ?? this.rating,
      courseOrderType: courseOrderType ?? this.courseOrderType,
      lectureOrderType: lectureOrderType ?? this.lectureOrderType,
      courseOrder: courseOrder ?? this.courseOrder,
      lectureOrderByLectureId:
          lectureOrderByLectureId ?? this.lectureOrderByLectureId,
      evaluationMessage: evaluationMessage ?? this.evaluationMessage,
      isXApiCourse: isXApiCourse ?? this.isXApiCourse,
      resourceFileUrl: resourceFileUrl ?? this.resourceFileUrl,
      hasUserTakenCourse: hasUserTakenCourse ?? this.hasUserTakenCourse,
      isUserCanAccessCourse:
          isUserCanAccessCourse ?? this.isUserCanAccessCourse,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String>(objective.value);
    }
    if (learningOutcome.present) {
      map['learning_outcome'] = Variable<String>(learningOutcome.value);
    }
    if (coverImage.present) {
      map['cover_image'] = Variable<String>(
          $CourseTableTable.$convertercoverImage.toSql(coverImage.value));
    }
    if (urlLink.present) {
      map['url_link'] = Variable<String>(urlLink.value);
    }
    if (isDisplayVideo.present) {
      map['is_display_video'] = Variable<bool>(isDisplayVideo.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
          $CourseTableTable.$convertercategories.toSql(categories.value));
    }
    if (downloadableOption.present) {
      map['downloadable_option'] = Variable<String>($CourseTableTable
          .$converterdownloadableOption
          .toSql(downloadableOption.value));
    }
    if (courseLevel.present) {
      map['course_level'] = Variable<String>(
          $CourseTableTable.$convertercourseLevel.toSql(courseLevel.value));
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(
          $CourseTableTable.$convertercourseType.toSql(courseType.value));
    }
    if (isAllowFeedback.present) {
      map['is_allow_feedback'] = Variable<bool>(isAllowFeedback.value);
    }
    if (isAllowDiscussion.present) {
      map['is_allow_discussion'] = Variable<bool>(isAllowDiscussion.value);
    }
    if (discussion.present) {
      map['discussion'] = Variable<String>(
          $CourseTableTable.$converterdiscussionn.toSql(discussion.value));
    }
    if (acceptableScoreForAssignment.present) {
      map['acceptable_score_for_assignment'] =
          Variable<int>(acceptableScoreForAssignment.value);
    }
    if (acceptableScoreForAssessment.present) {
      map['acceptable_score_for_assessment'] =
          Variable<int>(acceptableScoreForAssessment.value);
    }
    if (estimatedDuration.present) {
      map['estimated_duration'] = Variable<String>($CourseTableTable
          .$converterestimatedDuration
          .toSql(estimatedDuration.value));
    }
    if (numberOfEnrollments.present) {
      map['number_of_enrollments'] = Variable<int>(numberOfEnrollments.value);
    }
    if (totalLectures.present) {
      map['total_lectures'] = Variable<int>(totalLectures.value);
    }
    if (totalQuizzes.present) {
      map['total_quizzes'] = Variable<int>(totalQuizzes.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (courseOrderType.present) {
      map['course_order_type'] = Variable<String>($CourseTableTable
          .$convertercourseOrderType
          .toSql(courseOrderType.value));
    }
    if (lectureOrderType.present) {
      map['lecture_order_type'] = Variable<String>($CourseTableTable
          .$converterlectureOrderType
          .toSql(lectureOrderType.value));
    }
    if (courseOrder.present) {
      map['course_order'] = Variable<String>(
          $CourseTableTable.$convertercourseOrder.toSql(courseOrder.value));
    }
    if (lectureOrderByLectureId.present) {
      map['lecture_order_by_lecture_id'] = Variable<String>($CourseTableTable
          .$converterlectureOrderByLectureId
          .toSql(lectureOrderByLectureId.value));
    }
    if (evaluationMessage.present) {
      map['evaluation_message'] = Variable<String>(evaluationMessage.value);
    }
    if (isXApiCourse.present) {
      map['is_x_api_course'] = Variable<bool>(isXApiCourse.value);
    }
    if (resourceFileUrl.present) {
      map['resource_file_url'] = Variable<String>(resourceFileUrl.value);
    }
    if (hasUserTakenCourse.present) {
      map['has_user_taken_course'] = Variable<bool>(hasUserTakenCourse.value);
    }
    if (isUserCanAccessCourse.present) {
      map['is_user_can_access_course'] =
          Variable<bool>(isUserCanAccessCourse.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(
          $CourseTableTable.$convertercreatedByn.toSql(createdBy.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('objective: $objective, ')
          ..write('learningOutcome: $learningOutcome, ')
          ..write('coverImage: $coverImage, ')
          ..write('urlLink: $urlLink, ')
          ..write('isDisplayVideo: $isDisplayVideo, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('categories: $categories, ')
          ..write('downloadableOption: $downloadableOption, ')
          ..write('courseLevel: $courseLevel, ')
          ..write('courseType: $courseType, ')
          ..write('isAllowFeedback: $isAllowFeedback, ')
          ..write('isAllowDiscussion: $isAllowDiscussion, ')
          ..write('discussion: $discussion, ')
          ..write(
              'acceptableScoreForAssignment: $acceptableScoreForAssignment, ')
          ..write(
              'acceptableScoreForAssessment: $acceptableScoreForAssessment, ')
          ..write('estimatedDuration: $estimatedDuration, ')
          ..write('numberOfEnrollments: $numberOfEnrollments, ')
          ..write('totalLectures: $totalLectures, ')
          ..write('totalQuizzes: $totalQuizzes, ')
          ..write('viewCount: $viewCount, ')
          ..write('rating: $rating, ')
          ..write('courseOrderType: $courseOrderType, ')
          ..write('lectureOrderType: $lectureOrderType, ')
          ..write('courseOrder: $courseOrder, ')
          ..write('lectureOrderByLectureId: $lectureOrderByLectureId, ')
          ..write('evaluationMessage: $evaluationMessage, ')
          ..write('isXApiCourse: $isXApiCourse, ')
          ..write('resourceFileUrl: $resourceFileUrl, ')
          ..write('hasUserTakenCourse: $hasUserTakenCourse, ')
          ..write('isUserCanAccessCourse: $isUserCanAccessCourse, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseLearnerTableTable extends CourseLearnerTable
    with TableInfo<$CourseLearnerTableTable, CourseLearnerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseLearnerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<CourseLearnerStatusEntity, String>
      status = GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CourseLearnerStatusEntity>(
              $CourseLearnerTableTable.$converterstatus);
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
      'percentage', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notifyCountMeta =
      const VerificationMeta('notifyCount');
  @override
  late final GeneratedColumn<int> notifyCount = GeneratedColumn<int>(
      'notify_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _completionStatusByMaterialKeyMeta =
      const VerificationMeta('completionStatusByMaterialKey');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, bool>, String>
      completionStatusByMaterialKey = GeneratedColumn<String>(
              'completion_status_by_material_key', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, bool>>(
              $CourseLearnerTableTable.$convertercompletionStatusByMaterialKey);
  static const VerificationMeta _isReadyToEvaluateMeta =
      const VerificationMeta('isReadyToEvaluate');
  @override
  late final GeneratedColumn<bool> isReadyToEvaluate = GeneratedColumn<bool>(
      'is_ready_to_evaluate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_ready_to_evaluate" IN (0, 1))'));
  static const VerificationMeta _isReadyToGenerateCertificateMeta =
      const VerificationMeta('isReadyToGenerateCertificate');
  @override
  late final GeneratedColumn<bool> isReadyToGenerateCertificate =
      GeneratedColumn<bool>(
          'is_ready_to_generate_certificate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_ready_to_generate_certificate" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        userId,
        status,
        percentage,
        notifyCount,
        isActive,
        completionStatusByMaterialKey,
        isReadyToEvaluate,
        isReadyToGenerateCertificate,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_learners';
  @override
  VerificationContext validateIntegrity(Insertable<CourseLearnerEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    }
    if (data.containsKey('notify_count')) {
      context.handle(
          _notifyCountMeta,
          notifyCount.isAcceptableOrUnknown(
              data['notify_count']!, _notifyCountMeta));
    } else if (isInserting) {
      context.missing(_notifyCountMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    context.handle(
        _completionStatusByMaterialKeyMeta, const VerificationResult.success());
    if (data.containsKey('is_ready_to_evaluate')) {
      context.handle(
          _isReadyToEvaluateMeta,
          isReadyToEvaluate.isAcceptableOrUnknown(
              data['is_ready_to_evaluate']!, _isReadyToEvaluateMeta));
    } else if (isInserting) {
      context.missing(_isReadyToEvaluateMeta);
    }
    if (data.containsKey('is_ready_to_generate_certificate')) {
      context.handle(
          _isReadyToGenerateCertificateMeta,
          isReadyToGenerateCertificate.isAcceptableOrUnknown(
              data['is_ready_to_generate_certificate']!,
              _isReadyToGenerateCertificateMeta));
    } else if (isInserting) {
      context.missing(_isReadyToGenerateCertificateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseLearnerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseLearnerEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      status: $CourseLearnerTableTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}percentage']),
      notifyCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notify_count'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      completionStatusByMaterialKey: $CourseLearnerTableTable
          .$convertercompletionStatusByMaterialKey
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}completion_status_by_material_key'])!),
      isReadyToEvaluate: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_ready_to_evaluate'])!,
      isReadyToGenerateCertificate: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_ready_to_generate_certificate'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CourseLearnerTableTable createAlias(String alias) {
    return $CourseLearnerTableTable(attachedDatabase, alias);
  }

  static TypeConverter<CourseLearnerStatusEntity, String> $converterstatus =
      const CourseLearnerStatusConverter();
  static TypeConverter<Map<String, bool>, String>
      $convertercompletionStatusByMaterialKey =
      const LearnerCompletionStatusMapConverter();
}

class CourseLearnerEntry extends DataClass
    implements Insertable<CourseLearnerEntry> {
  final String id;
  final String courseId;
  final String userId;
  final CourseLearnerStatusEntity status;
  final int? percentage;
  final int notifyCount;
  final bool isActive;
  final Map<String, bool> completionStatusByMaterialKey;
  final bool isReadyToEvaluate;
  final bool isReadyToGenerateCertificate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const CourseLearnerEntry(
      {required this.id,
      required this.courseId,
      required this.userId,
      required this.status,
      this.percentage,
      required this.notifyCount,
      required this.isActive,
      required this.completionStatusByMaterialKey,
      required this.isReadyToEvaluate,
      required this.isReadyToGenerateCertificate,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['course_id'] = Variable<String>(courseId);
    map['user_id'] = Variable<String>(userId);
    {
      map['status'] = Variable<String>(
          $CourseLearnerTableTable.$converterstatus.toSql(status));
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<int>(percentage);
    }
    map['notify_count'] = Variable<int>(notifyCount);
    map['is_active'] = Variable<bool>(isActive);
    {
      map['completion_status_by_material_key'] = Variable<String>(
          $CourseLearnerTableTable.$convertercompletionStatusByMaterialKey
              .toSql(completionStatusByMaterialKey));
    }
    map['is_ready_to_evaluate'] = Variable<bool>(isReadyToEvaluate);
    map['is_ready_to_generate_certificate'] =
        Variable<bool>(isReadyToGenerateCertificate);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CourseLearnerTableCompanion toCompanion(bool nullToAbsent) {
    return CourseLearnerTableCompanion(
      id: Value(id),
      courseId: Value(courseId),
      userId: Value(userId),
      status: Value(status),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      notifyCount: Value(notifyCount),
      isActive: Value(isActive),
      completionStatusByMaterialKey: Value(completionStatusByMaterialKey),
      isReadyToEvaluate: Value(isReadyToEvaluate),
      isReadyToGenerateCertificate: Value(isReadyToGenerateCertificate),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CourseLearnerEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseLearnerEntry(
      id: serializer.fromJson<String>(json['id']),
      courseId: serializer.fromJson<String>(json['courseId']),
      userId: serializer.fromJson<String>(json['userId']),
      status: serializer.fromJson<CourseLearnerStatusEntity>(json['status']),
      percentage: serializer.fromJson<int?>(json['percentage']),
      notifyCount: serializer.fromJson<int>(json['notifyCount']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      completionStatusByMaterialKey: serializer
          .fromJson<Map<String, bool>>(json['completionStatusByMaterialKey']),
      isReadyToEvaluate: serializer.fromJson<bool>(json['isReadyToEvaluate']),
      isReadyToGenerateCertificate:
          serializer.fromJson<bool>(json['isReadyToGenerateCertificate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'courseId': serializer.toJson<String>(courseId),
      'userId': serializer.toJson<String>(userId),
      'status': serializer.toJson<CourseLearnerStatusEntity>(status),
      'percentage': serializer.toJson<int?>(percentage),
      'notifyCount': serializer.toJson<int>(notifyCount),
      'isActive': serializer.toJson<bool>(isActive),
      'completionStatusByMaterialKey':
          serializer.toJson<Map<String, bool>>(completionStatusByMaterialKey),
      'isReadyToEvaluate': serializer.toJson<bool>(isReadyToEvaluate),
      'isReadyToGenerateCertificate':
          serializer.toJson<bool>(isReadyToGenerateCertificate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CourseLearnerEntry copyWith(
          {String? id,
          String? courseId,
          String? userId,
          CourseLearnerStatusEntity? status,
          Value<int?> percentage = const Value.absent(),
          int? notifyCount,
          bool? isActive,
          Map<String, bool>? completionStatusByMaterialKey,
          bool? isReadyToEvaluate,
          bool? isReadyToGenerateCertificate,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CourseLearnerEntry(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        percentage: percentage.present ? percentage.value : this.percentage,
        notifyCount: notifyCount ?? this.notifyCount,
        isActive: isActive ?? this.isActive,
        completionStatusByMaterialKey:
            completionStatusByMaterialKey ?? this.completionStatusByMaterialKey,
        isReadyToEvaluate: isReadyToEvaluate ?? this.isReadyToEvaluate,
        isReadyToGenerateCertificate:
            isReadyToGenerateCertificate ?? this.isReadyToGenerateCertificate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CourseLearnerEntry copyWithCompanion(CourseLearnerTableCompanion data) {
    return CourseLearnerEntry(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      userId: data.userId.present ? data.userId.value : this.userId,
      status: data.status.present ? data.status.value : this.status,
      percentage:
          data.percentage.present ? data.percentage.value : this.percentage,
      notifyCount:
          data.notifyCount.present ? data.notifyCount.value : this.notifyCount,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      completionStatusByMaterialKey: data.completionStatusByMaterialKey.present
          ? data.completionStatusByMaterialKey.value
          : this.completionStatusByMaterialKey,
      isReadyToEvaluate: data.isReadyToEvaluate.present
          ? data.isReadyToEvaluate.value
          : this.isReadyToEvaluate,
      isReadyToGenerateCertificate: data.isReadyToGenerateCertificate.present
          ? data.isReadyToGenerateCertificate.value
          : this.isReadyToGenerateCertificate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseLearnerEntry(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('percentage: $percentage, ')
          ..write('notifyCount: $notifyCount, ')
          ..write('isActive: $isActive, ')
          ..write(
              'completionStatusByMaterialKey: $completionStatusByMaterialKey, ')
          ..write('isReadyToEvaluate: $isReadyToEvaluate, ')
          ..write(
              'isReadyToGenerateCertificate: $isReadyToGenerateCertificate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      courseId,
      userId,
      status,
      percentage,
      notifyCount,
      isActive,
      completionStatusByMaterialKey,
      isReadyToEvaluate,
      isReadyToGenerateCertificate,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseLearnerEntry &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.userId == this.userId &&
          other.status == this.status &&
          other.percentage == this.percentage &&
          other.notifyCount == this.notifyCount &&
          other.isActive == this.isActive &&
          other.completionStatusByMaterialKey ==
              this.completionStatusByMaterialKey &&
          other.isReadyToEvaluate == this.isReadyToEvaluate &&
          other.isReadyToGenerateCertificate ==
              this.isReadyToGenerateCertificate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CourseLearnerTableCompanion extends UpdateCompanion<CourseLearnerEntry> {
  final Value<String> id;
  final Value<String> courseId;
  final Value<String> userId;
  final Value<CourseLearnerStatusEntity> status;
  final Value<int?> percentage;
  final Value<int> notifyCount;
  final Value<bool> isActive;
  final Value<Map<String, bool>> completionStatusByMaterialKey;
  final Value<bool> isReadyToEvaluate;
  final Value<bool> isReadyToGenerateCertificate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CourseLearnerTableCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.userId = const Value.absent(),
    this.status = const Value.absent(),
    this.percentage = const Value.absent(),
    this.notifyCount = const Value.absent(),
    this.isActive = const Value.absent(),
    this.completionStatusByMaterialKey = const Value.absent(),
    this.isReadyToEvaluate = const Value.absent(),
    this.isReadyToGenerateCertificate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseLearnerTableCompanion.insert({
    required String id,
    required String courseId,
    required String userId,
    required CourseLearnerStatusEntity status,
    this.percentage = const Value.absent(),
    required int notifyCount,
    required bool isActive,
    required Map<String, bool> completionStatusByMaterialKey,
    required bool isReadyToEvaluate,
    required bool isReadyToGenerateCertificate,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        courseId = Value(courseId),
        userId = Value(userId),
        status = Value(status),
        notifyCount = Value(notifyCount),
        isActive = Value(isActive),
        completionStatusByMaterialKey = Value(completionStatusByMaterialKey),
        isReadyToEvaluate = Value(isReadyToEvaluate),
        isReadyToGenerateCertificate = Value(isReadyToGenerateCertificate),
        createdAt = Value(createdAt);
  static Insertable<CourseLearnerEntry> custom({
    Expression<String>? id,
    Expression<String>? courseId,
    Expression<String>? userId,
    Expression<String>? status,
    Expression<int>? percentage,
    Expression<int>? notifyCount,
    Expression<bool>? isActive,
    Expression<String>? completionStatusByMaterialKey,
    Expression<bool>? isReadyToEvaluate,
    Expression<bool>? isReadyToGenerateCertificate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (userId != null) 'user_id': userId,
      if (status != null) 'status': status,
      if (percentage != null) 'percentage': percentage,
      if (notifyCount != null) 'notify_count': notifyCount,
      if (isActive != null) 'is_active': isActive,
      if (completionStatusByMaterialKey != null)
        'completion_status_by_material_key': completionStatusByMaterialKey,
      if (isReadyToEvaluate != null) 'is_ready_to_evaluate': isReadyToEvaluate,
      if (isReadyToGenerateCertificate != null)
        'is_ready_to_generate_certificate': isReadyToGenerateCertificate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseLearnerTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? courseId,
      Value<String>? userId,
      Value<CourseLearnerStatusEntity>? status,
      Value<int?>? percentage,
      Value<int>? notifyCount,
      Value<bool>? isActive,
      Value<Map<String, bool>>? completionStatusByMaterialKey,
      Value<bool>? isReadyToEvaluate,
      Value<bool>? isReadyToGenerateCertificate,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CourseLearnerTableCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      percentage: percentage ?? this.percentage,
      notifyCount: notifyCount ?? this.notifyCount,
      isActive: isActive ?? this.isActive,
      completionStatusByMaterialKey:
          completionStatusByMaterialKey ?? this.completionStatusByMaterialKey,
      isReadyToEvaluate: isReadyToEvaluate ?? this.isReadyToEvaluate,
      isReadyToGenerateCertificate:
          isReadyToGenerateCertificate ?? this.isReadyToGenerateCertificate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $CourseLearnerTableTable.$converterstatus.toSql(status.value));
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    if (notifyCount.present) {
      map['notify_count'] = Variable<int>(notifyCount.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (completionStatusByMaterialKey.present) {
      map['completion_status_by_material_key'] = Variable<String>(
          $CourseLearnerTableTable.$convertercompletionStatusByMaterialKey
              .toSql(completionStatusByMaterialKey.value));
    }
    if (isReadyToEvaluate.present) {
      map['is_ready_to_evaluate'] = Variable<bool>(isReadyToEvaluate.value);
    }
    if (isReadyToGenerateCertificate.present) {
      map['is_ready_to_generate_certificate'] =
          Variable<bool>(isReadyToGenerateCertificate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseLearnerTableCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('percentage: $percentage, ')
          ..write('notifyCount: $notifyCount, ')
          ..write('isActive: $isActive, ')
          ..write(
              'completionStatusByMaterialKey: $completionStatusByMaterialKey, ')
          ..write('isReadyToEvaluate: $isReadyToEvaluate, ')
          ..write(
              'isReadyToGenerateCertificate: $isReadyToGenerateCertificate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineCourseTableTable extends OfflineCourseTable
    with TableInfo<$OfflineCourseTableTable, OfflineCourseEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineCourseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_courses';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineCourseEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  OfflineCourseEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineCourseEntry(
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $OfflineCourseTableTable createAlias(String alias) {
    return $OfflineCourseTableTable(attachedDatabase, alias);
  }
}

class OfflineCourseEntry extends DataClass
    implements Insertable<OfflineCourseEntry> {
  final String courseId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const OfflineCourseEntry(
      {required this.courseId,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<String>(courseId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  OfflineCourseTableCompanion toCompanion(bool nullToAbsent) {
    return OfflineCourseTableCompanion(
      courseId: Value(courseId),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory OfflineCourseEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineCourseEntry(
      courseId: serializer.fromJson<String>(json['courseId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseId': serializer.toJson<String>(courseId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  OfflineCourseEntry copyWith(
          {String? courseId,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      OfflineCourseEntry(
        courseId: courseId ?? this.courseId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  OfflineCourseEntry copyWithCompanion(OfflineCourseTableCompanion data) {
    return OfflineCourseEntry(
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineCourseEntry(')
          ..write('courseId: $courseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineCourseEntry &&
          other.courseId == this.courseId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class OfflineCourseTableCompanion extends UpdateCompanion<OfflineCourseEntry> {
  final Value<String> courseId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const OfflineCourseTableCompanion({
    this.courseId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineCourseTableCompanion.insert({
    required String courseId,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : courseId = Value(courseId),
        createdAt = Value(createdAt);
  static Insertable<OfflineCourseEntry> custom({
    Expression<String>? courseId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineCourseTableCompanion copyWith(
      {Value<String>? courseId,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return OfflineCourseTableCompanion(
      courseId: courseId ?? this.courseId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineCourseTableCompanion(')
          ..write('courseId: $courseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineCourseMediaTableTable extends OfflineCourseMediaTable
    with TableInfo<$OfflineCourseMediaTableTable, OfflineCourseMediaEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineCourseMediaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, courseId, url, title, thumbnail, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_course_media';
  @override
  VerificationContext validateIntegrity(
      Insertable<OfflineCourseMediaEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {courseId, url},
      ];
  @override
  OfflineCourseMediaEntry map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineCourseMediaEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $OfflineCourseMediaTableTable createAlias(String alias) {
    return $OfflineCourseMediaTableTable(attachedDatabase, alias);
  }
}

class OfflineCourseMediaEntry extends DataClass
    implements Insertable<OfflineCourseMediaEntry> {
  final int id;
  final String courseId;
  final String url;
  final String title;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const OfflineCourseMediaEntry(
      {required this.id,
      required this.courseId,
      required this.url,
      required this.title,
      this.thumbnail,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<String>(courseId);
    map['url'] = Variable<String>(url);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  OfflineCourseMediaTableCompanion toCompanion(bool nullToAbsent) {
    return OfflineCourseMediaTableCompanion(
      id: Value(id),
      courseId: Value(courseId),
      url: Value(url),
      title: Value(title),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory OfflineCourseMediaEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineCourseMediaEntry(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<String>(json['courseId']),
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<String>(courseId),
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  OfflineCourseMediaEntry copyWith(
          {int? id,
          String? courseId,
          String? url,
          String? title,
          Value<String?> thumbnail = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      OfflineCourseMediaEntry(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        url: url ?? this.url,
        title: title ?? this.title,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  OfflineCourseMediaEntry copyWithCompanion(
      OfflineCourseMediaTableCompanion data) {
    return OfflineCourseMediaEntry(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      url: data.url.present ? data.url.value : this.url,
      title: data.title.present ? data.title.value : this.title,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineCourseMediaEntry(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, courseId, url, title, thumbnail, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineCourseMediaEntry &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.url == this.url &&
          other.title == this.title &&
          other.thumbnail == this.thumbnail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class OfflineCourseMediaTableCompanion
    extends UpdateCompanion<OfflineCourseMediaEntry> {
  final Value<int> id;
  final Value<String> courseId;
  final Value<String> url;
  final Value<String> title;
  final Value<String?> thumbnail;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  const OfflineCourseMediaTableCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  OfflineCourseMediaTableCompanion.insert({
    this.id = const Value.absent(),
    required String courseId,
    required String url,
    required String title,
    this.thumbnail = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : courseId = Value(courseId),
        url = Value(url),
        title = Value(title),
        createdAt = Value(createdAt);
  static Insertable<OfflineCourseMediaEntry> custom({
    Expression<int>? id,
    Expression<String>? courseId,
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? thumbnail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  OfflineCourseMediaTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? courseId,
      Value<String>? url,
      Value<String>? title,
      Value<String?>? thumbnail,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return OfflineCourseMediaTableCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      url: url ?? this.url,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineCourseMediaTableCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $CourseDownloadStatusTableTable extends CourseDownloadStatusTable
    with TableInfo<$CourseDownloadStatusTableTable, CourseDownloadStatusEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseDownloadStatusTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _downloadTaskIdMeta =
      const VerificationMeta('downloadTaskId');
  @override
  late final GeneratedColumn<String> downloadTaskId = GeneratedColumn<String>(
      'download_task_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _downloadRecordJsonMeta =
      const VerificationMeta('downloadRecordJson');
  @override
  late final GeneratedColumn<String> downloadRecordJson =
      GeneratedColumn<String>('download_record_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isHandledMeta =
      const VerificationMeta('isHandled');
  @override
  late final GeneratedColumn<bool> isHandled = GeneratedColumn<bool>(
      'is_handled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_handled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        courseId,
        downloadTaskId,
        downloadRecordJson,
        isHandled,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_download_status';
  @override
  VerificationContext validateIntegrity(
      Insertable<CourseDownloadStatusEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('download_task_id')) {
      context.handle(
          _downloadTaskIdMeta,
          downloadTaskId.isAcceptableOrUnknown(
              data['download_task_id']!, _downloadTaskIdMeta));
    } else if (isInserting) {
      context.missing(_downloadTaskIdMeta);
    }
    if (data.containsKey('download_record_json')) {
      context.handle(
          _downloadRecordJsonMeta,
          downloadRecordJson.isAcceptableOrUnknown(
              data['download_record_json']!, _downloadRecordJsonMeta));
    } else if (isInserting) {
      context.missing(_downloadRecordJsonMeta);
    }
    if (data.containsKey('is_handled')) {
      context.handle(_isHandledMeta,
          isHandled.isAcceptableOrUnknown(data['is_handled']!, _isHandledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  CourseDownloadStatusEntry map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseDownloadStatusEntry(
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      downloadTaskId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}download_task_id'])!,
      downloadRecordJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}download_record_json'])!,
      isHandled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_handled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CourseDownloadStatusTableTable createAlias(String alias) {
    return $CourseDownloadStatusTableTable(attachedDatabase, alias);
  }
}

class CourseDownloadStatusEntry extends DataClass
    implements Insertable<CourseDownloadStatusEntry> {
  final String courseId;
  final String downloadTaskId;
  final String downloadRecordJson;
  final bool isHandled;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const CourseDownloadStatusEntry(
      {required this.courseId,
      required this.downloadTaskId,
      required this.downloadRecordJson,
      required this.isHandled,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<String>(courseId);
    map['download_task_id'] = Variable<String>(downloadTaskId);
    map['download_record_json'] = Variable<String>(downloadRecordJson);
    map['is_handled'] = Variable<bool>(isHandled);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CourseDownloadStatusTableCompanion toCompanion(bool nullToAbsent) {
    return CourseDownloadStatusTableCompanion(
      courseId: Value(courseId),
      downloadTaskId: Value(downloadTaskId),
      downloadRecordJson: Value(downloadRecordJson),
      isHandled: Value(isHandled),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CourseDownloadStatusEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseDownloadStatusEntry(
      courseId: serializer.fromJson<String>(json['courseId']),
      downloadTaskId: serializer.fromJson<String>(json['downloadTaskId']),
      downloadRecordJson:
          serializer.fromJson<String>(json['downloadRecordJson']),
      isHandled: serializer.fromJson<bool>(json['isHandled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseId': serializer.toJson<String>(courseId),
      'downloadTaskId': serializer.toJson<String>(downloadTaskId),
      'downloadRecordJson': serializer.toJson<String>(downloadRecordJson),
      'isHandled': serializer.toJson<bool>(isHandled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CourseDownloadStatusEntry copyWith(
          {String? courseId,
          String? downloadTaskId,
          String? downloadRecordJson,
          bool? isHandled,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CourseDownloadStatusEntry(
        courseId: courseId ?? this.courseId,
        downloadTaskId: downloadTaskId ?? this.downloadTaskId,
        downloadRecordJson: downloadRecordJson ?? this.downloadRecordJson,
        isHandled: isHandled ?? this.isHandled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CourseDownloadStatusEntry copyWithCompanion(
      CourseDownloadStatusTableCompanion data) {
    return CourseDownloadStatusEntry(
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      downloadTaskId: data.downloadTaskId.present
          ? data.downloadTaskId.value
          : this.downloadTaskId,
      downloadRecordJson: data.downloadRecordJson.present
          ? data.downloadRecordJson.value
          : this.downloadRecordJson,
      isHandled: data.isHandled.present ? data.isHandled.value : this.isHandled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseDownloadStatusEntry(')
          ..write('courseId: $courseId, ')
          ..write('downloadTaskId: $downloadTaskId, ')
          ..write('downloadRecordJson: $downloadRecordJson, ')
          ..write('isHandled: $isHandled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseId, downloadTaskId, downloadRecordJson,
      isHandled, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseDownloadStatusEntry &&
          other.courseId == this.courseId &&
          other.downloadTaskId == this.downloadTaskId &&
          other.downloadRecordJson == this.downloadRecordJson &&
          other.isHandled == this.isHandled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CourseDownloadStatusTableCompanion
    extends UpdateCompanion<CourseDownloadStatusEntry> {
  final Value<String> courseId;
  final Value<String> downloadTaskId;
  final Value<String> downloadRecordJson;
  final Value<bool> isHandled;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CourseDownloadStatusTableCompanion({
    this.courseId = const Value.absent(),
    this.downloadTaskId = const Value.absent(),
    this.downloadRecordJson = const Value.absent(),
    this.isHandled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseDownloadStatusTableCompanion.insert({
    required String courseId,
    required String downloadTaskId,
    required String downloadRecordJson,
    this.isHandled = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : courseId = Value(courseId),
        downloadTaskId = Value(downloadTaskId),
        downloadRecordJson = Value(downloadRecordJson),
        createdAt = Value(createdAt);
  static Insertable<CourseDownloadStatusEntry> custom({
    Expression<String>? courseId,
    Expression<String>? downloadTaskId,
    Expression<String>? downloadRecordJson,
    Expression<bool>? isHandled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (downloadTaskId != null) 'download_task_id': downloadTaskId,
      if (downloadRecordJson != null)
        'download_record_json': downloadRecordJson,
      if (isHandled != null) 'is_handled': isHandled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseDownloadStatusTableCompanion copyWith(
      {Value<String>? courseId,
      Value<String>? downloadTaskId,
      Value<String>? downloadRecordJson,
      Value<bool>? isHandled,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CourseDownloadStatusTableCompanion(
      courseId: courseId ?? this.courseId,
      downloadTaskId: downloadTaskId ?? this.downloadTaskId,
      downloadRecordJson: downloadRecordJson ?? this.downloadRecordJson,
      isHandled: isHandled ?? this.isHandled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (downloadTaskId.present) {
      map['download_task_id'] = Variable<String>(downloadTaskId.value);
    }
    if (downloadRecordJson.present) {
      map['download_record_json'] = Variable<String>(downloadRecordJson.value);
    }
    if (isHandled.present) {
      map['is_handled'] = Variable<bool>(isHandled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseDownloadStatusTableCompanion(')
          ..write('courseId: $courseId, ')
          ..write('downloadTaskId: $downloadTaskId, ')
          ..write('downloadRecordJson: $downloadRecordJson, ')
          ..write('isHandled: $isHandled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LectureTableTable extends LectureTable
    with TableInfo<$LectureTableTable, LectureEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LectureTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceUrlMeta =
      const VerificationMeta('resourceUrl');
  @override
  late final GeneratedColumn<String> resourceUrl = GeneratedColumn<String>(
      'resource_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceTypeMeta =
      const VerificationMeta('resourceType');
  @override
  late final GeneratedColumnWithTypeConverter<LectureResourceTypeEntity, String>
      resourceType = GeneratedColumn<String>(
              'resource_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LectureResourceTypeEntity>(
              $LectureTableTable.$converterresourceType);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attachedFileUrlMeta =
      const VerificationMeta('attachedFileUrl');
  @override
  late final GeneratedColumn<String> attachedFileUrl = GeneratedColumn<String>(
      'attached_file_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumnWithTypeConverter<MediaEntity?, String> media =
      GeneratedColumn<String>('media', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<MediaEntity?>($LectureTableTable.$convertermedian);
  static const VerificationMeta _interactiveFeaturesMeta =
      const VerificationMeta('interactiveFeatures');
  @override
  late final GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>,
      String> interactiveFeatures = GeneratedColumn<String>(
          'interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<InteractiveFeatureEntity>>(
          $LectureTableTable.$converterinteractiveFeatures);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        resourceUrl,
        description,
        resourceType,
        videoUrl,
        attachedFileUrl,
        courseId,
        media,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lectures';
  @override
  VerificationContext validateIntegrity(Insertable<LectureEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('resource_url')) {
      context.handle(
          _resourceUrlMeta,
          resourceUrl.isAcceptableOrUnknown(
              data['resource_url']!, _resourceUrlMeta));
    } else if (isInserting) {
      context.missing(_resourceUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_resourceTypeMeta, const VerificationResult.success());
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('attached_file_url')) {
      context.handle(
          _attachedFileUrlMeta,
          attachedFileUrl.isAcceptableOrUnknown(
              data['attached_file_url']!, _attachedFileUrlMeta));
    } else if (isInserting) {
      context.missing(_attachedFileUrlMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    context.handle(_mediaMeta, const VerificationResult.success());
    context.handle(
        _interactiveFeaturesMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LectureEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LectureEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      resourceUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_url'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      resourceType: $LectureTableTable.$converterresourceType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}resource_type'])!),
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url'])!,
      attachedFileUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}attached_file_url'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      media: $LectureTableTable.$convertermedian.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media'])),
      interactiveFeatures: $LectureTableTable.$converterinteractiveFeatures
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}interactive_features'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $LectureTableTable createAlias(String alias) {
    return $LectureTableTable(attachedDatabase, alias);
  }

  static TypeConverter<LectureResourceTypeEntity, String>
      $converterresourceType = const LectureResourceTypeConverter();
  static TypeConverter<MediaEntity, String> $convertermedia =
      const MediaConverter();
  static TypeConverter<MediaEntity?, String?> $convertermedian =
      NullAwareTypeConverter.wrap($convertermedia);
  static TypeConverter<List<InteractiveFeatureEntity>, String>
      $converterinteractiveFeatures = const InteractiveFeaturesListConverter();
}

class LectureEntry extends DataClass implements Insertable<LectureEntry> {
  final String id;
  final String title;
  final String resourceUrl;
  final String description;
  final LectureResourceTypeEntity resourceType;
  final String videoUrl;
  final String attachedFileUrl;
  final String courseId;
  final MediaEntity? media;
  final List<InteractiveFeatureEntity> interactiveFeatures;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const LectureEntry(
      {required this.id,
      required this.title,
      required this.resourceUrl,
      required this.description,
      required this.resourceType,
      required this.videoUrl,
      required this.attachedFileUrl,
      required this.courseId,
      this.media,
      required this.interactiveFeatures,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['resource_url'] = Variable<String>(resourceUrl);
    map['description'] = Variable<String>(description);
    {
      map['resource_type'] = Variable<String>(
          $LectureTableTable.$converterresourceType.toSql(resourceType));
    }
    map['video_url'] = Variable<String>(videoUrl);
    map['attached_file_url'] = Variable<String>(attachedFileUrl);
    map['course_id'] = Variable<String>(courseId);
    if (!nullToAbsent || media != null) {
      map['media'] =
          Variable<String>($LectureTableTable.$convertermedian.toSql(media));
    }
    {
      map['interactive_features'] = Variable<String>($LectureTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  LectureTableCompanion toCompanion(bool nullToAbsent) {
    return LectureTableCompanion(
      id: Value(id),
      title: Value(title),
      resourceUrl: Value(resourceUrl),
      description: Value(description),
      resourceType: Value(resourceType),
      videoUrl: Value(videoUrl),
      attachedFileUrl: Value(attachedFileUrl),
      courseId: Value(courseId),
      media:
          media == null && nullToAbsent ? const Value.absent() : Value(media),
      interactiveFeatures: Value(interactiveFeatures),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LectureEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LectureEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      resourceUrl: serializer.fromJson<String>(json['resourceUrl']),
      description: serializer.fromJson<String>(json['description']),
      resourceType:
          serializer.fromJson<LectureResourceTypeEntity>(json['resourceType']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      attachedFileUrl: serializer.fromJson<String>(json['attachedFileUrl']),
      courseId: serializer.fromJson<String>(json['courseId']),
      media: serializer.fromJson<MediaEntity?>(json['media']),
      interactiveFeatures: serializer.fromJson<List<InteractiveFeatureEntity>>(
          json['interactiveFeatures']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'resourceUrl': serializer.toJson<String>(resourceUrl),
      'description': serializer.toJson<String>(description),
      'resourceType':
          serializer.toJson<LectureResourceTypeEntity>(resourceType),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'attachedFileUrl': serializer.toJson<String>(attachedFileUrl),
      'courseId': serializer.toJson<String>(courseId),
      'media': serializer.toJson<MediaEntity?>(media),
      'interactiveFeatures': serializer
          .toJson<List<InteractiveFeatureEntity>>(interactiveFeatures),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LectureEntry copyWith(
          {String? id,
          String? title,
          String? resourceUrl,
          String? description,
          LectureResourceTypeEntity? resourceType,
          String? videoUrl,
          String? attachedFileUrl,
          String? courseId,
          Value<MediaEntity?> media = const Value.absent(),
          List<InteractiveFeatureEntity>? interactiveFeatures,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      LectureEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        resourceUrl: resourceUrl ?? this.resourceUrl,
        description: description ?? this.description,
        resourceType: resourceType ?? this.resourceType,
        videoUrl: videoUrl ?? this.videoUrl,
        attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
        courseId: courseId ?? this.courseId,
        media: media.present ? media.value : this.media,
        interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  LectureEntry copyWithCompanion(LectureTableCompanion data) {
    return LectureEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      resourceUrl:
          data.resourceUrl.present ? data.resourceUrl.value : this.resourceUrl,
      description:
          data.description.present ? data.description.value : this.description,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      attachedFileUrl: data.attachedFileUrl.present
          ? data.attachedFileUrl.value
          : this.attachedFileUrl,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      media: data.media.present ? data.media.value : this.media,
      interactiveFeatures: data.interactiveFeatures.present
          ? data.interactiveFeatures.value
          : this.interactiveFeatures,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LectureEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('resourceUrl: $resourceUrl, ')
          ..write('description: $description, ')
          ..write('resourceType: $resourceType, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('attachedFileUrl: $attachedFileUrl, ')
          ..write('courseId: $courseId, ')
          ..write('media: $media, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      resourceUrl,
      description,
      resourceType,
      videoUrl,
      attachedFileUrl,
      courseId,
      media,
      interactiveFeatures,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LectureEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.resourceUrl == this.resourceUrl &&
          other.description == this.description &&
          other.resourceType == this.resourceType &&
          other.videoUrl == this.videoUrl &&
          other.attachedFileUrl == this.attachedFileUrl &&
          other.courseId == this.courseId &&
          other.media == this.media &&
          other.interactiveFeatures == this.interactiveFeatures &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class LectureTableCompanion extends UpdateCompanion<LectureEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> resourceUrl;
  final Value<String> description;
  final Value<LectureResourceTypeEntity> resourceType;
  final Value<String> videoUrl;
  final Value<String> attachedFileUrl;
  final Value<String> courseId;
  final Value<MediaEntity?> media;
  final Value<List<InteractiveFeatureEntity>> interactiveFeatures;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const LectureTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.resourceUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.attachedFileUrl = const Value.absent(),
    this.courseId = const Value.absent(),
    this.media = const Value.absent(),
    this.interactiveFeatures = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LectureTableCompanion.insert({
    required String id,
    required String title,
    required String resourceUrl,
    required String description,
    required LectureResourceTypeEntity resourceType,
    required String videoUrl,
    required String attachedFileUrl,
    required String courseId,
    this.media = const Value.absent(),
    required List<InteractiveFeatureEntity> interactiveFeatures,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        resourceUrl = Value(resourceUrl),
        description = Value(description),
        resourceType = Value(resourceType),
        videoUrl = Value(videoUrl),
        attachedFileUrl = Value(attachedFileUrl),
        courseId = Value(courseId),
        interactiveFeatures = Value(interactiveFeatures),
        createdAt = Value(createdAt);
  static Insertable<LectureEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? resourceUrl,
    Expression<String>? description,
    Expression<String>? resourceType,
    Expression<String>? videoUrl,
    Expression<String>? attachedFileUrl,
    Expression<String>? courseId,
    Expression<String>? media,
    Expression<String>? interactiveFeatures,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (resourceUrl != null) 'resource_url': resourceUrl,
      if (description != null) 'description': description,
      if (resourceType != null) 'resource_type': resourceType,
      if (videoUrl != null) 'video_url': videoUrl,
      if (attachedFileUrl != null) 'attached_file_url': attachedFileUrl,
      if (courseId != null) 'course_id': courseId,
      if (media != null) 'media': media,
      if (interactiveFeatures != null)
        'interactive_features': interactiveFeatures,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LectureTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? resourceUrl,
      Value<String>? description,
      Value<LectureResourceTypeEntity>? resourceType,
      Value<String>? videoUrl,
      Value<String>? attachedFileUrl,
      Value<String>? courseId,
      Value<MediaEntity?>? media,
      Value<List<InteractiveFeatureEntity>>? interactiveFeatures,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return LectureTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      resourceUrl: resourceUrl ?? this.resourceUrl,
      description: description ?? this.description,
      resourceType: resourceType ?? this.resourceType,
      videoUrl: videoUrl ?? this.videoUrl,
      attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
      courseId: courseId ?? this.courseId,
      media: media ?? this.media,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (resourceUrl.present) {
      map['resource_url'] = Variable<String>(resourceUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(
          $LectureTableTable.$converterresourceType.toSql(resourceType.value));
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (attachedFileUrl.present) {
      map['attached_file_url'] = Variable<String>(attachedFileUrl.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (media.present) {
      map['media'] = Variable<String>(
          $LectureTableTable.$convertermedian.toSql(media.value));
    }
    if (interactiveFeatures.present) {
      map['interactive_features'] = Variable<String>($LectureTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LectureTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('resourceUrl: $resourceUrl, ')
          ..write('description: $description, ')
          ..write('resourceType: $resourceType, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('attachedFileUrl: $attachedFileUrl, ')
          ..write('courseId: $courseId, ')
          ..write('media: $media, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningActivityTableTable extends LearningActivityTable
    with TableInfo<$LearningActivityTableTable, LearningActivityEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningActivityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumnWithTypeConverter<MediaEntity?, String> media =
      GeneratedColumn<String>('media', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<MediaEntity?>(
              $LearningActivityTableTable.$convertermedian);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _interactiveFeaturesMeta =
      const VerificationMeta('interactiveFeatures');
  @override
  late final GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>,
      String> interactiveFeatures = GeneratedColumn<String>(
          'interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<InteractiveFeatureEntity>>(
          $LearningActivityTableTable.$converterinteractiveFeatures);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        media,
        courseId,
        lectureId,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_activities';
  @override
  VerificationContext validateIntegrity(
      Insertable<LearningActivityEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_mediaMeta, const VerificationResult.success());
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    context.handle(
        _interactiveFeaturesMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningActivityEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningActivityEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      media: $LearningActivityTableTable.$convertermedian.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}media'])),
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lecture_id'])!,
      interactiveFeatures: $LearningActivityTableTable
          .$converterinteractiveFeatures
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}interactive_features'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $LearningActivityTableTable createAlias(String alias) {
    return $LearningActivityTableTable(attachedDatabase, alias);
  }

  static TypeConverter<MediaEntity, String> $convertermedia =
      const MediaConverter();
  static TypeConverter<MediaEntity?, String?> $convertermedian =
      NullAwareTypeConverter.wrap($convertermedia);
  static TypeConverter<List<InteractiveFeatureEntity>, String>
      $converterinteractiveFeatures = const InteractiveFeaturesListConverter();
}

class LearningActivityEntry extends DataClass
    implements Insertable<LearningActivityEntry> {
  final String id;
  final String title;
  final String description;
  final MediaEntity? media;
  final String courseId;
  final String lectureId;
  final List<InteractiveFeatureEntity> interactiveFeatures;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const LearningActivityEntry(
      {required this.id,
      required this.title,
      required this.description,
      this.media,
      required this.courseId,
      required this.lectureId,
      required this.interactiveFeatures,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || media != null) {
      map['media'] = Variable<String>(
          $LearningActivityTableTable.$convertermedian.toSql(media));
    }
    map['course_id'] = Variable<String>(courseId);
    map['lecture_id'] = Variable<String>(lectureId);
    {
      map['interactive_features'] = Variable<String>($LearningActivityTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  LearningActivityTableCompanion toCompanion(bool nullToAbsent) {
    return LearningActivityTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      media:
          media == null && nullToAbsent ? const Value.absent() : Value(media),
      courseId: Value(courseId),
      lectureId: Value(lectureId),
      interactiveFeatures: Value(interactiveFeatures),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LearningActivityEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningActivityEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      media: serializer.fromJson<MediaEntity?>(json['media']),
      courseId: serializer.fromJson<String>(json['courseId']),
      lectureId: serializer.fromJson<String>(json['lectureId']),
      interactiveFeatures: serializer.fromJson<List<InteractiveFeatureEntity>>(
          json['interactiveFeatures']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'media': serializer.toJson<MediaEntity?>(media),
      'courseId': serializer.toJson<String>(courseId),
      'lectureId': serializer.toJson<String>(lectureId),
      'interactiveFeatures': serializer
          .toJson<List<InteractiveFeatureEntity>>(interactiveFeatures),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LearningActivityEntry copyWith(
          {String? id,
          String? title,
          String? description,
          Value<MediaEntity?> media = const Value.absent(),
          String? courseId,
          String? lectureId,
          List<InteractiveFeatureEntity>? interactiveFeatures,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      LearningActivityEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        media: media.present ? media.value : this.media,
        courseId: courseId ?? this.courseId,
        lectureId: lectureId ?? this.lectureId,
        interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  LearningActivityEntry copyWithCompanion(LearningActivityTableCompanion data) {
    return LearningActivityEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      media: data.media.present ? data.media.value : this.media,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      interactiveFeatures: data.interactiveFeatures.present
          ? data.interactiveFeatures.value
          : this.interactiveFeatures,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningActivityEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('courseId: $courseId, ')
          ..write('lectureId: $lectureId, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, media, courseId,
      lectureId, interactiveFeatures, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningActivityEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.media == this.media &&
          other.courseId == this.courseId &&
          other.lectureId == this.lectureId &&
          other.interactiveFeatures == this.interactiveFeatures &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class LearningActivityTableCompanion
    extends UpdateCompanion<LearningActivityEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<MediaEntity?> media;
  final Value<String> courseId;
  final Value<String> lectureId;
  final Value<List<InteractiveFeatureEntity>> interactiveFeatures;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const LearningActivityTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.courseId = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.interactiveFeatures = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningActivityTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    this.media = const Value.absent(),
    required String courseId,
    required String lectureId,
    required List<InteractiveFeatureEntity> interactiveFeatures,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        courseId = Value(courseId),
        lectureId = Value(lectureId),
        interactiveFeatures = Value(interactiveFeatures),
        createdAt = Value(createdAt);
  static Insertable<LearningActivityEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? media,
    Expression<String>? courseId,
    Expression<String>? lectureId,
    Expression<String>? interactiveFeatures,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (media != null) 'media': media,
      if (courseId != null) 'course_id': courseId,
      if (lectureId != null) 'lecture_id': lectureId,
      if (interactiveFeatures != null)
        'interactive_features': interactiveFeatures,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningActivityTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<MediaEntity?>? media,
      Value<String>? courseId,
      Value<String>? lectureId,
      Value<List<InteractiveFeatureEntity>>? interactiveFeatures,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return LearningActivityTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      media: media ?? this.media,
      courseId: courseId ?? this.courseId,
      lectureId: lectureId ?? this.lectureId,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (media.present) {
      map['media'] = Variable<String>(
          $LearningActivityTableTable.$convertermedian.toSql(media.value));
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<String>(lectureId.value);
    }
    if (interactiveFeatures.present) {
      map['interactive_features'] = Variable<String>($LearningActivityTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningActivityTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('courseId: $courseId, ')
          ..write('lectureId: $lectureId, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningSummaryTableTable extends LearningSummaryTable
    with TableInfo<$LearningSummaryTableTable, LearningSummaryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningSummaryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumnWithTypeConverter<MediaEntity?, String> media =
      GeneratedColumn<String>('media', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<MediaEntity?>(
              $LearningSummaryTableTable.$convertermedian);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _interactiveFeaturesMeta =
      const VerificationMeta('interactiveFeatures');
  @override
  late final GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>,
      String> interactiveFeatures = GeneratedColumn<String>(
          'interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<InteractiveFeatureEntity>>(
          $LearningSummaryTableTable.$converterinteractiveFeatures);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        media,
        lectureId,
        courseId,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_summaries';
  @override
  VerificationContext validateIntegrity(
      Insertable<LearningSummaryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_mediaMeta, const VerificationResult.success());
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    context.handle(
        _interactiveFeaturesMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningSummaryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningSummaryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      media: $LearningSummaryTableTable.$convertermedian.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}media'])),
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lecture_id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      interactiveFeatures: $LearningSummaryTableTable
          .$converterinteractiveFeatures
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}interactive_features'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $LearningSummaryTableTable createAlias(String alias) {
    return $LearningSummaryTableTable(attachedDatabase, alias);
  }

  static TypeConverter<MediaEntity, String> $convertermedia =
      const MediaConverter();
  static TypeConverter<MediaEntity?, String?> $convertermedian =
      NullAwareTypeConverter.wrap($convertermedia);
  static TypeConverter<List<InteractiveFeatureEntity>, String>
      $converterinteractiveFeatures = const InteractiveFeaturesListConverter();
}

class LearningSummaryEntry extends DataClass
    implements Insertable<LearningSummaryEntry> {
  final String id;
  final String title;
  final String description;
  final MediaEntity? media;
  final String lectureId;
  final String courseId;
  final List<InteractiveFeatureEntity> interactiveFeatures;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const LearningSummaryEntry(
      {required this.id,
      required this.title,
      required this.description,
      this.media,
      required this.lectureId,
      required this.courseId,
      required this.interactiveFeatures,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || media != null) {
      map['media'] = Variable<String>(
          $LearningSummaryTableTable.$convertermedian.toSql(media));
    }
    map['lecture_id'] = Variable<String>(lectureId);
    map['course_id'] = Variable<String>(courseId);
    {
      map['interactive_features'] = Variable<String>($LearningSummaryTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  LearningSummaryTableCompanion toCompanion(bool nullToAbsent) {
    return LearningSummaryTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      media:
          media == null && nullToAbsent ? const Value.absent() : Value(media),
      lectureId: Value(lectureId),
      courseId: Value(courseId),
      interactiveFeatures: Value(interactiveFeatures),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LearningSummaryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningSummaryEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      media: serializer.fromJson<MediaEntity?>(json['media']),
      lectureId: serializer.fromJson<String>(json['lectureId']),
      courseId: serializer.fromJson<String>(json['courseId']),
      interactiveFeatures: serializer.fromJson<List<InteractiveFeatureEntity>>(
          json['interactiveFeatures']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'media': serializer.toJson<MediaEntity?>(media),
      'lectureId': serializer.toJson<String>(lectureId),
      'courseId': serializer.toJson<String>(courseId),
      'interactiveFeatures': serializer
          .toJson<List<InteractiveFeatureEntity>>(interactiveFeatures),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LearningSummaryEntry copyWith(
          {String? id,
          String? title,
          String? description,
          Value<MediaEntity?> media = const Value.absent(),
          String? lectureId,
          String? courseId,
          List<InteractiveFeatureEntity>? interactiveFeatures,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      LearningSummaryEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        media: media.present ? media.value : this.media,
        lectureId: lectureId ?? this.lectureId,
        courseId: courseId ?? this.courseId,
        interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  LearningSummaryEntry copyWithCompanion(LearningSummaryTableCompanion data) {
    return LearningSummaryEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      media: data.media.present ? data.media.value : this.media,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      interactiveFeatures: data.interactiveFeatures.present
          ? data.interactiveFeatures.value
          : this.interactiveFeatures,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningSummaryEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('lectureId: $lectureId, ')
          ..write('courseId: $courseId, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, media, lectureId,
      courseId, interactiveFeatures, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningSummaryEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.media == this.media &&
          other.lectureId == this.lectureId &&
          other.courseId == this.courseId &&
          other.interactiveFeatures == this.interactiveFeatures &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class LearningSummaryTableCompanion
    extends UpdateCompanion<LearningSummaryEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<MediaEntity?> media;
  final Value<String> lectureId;
  final Value<String> courseId;
  final Value<List<InteractiveFeatureEntity>> interactiveFeatures;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const LearningSummaryTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.interactiveFeatures = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningSummaryTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    this.media = const Value.absent(),
    required String lectureId,
    required String courseId,
    required List<InteractiveFeatureEntity> interactiveFeatures,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        lectureId = Value(lectureId),
        courseId = Value(courseId),
        interactiveFeatures = Value(interactiveFeatures),
        createdAt = Value(createdAt);
  static Insertable<LearningSummaryEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? media,
    Expression<String>? lectureId,
    Expression<String>? courseId,
    Expression<String>? interactiveFeatures,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (media != null) 'media': media,
      if (lectureId != null) 'lecture_id': lectureId,
      if (courseId != null) 'course_id': courseId,
      if (interactiveFeatures != null)
        'interactive_features': interactiveFeatures,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningSummaryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<MediaEntity?>? media,
      Value<String>? lectureId,
      Value<String>? courseId,
      Value<List<InteractiveFeatureEntity>>? interactiveFeatures,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return LearningSummaryTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      media: media ?? this.media,
      lectureId: lectureId ?? this.lectureId,
      courseId: courseId ?? this.courseId,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (media.present) {
      map['media'] = Variable<String>(
          $LearningSummaryTableTable.$convertermedian.toSql(media.value));
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<String>(lectureId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (interactiveFeatures.present) {
      map['interactive_features'] = Variable<String>($LearningSummaryTableTable
          .$converterinteractiveFeatures
          .toSql(interactiveFeatures.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningSummaryTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('lectureId: $lectureId, ')
          ..write('courseId: $courseId, ')
          ..write('interactiveFeatures: $interactiveFeatures, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningQuizTableTable extends LearningQuizTable
    with TableInfo<$LearningQuizTableTable, LearningQuizEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningQuizTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<LearningQuizTypeEntity, String>
      type = GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LearningQuizTypeEntity>(
              $LearningQuizTableTable.$convertertype);
  static const VerificationMeta _isTryAgainMeta =
      const VerificationMeta('isTryAgain');
  @override
  late final GeneratedColumn<bool> isTryAgain = GeneratedColumn<bool>(
      'is_try_again', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_try_again" IN (0, 1))'));
  static const VerificationMeta _questionsMeta =
      const VerificationMeta('questions');
  @override
  late final GeneratedColumnWithTypeConverter<List<LearningQuizQuestionEntity>,
      String> questions = GeneratedColumn<String>(
          'questions', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<LearningQuizQuestionEntity>>(
          $LearningQuizTableTable.$converterquestions);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        lectureId,
        courseId,
        type,
        isTryAgain,
        questions,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_quizzes';
  @override
  VerificationContext validateIntegrity(Insertable<LearningQuizEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('is_try_again')) {
      context.handle(
          _isTryAgainMeta,
          isTryAgain.isAcceptableOrUnknown(
              data['is_try_again']!, _isTryAgainMeta));
    } else if (isInserting) {
      context.missing(_isTryAgainMeta);
    }
    context.handle(_questionsMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningQuizEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningQuizEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lecture_id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      type: $LearningQuizTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      isTryAgain: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_try_again'])!,
      questions: $LearningQuizTableTable.$converterquestions.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}questions'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $LearningQuizTableTable createAlias(String alias) {
    return $LearningQuizTableTable(attachedDatabase, alias);
  }

  static TypeConverter<LearningQuizTypeEntity, String> $convertertype =
      const LearningQuizTypeConverter();
  static TypeConverter<List<LearningQuizQuestionEntity>, String>
      $converterquestions = const LearningQuizQuestionListConverter();
}

class LearningQuizEntry extends DataClass
    implements Insertable<LearningQuizEntry> {
  final String id;
  final String title;
  final String lectureId;
  final String courseId;
  final LearningQuizTypeEntity type;
  final bool isTryAgain;
  final List<LearningQuizQuestionEntity> questions;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const LearningQuizEntry(
      {required this.id,
      required this.title,
      required this.lectureId,
      required this.courseId,
      required this.type,
      required this.isTryAgain,
      required this.questions,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['lecture_id'] = Variable<String>(lectureId);
    map['course_id'] = Variable<String>(courseId);
    {
      map['type'] =
          Variable<String>($LearningQuizTableTable.$convertertype.toSql(type));
    }
    map['is_try_again'] = Variable<bool>(isTryAgain);
    {
      map['questions'] = Variable<String>(
          $LearningQuizTableTable.$converterquestions.toSql(questions));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  LearningQuizTableCompanion toCompanion(bool nullToAbsent) {
    return LearningQuizTableCompanion(
      id: Value(id),
      title: Value(title),
      lectureId: Value(lectureId),
      courseId: Value(courseId),
      type: Value(type),
      isTryAgain: Value(isTryAgain),
      questions: Value(questions),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LearningQuizEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningQuizEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      lectureId: serializer.fromJson<String>(json['lectureId']),
      courseId: serializer.fromJson<String>(json['courseId']),
      type: serializer.fromJson<LearningQuizTypeEntity>(json['type']),
      isTryAgain: serializer.fromJson<bool>(json['isTryAgain']),
      questions: serializer
          .fromJson<List<LearningQuizQuestionEntity>>(json['questions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'lectureId': serializer.toJson<String>(lectureId),
      'courseId': serializer.toJson<String>(courseId),
      'type': serializer.toJson<LearningQuizTypeEntity>(type),
      'isTryAgain': serializer.toJson<bool>(isTryAgain),
      'questions':
          serializer.toJson<List<LearningQuizQuestionEntity>>(questions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LearningQuizEntry copyWith(
          {String? id,
          String? title,
          String? lectureId,
          String? courseId,
          LearningQuizTypeEntity? type,
          bool? isTryAgain,
          List<LearningQuizQuestionEntity>? questions,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      LearningQuizEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        lectureId: lectureId ?? this.lectureId,
        courseId: courseId ?? this.courseId,
        type: type ?? this.type,
        isTryAgain: isTryAgain ?? this.isTryAgain,
        questions: questions ?? this.questions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  LearningQuizEntry copyWithCompanion(LearningQuizTableCompanion data) {
    return LearningQuizEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      type: data.type.present ? data.type.value : this.type,
      isTryAgain:
          data.isTryAgain.present ? data.isTryAgain.value : this.isTryAgain,
      questions: data.questions.present ? data.questions.value : this.questions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningQuizEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('lectureId: $lectureId, ')
          ..write('courseId: $courseId, ')
          ..write('type: $type, ')
          ..write('isTryAgain: $isTryAgain, ')
          ..write('questions: $questions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, lectureId, courseId, type,
      isTryAgain, questions, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningQuizEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.lectureId == this.lectureId &&
          other.courseId == this.courseId &&
          other.type == this.type &&
          other.isTryAgain == this.isTryAgain &&
          other.questions == this.questions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class LearningQuizTableCompanion extends UpdateCompanion<LearningQuizEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> lectureId;
  final Value<String> courseId;
  final Value<LearningQuizTypeEntity> type;
  final Value<bool> isTryAgain;
  final Value<List<LearningQuizQuestionEntity>> questions;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const LearningQuizTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.type = const Value.absent(),
    this.isTryAgain = const Value.absent(),
    this.questions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningQuizTableCompanion.insert({
    required String id,
    required String title,
    required String lectureId,
    required String courseId,
    required LearningQuizTypeEntity type,
    required bool isTryAgain,
    required List<LearningQuizQuestionEntity> questions,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        lectureId = Value(lectureId),
        courseId = Value(courseId),
        type = Value(type),
        isTryAgain = Value(isTryAgain),
        questions = Value(questions),
        createdAt = Value(createdAt);
  static Insertable<LearningQuizEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? lectureId,
    Expression<String>? courseId,
    Expression<String>? type,
    Expression<bool>? isTryAgain,
    Expression<String>? questions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (lectureId != null) 'lecture_id': lectureId,
      if (courseId != null) 'course_id': courseId,
      if (type != null) 'type': type,
      if (isTryAgain != null) 'is_try_again': isTryAgain,
      if (questions != null) 'questions': questions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningQuizTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? lectureId,
      Value<String>? courseId,
      Value<LearningQuizTypeEntity>? type,
      Value<bool>? isTryAgain,
      Value<List<LearningQuizQuestionEntity>>? questions,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return LearningQuizTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      lectureId: lectureId ?? this.lectureId,
      courseId: courseId ?? this.courseId,
      type: type ?? this.type,
      isTryAgain: isTryAgain ?? this.isTryAgain,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<String>(lectureId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $LearningQuizTableTable.$convertertype.toSql(type.value));
    }
    if (isTryAgain.present) {
      map['is_try_again'] = Variable<bool>(isTryAgain.value);
    }
    if (questions.present) {
      map['questions'] = Variable<String>(
          $LearningQuizTableTable.$converterquestions.toSql(questions.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningQuizTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('lectureId: $lectureId, ')
          ..write('courseId: $courseId, ')
          ..write('type: $type, ')
          ..write('isTryAgain: $isTryAgain, ')
          ..write('questions: $questions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserCourseTableTable extends UserCourseTable
    with TableInfo<$UserCourseTableTable, UserCourseEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserCourseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _learnerIdMeta =
      const VerificationMeta('learnerId');
  @override
  late final GeneratedColumn<String> learnerId = GeneratedColumn<String>(
      'learner_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, learnerId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_courses';
  @override
  VerificationContext validateIntegrity(Insertable<UserCourseEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('learner_id')) {
      context.handle(_learnerIdMeta,
          learnerId.isAcceptableOrUnknown(data['learner_id']!, _learnerIdMeta));
    } else if (isInserting) {
      context.missing(_learnerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId, learnerId};
  @override
  UserCourseEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserCourseEntry(
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      learnerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}learner_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $UserCourseTableTable createAlias(String alias) {
    return $UserCourseTableTable(attachedDatabase, alias);
  }
}

class UserCourseEntry extends DataClass implements Insertable<UserCourseEntry> {
  final String courseId;
  final String learnerId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const UserCourseEntry(
      {required this.courseId,
      required this.learnerId,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<String>(courseId);
    map['learner_id'] = Variable<String>(learnerId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UserCourseTableCompanion toCompanion(bool nullToAbsent) {
    return UserCourseTableCompanion(
      courseId: Value(courseId),
      learnerId: Value(learnerId),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory UserCourseEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserCourseEntry(
      courseId: serializer.fromJson<String>(json['courseId']),
      learnerId: serializer.fromJson<String>(json['learnerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseId': serializer.toJson<String>(courseId),
      'learnerId': serializer.toJson<String>(learnerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  UserCourseEntry copyWith(
          {String? courseId,
          String? learnerId,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      UserCourseEntry(
        courseId: courseId ?? this.courseId,
        learnerId: learnerId ?? this.learnerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  UserCourseEntry copyWithCompanion(UserCourseTableCompanion data) {
    return UserCourseEntry(
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      learnerId: data.learnerId.present ? data.learnerId.value : this.learnerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserCourseEntry(')
          ..write('courseId: $courseId, ')
          ..write('learnerId: $learnerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(courseId, learnerId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserCourseEntry &&
          other.courseId == this.courseId &&
          other.learnerId == this.learnerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class UserCourseTableCompanion extends UpdateCompanion<UserCourseEntry> {
  final Value<String> courseId;
  final Value<String> learnerId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const UserCourseTableCompanion({
    this.courseId = const Value.absent(),
    this.learnerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCourseTableCompanion.insert({
    required String courseId,
    required String learnerId,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : courseId = Value(courseId),
        learnerId = Value(learnerId),
        createdAt = Value(createdAt);
  static Insertable<UserCourseEntry> custom({
    Expression<String>? courseId,
    Expression<String>? learnerId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (learnerId != null) 'learner_id': learnerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCourseTableCompanion copyWith(
      {Value<String>? courseId,
      Value<String>? learnerId,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return UserCourseTableCompanion(
      courseId: courseId ?? this.courseId,
      learnerId: learnerId ?? this.learnerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (learnerId.present) {
      map['learner_id'] = Variable<String>(learnerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCourseTableCompanion(')
          ..write('courseId: $courseId, ')
          ..write('learnerId: $learnerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LiveSessionTableTable extends LiveSessionTable
    with TableInfo<$LiveSessionTableTable, LiveSessionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LiveSessionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meetingIdMeta =
      const VerificationMeta('meetingId');
  @override
  late final GeneratedColumn<String> meetingId = GeneratedColumn<String>(
      'meeting_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateTimeMeta =
      const VerificationMeta('startDateTime');
  @override
  late final GeneratedColumn<DateTime> startDateTime =
      GeneratedColumn<DateTime>('start_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _agendaMeta = const VerificationMeta('agenda');
  @override
  late final GeneratedColumn<String> agenda = GeneratedColumn<String>(
      'agenda', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isHostVideoEnabledMeta =
      const VerificationMeta('isHostVideoEnabled');
  @override
  late final GeneratedColumn<bool> isHostVideoEnabled = GeneratedColumn<bool>(
      'is_host_video_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_host_video_enabled" IN (0, 1))'));
  static const VerificationMeta _isParticipantVideoEnabledMeta =
      const VerificationMeta('isParticipantVideoEnabled');
  @override
  late final GeneratedColumn<bool> isParticipantVideoEnabled =
      GeneratedColumn<bool>('is_participant_video_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_participant_video_enabled" IN (0, 1))'));
  static const VerificationMeta _durationInMinutesMeta =
      const VerificationMeta('durationInMinutes');
  @override
  late final GeneratedColumn<int> durationInMinutes = GeneratedColumn<int>(
      'duration_in_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passcodeMeta =
      const VerificationMeta('passcode');
  @override
  late final GeneratedColumn<String> passcode = GeneratedColumn<String>(
      'passcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startUrlMeta =
      const VerificationMeta('startUrl');
  @override
  late final GeneratedColumn<String> startUrl = GeneratedColumn<String>(
      'start_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _joinUrlMeta =
      const VerificationMeta('joinUrl');
  @override
  late final GeneratedColumn<String> joinUrl = GeneratedColumn<String>(
      'join_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        lectureId,
        topic,
        meetingId,
        startDateTime,
        agenda,
        isHostVideoEnabled,
        isParticipantVideoEnabled,
        durationInMinutes,
        description,
        passcode,
        status,
        startUrl,
        joinUrl,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'live_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<LiveSessionEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('meeting_id')) {
      context.handle(_meetingIdMeta,
          meetingId.isAcceptableOrUnknown(data['meeting_id']!, _meetingIdMeta));
    } else if (isInserting) {
      context.missing(_meetingIdMeta);
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
          _startDateTimeMeta,
          startDateTime.isAcceptableOrUnknown(
              data['start_date_time']!, _startDateTimeMeta));
    } else if (isInserting) {
      context.missing(_startDateTimeMeta);
    }
    if (data.containsKey('agenda')) {
      context.handle(_agendaMeta,
          agenda.isAcceptableOrUnknown(data['agenda']!, _agendaMeta));
    } else if (isInserting) {
      context.missing(_agendaMeta);
    }
    if (data.containsKey('is_host_video_enabled')) {
      context.handle(
          _isHostVideoEnabledMeta,
          isHostVideoEnabled.isAcceptableOrUnknown(
              data['is_host_video_enabled']!, _isHostVideoEnabledMeta));
    } else if (isInserting) {
      context.missing(_isHostVideoEnabledMeta);
    }
    if (data.containsKey('is_participant_video_enabled')) {
      context.handle(
          _isParticipantVideoEnabledMeta,
          isParticipantVideoEnabled.isAcceptableOrUnknown(
              data['is_participant_video_enabled']!,
              _isParticipantVideoEnabledMeta));
    } else if (isInserting) {
      context.missing(_isParticipantVideoEnabledMeta);
    }
    if (data.containsKey('duration_in_minutes')) {
      context.handle(
          _durationInMinutesMeta,
          durationInMinutes.isAcceptableOrUnknown(
              data['duration_in_minutes']!, _durationInMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationInMinutesMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('passcode')) {
      context.handle(_passcodeMeta,
          passcode.isAcceptableOrUnknown(data['passcode']!, _passcodeMeta));
    } else if (isInserting) {
      context.missing(_passcodeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('start_url')) {
      context.handle(_startUrlMeta,
          startUrl.isAcceptableOrUnknown(data['start_url']!, _startUrlMeta));
    } else if (isInserting) {
      context.missing(_startUrlMeta);
    }
    if (data.containsKey('join_url')) {
      context.handle(_joinUrlMeta,
          joinUrl.isAcceptableOrUnknown(data['join_url']!, _joinUrlMeta));
    } else if (isInserting) {
      context.missing(_joinUrlMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LiveSessionEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LiveSessionEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_id'])!,
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lecture_id'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      meetingId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meeting_id'])!,
      startDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}start_date_time'])!,
      agenda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agenda'])!,
      isHostVideoEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_host_video_enabled'])!,
      isParticipantVideoEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_participant_video_enabled'])!,
      durationInMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_minutes'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      passcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}passcode'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      startUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_url'])!,
      joinUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}join_url'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $LiveSessionTableTable createAlias(String alias) {
    return $LiveSessionTableTable(attachedDatabase, alias);
  }
}

class LiveSessionEntry extends DataClass
    implements Insertable<LiveSessionEntry> {
  final String id;
  final String courseId;
  final String lectureId;
  final String topic;
  final String meetingId;
  final DateTime startDateTime;
  final String agenda;
  final bool isHostVideoEnabled;
  final bool isParticipantVideoEnabled;
  final int durationInMinutes;
  final String description;
  final String passcode;
  final String status;
  final String startUrl;
  final String joinUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const LiveSessionEntry(
      {required this.id,
      required this.courseId,
      required this.lectureId,
      required this.topic,
      required this.meetingId,
      required this.startDateTime,
      required this.agenda,
      required this.isHostVideoEnabled,
      required this.isParticipantVideoEnabled,
      required this.durationInMinutes,
      required this.description,
      required this.passcode,
      required this.status,
      required this.startUrl,
      required this.joinUrl,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['course_id'] = Variable<String>(courseId);
    map['lecture_id'] = Variable<String>(lectureId);
    map['topic'] = Variable<String>(topic);
    map['meeting_id'] = Variable<String>(meetingId);
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    map['agenda'] = Variable<String>(agenda);
    map['is_host_video_enabled'] = Variable<bool>(isHostVideoEnabled);
    map['is_participant_video_enabled'] =
        Variable<bool>(isParticipantVideoEnabled);
    map['duration_in_minutes'] = Variable<int>(durationInMinutes);
    map['description'] = Variable<String>(description);
    map['passcode'] = Variable<String>(passcode);
    map['status'] = Variable<String>(status);
    map['start_url'] = Variable<String>(startUrl);
    map['join_url'] = Variable<String>(joinUrl);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  LiveSessionTableCompanion toCompanion(bool nullToAbsent) {
    return LiveSessionTableCompanion(
      id: Value(id),
      courseId: Value(courseId),
      lectureId: Value(lectureId),
      topic: Value(topic),
      meetingId: Value(meetingId),
      startDateTime: Value(startDateTime),
      agenda: Value(agenda),
      isHostVideoEnabled: Value(isHostVideoEnabled),
      isParticipantVideoEnabled: Value(isParticipantVideoEnabled),
      durationInMinutes: Value(durationInMinutes),
      description: Value(description),
      passcode: Value(passcode),
      status: Value(status),
      startUrl: Value(startUrl),
      joinUrl: Value(joinUrl),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory LiveSessionEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LiveSessionEntry(
      id: serializer.fromJson<String>(json['id']),
      courseId: serializer.fromJson<String>(json['courseId']),
      lectureId: serializer.fromJson<String>(json['lectureId']),
      topic: serializer.fromJson<String>(json['topic']),
      meetingId: serializer.fromJson<String>(json['meetingId']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      agenda: serializer.fromJson<String>(json['agenda']),
      isHostVideoEnabled: serializer.fromJson<bool>(json['isHostVideoEnabled']),
      isParticipantVideoEnabled:
          serializer.fromJson<bool>(json['isParticipantVideoEnabled']),
      durationInMinutes: serializer.fromJson<int>(json['durationInMinutes']),
      description: serializer.fromJson<String>(json['description']),
      passcode: serializer.fromJson<String>(json['passcode']),
      status: serializer.fromJson<String>(json['status']),
      startUrl: serializer.fromJson<String>(json['startUrl']),
      joinUrl: serializer.fromJson<String>(json['joinUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'courseId': serializer.toJson<String>(courseId),
      'lectureId': serializer.toJson<String>(lectureId),
      'topic': serializer.toJson<String>(topic),
      'meetingId': serializer.toJson<String>(meetingId),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'agenda': serializer.toJson<String>(agenda),
      'isHostVideoEnabled': serializer.toJson<bool>(isHostVideoEnabled),
      'isParticipantVideoEnabled':
          serializer.toJson<bool>(isParticipantVideoEnabled),
      'durationInMinutes': serializer.toJson<int>(durationInMinutes),
      'description': serializer.toJson<String>(description),
      'passcode': serializer.toJson<String>(passcode),
      'status': serializer.toJson<String>(status),
      'startUrl': serializer.toJson<String>(startUrl),
      'joinUrl': serializer.toJson<String>(joinUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  LiveSessionEntry copyWith(
          {String? id,
          String? courseId,
          String? lectureId,
          String? topic,
          String? meetingId,
          DateTime? startDateTime,
          String? agenda,
          bool? isHostVideoEnabled,
          bool? isParticipantVideoEnabled,
          int? durationInMinutes,
          String? description,
          String? passcode,
          String? status,
          String? startUrl,
          String? joinUrl,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      LiveSessionEntry(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        lectureId: lectureId ?? this.lectureId,
        topic: topic ?? this.topic,
        meetingId: meetingId ?? this.meetingId,
        startDateTime: startDateTime ?? this.startDateTime,
        agenda: agenda ?? this.agenda,
        isHostVideoEnabled: isHostVideoEnabled ?? this.isHostVideoEnabled,
        isParticipantVideoEnabled:
            isParticipantVideoEnabled ?? this.isParticipantVideoEnabled,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        description: description ?? this.description,
        passcode: passcode ?? this.passcode,
        status: status ?? this.status,
        startUrl: startUrl ?? this.startUrl,
        joinUrl: joinUrl ?? this.joinUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  LiveSessionEntry copyWithCompanion(LiveSessionTableCompanion data) {
    return LiveSessionEntry(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      topic: data.topic.present ? data.topic.value : this.topic,
      meetingId: data.meetingId.present ? data.meetingId.value : this.meetingId,
      startDateTime: data.startDateTime.present
          ? data.startDateTime.value
          : this.startDateTime,
      agenda: data.agenda.present ? data.agenda.value : this.agenda,
      isHostVideoEnabled: data.isHostVideoEnabled.present
          ? data.isHostVideoEnabled.value
          : this.isHostVideoEnabled,
      isParticipantVideoEnabled: data.isParticipantVideoEnabled.present
          ? data.isParticipantVideoEnabled.value
          : this.isParticipantVideoEnabled,
      durationInMinutes: data.durationInMinutes.present
          ? data.durationInMinutes.value
          : this.durationInMinutes,
      description:
          data.description.present ? data.description.value : this.description,
      passcode: data.passcode.present ? data.passcode.value : this.passcode,
      status: data.status.present ? data.status.value : this.status,
      startUrl: data.startUrl.present ? data.startUrl.value : this.startUrl,
      joinUrl: data.joinUrl.present ? data.joinUrl.value : this.joinUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LiveSessionEntry(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('lectureId: $lectureId, ')
          ..write('topic: $topic, ')
          ..write('meetingId: $meetingId, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('agenda: $agenda, ')
          ..write('isHostVideoEnabled: $isHostVideoEnabled, ')
          ..write('isParticipantVideoEnabled: $isParticipantVideoEnabled, ')
          ..write('durationInMinutes: $durationInMinutes, ')
          ..write('description: $description, ')
          ..write('passcode: $passcode, ')
          ..write('status: $status, ')
          ..write('startUrl: $startUrl, ')
          ..write('joinUrl: $joinUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      courseId,
      lectureId,
      topic,
      meetingId,
      startDateTime,
      agenda,
      isHostVideoEnabled,
      isParticipantVideoEnabled,
      durationInMinutes,
      description,
      passcode,
      status,
      startUrl,
      joinUrl,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LiveSessionEntry &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.lectureId == this.lectureId &&
          other.topic == this.topic &&
          other.meetingId == this.meetingId &&
          other.startDateTime == this.startDateTime &&
          other.agenda == this.agenda &&
          other.isHostVideoEnabled == this.isHostVideoEnabled &&
          other.isParticipantVideoEnabled == this.isParticipantVideoEnabled &&
          other.durationInMinutes == this.durationInMinutes &&
          other.description == this.description &&
          other.passcode == this.passcode &&
          other.status == this.status &&
          other.startUrl == this.startUrl &&
          other.joinUrl == this.joinUrl &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class LiveSessionTableCompanion extends UpdateCompanion<LiveSessionEntry> {
  final Value<String> id;
  final Value<String> courseId;
  final Value<String> lectureId;
  final Value<String> topic;
  final Value<String> meetingId;
  final Value<DateTime> startDateTime;
  final Value<String> agenda;
  final Value<bool> isHostVideoEnabled;
  final Value<bool> isParticipantVideoEnabled;
  final Value<int> durationInMinutes;
  final Value<String> description;
  final Value<String> passcode;
  final Value<String> status;
  final Value<String> startUrl;
  final Value<String> joinUrl;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const LiveSessionTableCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.topic = const Value.absent(),
    this.meetingId = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.agenda = const Value.absent(),
    this.isHostVideoEnabled = const Value.absent(),
    this.isParticipantVideoEnabled = const Value.absent(),
    this.durationInMinutes = const Value.absent(),
    this.description = const Value.absent(),
    this.passcode = const Value.absent(),
    this.status = const Value.absent(),
    this.startUrl = const Value.absent(),
    this.joinUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LiveSessionTableCompanion.insert({
    required String id,
    required String courseId,
    required String lectureId,
    required String topic,
    required String meetingId,
    required DateTime startDateTime,
    required String agenda,
    required bool isHostVideoEnabled,
    required bool isParticipantVideoEnabled,
    required int durationInMinutes,
    required String description,
    required String passcode,
    required String status,
    required String startUrl,
    required String joinUrl,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        courseId = Value(courseId),
        lectureId = Value(lectureId),
        topic = Value(topic),
        meetingId = Value(meetingId),
        startDateTime = Value(startDateTime),
        agenda = Value(agenda),
        isHostVideoEnabled = Value(isHostVideoEnabled),
        isParticipantVideoEnabled = Value(isParticipantVideoEnabled),
        durationInMinutes = Value(durationInMinutes),
        description = Value(description),
        passcode = Value(passcode),
        status = Value(status),
        startUrl = Value(startUrl),
        joinUrl = Value(joinUrl),
        createdAt = Value(createdAt);
  static Insertable<LiveSessionEntry> custom({
    Expression<String>? id,
    Expression<String>? courseId,
    Expression<String>? lectureId,
    Expression<String>? topic,
    Expression<String>? meetingId,
    Expression<DateTime>? startDateTime,
    Expression<String>? agenda,
    Expression<bool>? isHostVideoEnabled,
    Expression<bool>? isParticipantVideoEnabled,
    Expression<int>? durationInMinutes,
    Expression<String>? description,
    Expression<String>? passcode,
    Expression<String>? status,
    Expression<String>? startUrl,
    Expression<String>? joinUrl,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (lectureId != null) 'lecture_id': lectureId,
      if (topic != null) 'topic': topic,
      if (meetingId != null) 'meeting_id': meetingId,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (agenda != null) 'agenda': agenda,
      if (isHostVideoEnabled != null)
        'is_host_video_enabled': isHostVideoEnabled,
      if (isParticipantVideoEnabled != null)
        'is_participant_video_enabled': isParticipantVideoEnabled,
      if (durationInMinutes != null) 'duration_in_minutes': durationInMinutes,
      if (description != null) 'description': description,
      if (passcode != null) 'passcode': passcode,
      if (status != null) 'status': status,
      if (startUrl != null) 'start_url': startUrl,
      if (joinUrl != null) 'join_url': joinUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LiveSessionTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? courseId,
      Value<String>? lectureId,
      Value<String>? topic,
      Value<String>? meetingId,
      Value<DateTime>? startDateTime,
      Value<String>? agenda,
      Value<bool>? isHostVideoEnabled,
      Value<bool>? isParticipantVideoEnabled,
      Value<int>? durationInMinutes,
      Value<String>? description,
      Value<String>? passcode,
      Value<String>? status,
      Value<String>? startUrl,
      Value<String>? joinUrl,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return LiveSessionTableCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      lectureId: lectureId ?? this.lectureId,
      topic: topic ?? this.topic,
      meetingId: meetingId ?? this.meetingId,
      startDateTime: startDateTime ?? this.startDateTime,
      agenda: agenda ?? this.agenda,
      isHostVideoEnabled: isHostVideoEnabled ?? this.isHostVideoEnabled,
      isParticipantVideoEnabled:
          isParticipantVideoEnabled ?? this.isParticipantVideoEnabled,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      description: description ?? this.description,
      passcode: passcode ?? this.passcode,
      status: status ?? this.status,
      startUrl: startUrl ?? this.startUrl,
      joinUrl: joinUrl ?? this.joinUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<String>(lectureId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (meetingId.present) {
      map['meeting_id'] = Variable<String>(meetingId.value);
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (agenda.present) {
      map['agenda'] = Variable<String>(agenda.value);
    }
    if (isHostVideoEnabled.present) {
      map['is_host_video_enabled'] = Variable<bool>(isHostVideoEnabled.value);
    }
    if (isParticipantVideoEnabled.present) {
      map['is_participant_video_enabled'] =
          Variable<bool>(isParticipantVideoEnabled.value);
    }
    if (durationInMinutes.present) {
      map['duration_in_minutes'] = Variable<int>(durationInMinutes.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (passcode.present) {
      map['passcode'] = Variable<String>(passcode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startUrl.present) {
      map['start_url'] = Variable<String>(startUrl.value);
    }
    if (joinUrl.present) {
      map['join_url'] = Variable<String>(joinUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LiveSessionTableCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('lectureId: $lectureId, ')
          ..write('topic: $topic, ')
          ..write('meetingId: $meetingId, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('agenda: $agenda, ')
          ..write('isHostVideoEnabled: $isHostVideoEnabled, ')
          ..write('isParticipantVideoEnabled: $isParticipantVideoEnabled, ')
          ..write('durationInMinutes: $durationInMinutes, ')
          ..write('description: $description, ')
          ..write('passcode: $passcode, ')
          ..write('status: $status, ')
          ..write('startUrl: $startUrl, ')
          ..write('joinUrl: $joinUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftMtpDatabase extends GeneratedDatabase {
  _$DriftMtpDatabase(QueryExecutor e) : super(e);
  $DriftMtpDatabaseManager get managers => $DriftMtpDatabaseManager(this);
  late final $BlogPostTableTable blogPostTable = $BlogPostTableTable(this);
  late final $BlogPostQueryTableTable blogPostQueryTable =
      $BlogPostQueryTableTable(this);
  late final $BlogPostCommentTableTable blogPostCommentTable =
      $BlogPostCommentTableTable(this);
  late final $BlogPostCategoryTableTable blogPostCategoryTable =
      $BlogPostCategoryTableTable(this);
  late final $CourseAssessmentQuestionTableTable courseAssessmentQuestionTable =
      $CourseAssessmentQuestionTableTable(this);
  late final $CourseCategoryTableTable courseCategoryTable =
      $CourseCategoryTableTable(this);
  late final $CourseTableTable courseTable = $CourseTableTable(this);
  late final $CourseLearnerTableTable courseLearnerTable =
      $CourseLearnerTableTable(this);
  late final $OfflineCourseTableTable offlineCourseTable =
      $OfflineCourseTableTable(this);
  late final $OfflineCourseMediaTableTable offlineCourseMediaTable =
      $OfflineCourseMediaTableTable(this);
  late final $CourseDownloadStatusTableTable courseDownloadStatusTable =
      $CourseDownloadStatusTableTable(this);
  late final $LectureTableTable lectureTable = $LectureTableTable(this);
  late final $LearningActivityTableTable learningActivityTable =
      $LearningActivityTableTable(this);
  late final $LearningSummaryTableTable learningSummaryTable =
      $LearningSummaryTableTable(this);
  late final $LearningQuizTableTable learningQuizTable =
      $LearningQuizTableTable(this);
  late final $UserCourseTableTable userCourseTable =
      $UserCourseTableTable(this);
  late final $LiveSessionTableTable liveSessionTable =
      $LiveSessionTableTable(this);
  late final DriftBlogPostDao driftBlogPostDao =
      DriftBlogPostDao(this as DriftMtpDatabase);
  late final DriftBlogPostCommentDao driftBlogPostCommentDao =
      DriftBlogPostCommentDao(this as DriftMtpDatabase);
  late final DriftBlogPostCategoryDao driftBlogPostCategoryDao =
      DriftBlogPostCategoryDao(this as DriftMtpDatabase);
  late final DriftCourseCategoryDao driftCourseCategoryDao =
      DriftCourseCategoryDao(this as DriftMtpDatabase);
  late final DriftCourseLearnerDao driftCourseLearnerDao =
      DriftCourseLearnerDao(this as DriftMtpDatabase);
  late final DriftOfflineCourseDao driftOfflineCourseDao =
      DriftOfflineCourseDao(this as DriftMtpDatabase);
  late final DriftOfflineCourseMediaDao driftOfflineCourseMediaDao =
      DriftOfflineCourseMediaDao(this as DriftMtpDatabase);
  late final DriftUserCourseDao driftUserCourseDao =
      DriftUserCourseDao(this as DriftMtpDatabase);
  late final DriftLectureDao driftLectureDao =
      DriftLectureDao(this as DriftMtpDatabase);
  late final DriftLearningActivityDao driftLearningActivityDao =
      DriftLearningActivityDao(this as DriftMtpDatabase);
  late final DriftLearningSummaryDao driftLearningSummaryDao =
      DriftLearningSummaryDao(this as DriftMtpDatabase);
  late final DriftCourseDownloadStatusDao driftCourseDownloadStatusDao =
      DriftCourseDownloadStatusDao(this as DriftMtpDatabase);
  late final DriftLearningQuizDao driftLearningQuizDao =
      DriftLearningQuizDao(this as DriftMtpDatabase);
  late final DriftCourseAssessmentQuestionDao driftCourseAssessmentQuestionDao =
      DriftCourseAssessmentQuestionDao(this as DriftMtpDatabase);
  late final DriftLiveSessionDao driftLiveSessionDao =
      DriftLiveSessionDao(this as DriftMtpDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        blogPostTable,
        blogPostQueryTable,
        blogPostCommentTable,
        blogPostCategoryTable,
        courseAssessmentQuestionTable,
        courseCategoryTable,
        courseTable,
        courseLearnerTable,
        offlineCourseTable,
        offlineCourseMediaTable,
        courseDownloadStatusTable,
        lectureTable,
        learningActivityTable,
        learningSummaryTable,
        learningQuizTable,
        userCourseTable,
        liveSessionTable
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$BlogPostTableTableCreateCompanionBuilder = BlogPostTableCompanion
    Function({
  required String id,
  required String slug,
  required String title,
  required String bodyUpper,
  required String blockQuote,
  required String bodyLower,
  required String privacy,
  required int viewCount,
  required int shareCount,
  required String shareLink,
  required int duration,
  required BlogPostDurationUnitEntity durationUnit,
  required ImageUrlEntity imageUrl,
  required String featuredVideo,
  required bool isDisplayVideo,
  required String videoLink,
  Value<UserEntity?> author,
  required bool hasRead,
  required int numberOfReactions,
  required int numberOfComments,
  required int overallScore,
  required bool hasQuiz,
  required List<BlogPostCategoryEntity> categories,
  required List<BlogPostTagEntity> tags,
  Value<ReactionEntity?> currentReaction,
  required List<ReactionEntity> postReactions,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BlogPostTableTableUpdateCompanionBuilder = BlogPostTableCompanion
    Function({
  Value<String> id,
  Value<String> slug,
  Value<String> title,
  Value<String> bodyUpper,
  Value<String> blockQuote,
  Value<String> bodyLower,
  Value<String> privacy,
  Value<int> viewCount,
  Value<int> shareCount,
  Value<String> shareLink,
  Value<int> duration,
  Value<BlogPostDurationUnitEntity> durationUnit,
  Value<ImageUrlEntity> imageUrl,
  Value<String> featuredVideo,
  Value<bool> isDisplayVideo,
  Value<String> videoLink,
  Value<UserEntity?> author,
  Value<bool> hasRead,
  Value<int> numberOfReactions,
  Value<int> numberOfComments,
  Value<int> overallScore,
  Value<bool> hasQuiz,
  Value<List<BlogPostCategoryEntity>> categories,
  Value<List<BlogPostTagEntity>> tags,
  Value<ReactionEntity?> currentReaction,
  Value<List<ReactionEntity>> postReactions,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BlogPostTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostTableTable> {
  $$BlogPostTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bodyUpper => $composableBuilder(
      column: $table.bodyUpper, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get blockQuote => $composableBuilder(
      column: $table.blockQuote, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bodyLower => $composableBuilder(
      column: $table.bodyLower, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get shareCount => $composableBuilder(
      column: $table.shareCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shareLink => $composableBuilder(
      column: $table.shareLink, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<BlogPostDurationUnitEntity,
          BlogPostDurationUnitEntity, String>
      get durationUnit => $composableBuilder(
          column: $table.durationUnit,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ImageUrlEntity, ImageUrlEntity, String>
      get imageUrl => $composableBuilder(
          column: $table.imageUrl,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get featuredVideo => $composableBuilder(
      column: $table.featuredVideo, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoLink => $composableBuilder(
      column: $table.videoLink, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<UserEntity?, UserEntity, String> get author =>
      $composableBuilder(
          column: $table.author,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get hasRead => $composableBuilder(
      column: $table.hasRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfComments => $composableBuilder(
      column: $table.numberOfComments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get overallScore => $composableBuilder(
      column: $table.overallScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasQuiz => $composableBuilder(
      column: $table.hasQuiz, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<BlogPostCategoryEntity>,
          List<BlogPostCategoryEntity>, String>
      get categories => $composableBuilder(
          column: $table.categories,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<BlogPostTagEntity>,
          List<BlogPostTagEntity>, String>
      get tags => $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReactionEntity?, ReactionEntity, String>
      get currentReaction => $composableBuilder(
          column: $table.currentReaction,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<ReactionEntity>, List<ReactionEntity>,
          String>
      get postReactions => $composableBuilder(
          column: $table.postReactions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BlogPostTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostTableTable> {
  $$BlogPostTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bodyUpper => $composableBuilder(
      column: $table.bodyUpper, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blockQuote => $composableBuilder(
      column: $table.blockQuote, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bodyLower => $composableBuilder(
      column: $table.bodyLower, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get shareCount => $composableBuilder(
      column: $table.shareCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shareLink => $composableBuilder(
      column: $table.shareLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get durationUnit => $composableBuilder(
      column: $table.durationUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get featuredVideo => $composableBuilder(
      column: $table.featuredVideo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoLink => $composableBuilder(
      column: $table.videoLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasRead => $composableBuilder(
      column: $table.hasRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfComments => $composableBuilder(
      column: $table.numberOfComments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get overallScore => $composableBuilder(
      column: $table.overallScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasQuiz => $composableBuilder(
      column: $table.hasQuiz, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentReaction => $composableBuilder(
      column: $table.currentReaction,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postReactions => $composableBuilder(
      column: $table.postReactions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BlogPostTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostTableTable> {
  $$BlogPostTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get bodyUpper =>
      $composableBuilder(column: $table.bodyUpper, builder: (column) => column);

  GeneratedColumn<String> get blockQuote => $composableBuilder(
      column: $table.blockQuote, builder: (column) => column);

  GeneratedColumn<String> get bodyLower =>
      $composableBuilder(column: $table.bodyLower, builder: (column) => column);

  GeneratedColumn<String> get privacy =>
      $composableBuilder(column: $table.privacy, builder: (column) => column);

  GeneratedColumn<int> get viewCount =>
      $composableBuilder(column: $table.viewCount, builder: (column) => column);

  GeneratedColumn<int> get shareCount => $composableBuilder(
      column: $table.shareCount, builder: (column) => column);

  GeneratedColumn<String> get shareLink =>
      $composableBuilder(column: $table.shareLink, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BlogPostDurationUnitEntity, String>
      get durationUnit => $composableBuilder(
          column: $table.durationUnit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ImageUrlEntity, String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get featuredVideo => $composableBuilder(
      column: $table.featuredVideo, builder: (column) => column);

  GeneratedColumn<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo, builder: (column) => column);

  GeneratedColumn<String> get videoLink =>
      $composableBuilder(column: $table.videoLink, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserEntity?, String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<bool> get hasRead =>
      $composableBuilder(column: $table.hasRead, builder: (column) => column);

  GeneratedColumn<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions, builder: (column) => column);

  GeneratedColumn<int> get numberOfComments => $composableBuilder(
      column: $table.numberOfComments, builder: (column) => column);

  GeneratedColumn<int> get overallScore => $composableBuilder(
      column: $table.overallScore, builder: (column) => column);

  GeneratedColumn<bool> get hasQuiz =>
      $composableBuilder(column: $table.hasQuiz, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<BlogPostCategoryEntity>, String>
      get categories => $composableBuilder(
          column: $table.categories, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<BlogPostTagEntity>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReactionEntity?, String>
      get currentReaction => $composableBuilder(
          column: $table.currentReaction, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ReactionEntity>, String>
      get postReactions => $composableBuilder(
          column: $table.postReactions, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BlogPostTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $BlogPostTableTable,
    BlogPostEntry,
    $$BlogPostTableTableFilterComposer,
    $$BlogPostTableTableOrderingComposer,
    $$BlogPostTableTableAnnotationComposer,
    $$BlogPostTableTableCreateCompanionBuilder,
    $$BlogPostTableTableUpdateCompanionBuilder,
    (
      BlogPostEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostTableTable, BlogPostEntry>
    ),
    BlogPostEntry,
    PrefetchHooks Function()> {
  $$BlogPostTableTableTableManager(
      _$DriftMtpDatabase db, $BlogPostTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlogPostTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlogPostTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlogPostTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> slug = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> bodyUpper = const Value.absent(),
            Value<String> blockQuote = const Value.absent(),
            Value<String> bodyLower = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<int> shareCount = const Value.absent(),
            Value<String> shareLink = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<BlogPostDurationUnitEntity> durationUnit =
                const Value.absent(),
            Value<ImageUrlEntity> imageUrl = const Value.absent(),
            Value<String> featuredVideo = const Value.absent(),
            Value<bool> isDisplayVideo = const Value.absent(),
            Value<String> videoLink = const Value.absent(),
            Value<UserEntity?> author = const Value.absent(),
            Value<bool> hasRead = const Value.absent(),
            Value<int> numberOfReactions = const Value.absent(),
            Value<int> numberOfComments = const Value.absent(),
            Value<int> overallScore = const Value.absent(),
            Value<bool> hasQuiz = const Value.absent(),
            Value<List<BlogPostCategoryEntity>> categories =
                const Value.absent(),
            Value<List<BlogPostTagEntity>> tags = const Value.absent(),
            Value<ReactionEntity?> currentReaction = const Value.absent(),
            Value<List<ReactionEntity>> postReactions = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostTableCompanion(
            id: id,
            slug: slug,
            title: title,
            bodyUpper: bodyUpper,
            blockQuote: blockQuote,
            bodyLower: bodyLower,
            privacy: privacy,
            viewCount: viewCount,
            shareCount: shareCount,
            shareLink: shareLink,
            duration: duration,
            durationUnit: durationUnit,
            imageUrl: imageUrl,
            featuredVideo: featuredVideo,
            isDisplayVideo: isDisplayVideo,
            videoLink: videoLink,
            author: author,
            hasRead: hasRead,
            numberOfReactions: numberOfReactions,
            numberOfComments: numberOfComments,
            overallScore: overallScore,
            hasQuiz: hasQuiz,
            categories: categories,
            tags: tags,
            currentReaction: currentReaction,
            postReactions: postReactions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String slug,
            required String title,
            required String bodyUpper,
            required String blockQuote,
            required String bodyLower,
            required String privacy,
            required int viewCount,
            required int shareCount,
            required String shareLink,
            required int duration,
            required BlogPostDurationUnitEntity durationUnit,
            required ImageUrlEntity imageUrl,
            required String featuredVideo,
            required bool isDisplayVideo,
            required String videoLink,
            Value<UserEntity?> author = const Value.absent(),
            required bool hasRead,
            required int numberOfReactions,
            required int numberOfComments,
            required int overallScore,
            required bool hasQuiz,
            required List<BlogPostCategoryEntity> categories,
            required List<BlogPostTagEntity> tags,
            Value<ReactionEntity?> currentReaction = const Value.absent(),
            required List<ReactionEntity> postReactions,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostTableCompanion.insert(
            id: id,
            slug: slug,
            title: title,
            bodyUpper: bodyUpper,
            blockQuote: blockQuote,
            bodyLower: bodyLower,
            privacy: privacy,
            viewCount: viewCount,
            shareCount: shareCount,
            shareLink: shareLink,
            duration: duration,
            durationUnit: durationUnit,
            imageUrl: imageUrl,
            featuredVideo: featuredVideo,
            isDisplayVideo: isDisplayVideo,
            videoLink: videoLink,
            author: author,
            hasRead: hasRead,
            numberOfReactions: numberOfReactions,
            numberOfComments: numberOfComments,
            overallScore: overallScore,
            hasQuiz: hasQuiz,
            categories: categories,
            tags: tags,
            currentReaction: currentReaction,
            postReactions: postReactions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BlogPostTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $BlogPostTableTable,
    BlogPostEntry,
    $$BlogPostTableTableFilterComposer,
    $$BlogPostTableTableOrderingComposer,
    $$BlogPostTableTableAnnotationComposer,
    $$BlogPostTableTableCreateCompanionBuilder,
    $$BlogPostTableTableUpdateCompanionBuilder,
    (
      BlogPostEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostTableTable, BlogPostEntry>
    ),
    BlogPostEntry,
    PrefetchHooks Function()>;
typedef $$BlogPostQueryTableTableCreateCompanionBuilder
    = BlogPostQueryTableCompanion Function({
  required String query,
  required List<String> ids,
  Value<int> rowid,
});
typedef $$BlogPostQueryTableTableUpdateCompanionBuilder
    = BlogPostQueryTableCompanion Function({
  Value<String> query,
  Value<List<String>> ids,
  Value<int> rowid,
});

class $$BlogPostQueryTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostQueryTableTable> {
  $$BlogPostQueryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get ids =>
      $composableBuilder(
          column: $table.ids,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$BlogPostQueryTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostQueryTableTable> {
  $$BlogPostQueryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ids => $composableBuilder(
      column: $table.ids, builder: (column) => ColumnOrderings(column));
}

class $$BlogPostQueryTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostQueryTableTable> {
  $$BlogPostQueryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get ids =>
      $composableBuilder(column: $table.ids, builder: (column) => column);
}

class $$BlogPostQueryTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $BlogPostQueryTableTable,
    BlogPostQueryEntry,
    $$BlogPostQueryTableTableFilterComposer,
    $$BlogPostQueryTableTableOrderingComposer,
    $$BlogPostQueryTableTableAnnotationComposer,
    $$BlogPostQueryTableTableCreateCompanionBuilder,
    $$BlogPostQueryTableTableUpdateCompanionBuilder,
    (
      BlogPostQueryEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostQueryTableTable,
          BlogPostQueryEntry>
    ),
    BlogPostQueryEntry,
    PrefetchHooks Function()> {
  $$BlogPostQueryTableTableTableManager(
      _$DriftMtpDatabase db, $BlogPostQueryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlogPostQueryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlogPostQueryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlogPostQueryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> query = const Value.absent(),
            Value<List<String>> ids = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostQueryTableCompanion(
            query: query,
            ids: ids,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String query,
            required List<String> ids,
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostQueryTableCompanion.insert(
            query: query,
            ids: ids,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BlogPostQueryTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $BlogPostQueryTableTable,
    BlogPostQueryEntry,
    $$BlogPostQueryTableTableFilterComposer,
    $$BlogPostQueryTableTableOrderingComposer,
    $$BlogPostQueryTableTableAnnotationComposer,
    $$BlogPostQueryTableTableCreateCompanionBuilder,
    $$BlogPostQueryTableTableUpdateCompanionBuilder,
    (
      BlogPostQueryEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostQueryTableTable,
          BlogPostQueryEntry>
    ),
    BlogPostQueryEntry,
    PrefetchHooks Function()>;
typedef $$BlogPostCommentTableTableCreateCompanionBuilder
    = BlogPostCommentTableCompanion Function({
  required String id,
  required String postId,
  required String comment,
  Value<UserEntity?> user,
  Value<ReactionEntity?> currentReaction,
  required String imageUrl,
  required String videoUrl,
  required int replyCount,
  required int numberOfReactions,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BlogPostCommentTableTableUpdateCompanionBuilder
    = BlogPostCommentTableCompanion Function({
  Value<String> id,
  Value<String> postId,
  Value<String> comment,
  Value<UserEntity?> user,
  Value<ReactionEntity?> currentReaction,
  Value<String> imageUrl,
  Value<String> videoUrl,
  Value<int> replyCount,
  Value<int> numberOfReactions,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BlogPostCommentTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCommentTableTable> {
  $$BlogPostCommentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postId => $composableBuilder(
      column: $table.postId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<UserEntity?, UserEntity, String> get user =>
      $composableBuilder(
          column: $table.user,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReactionEntity?, ReactionEntity, String>
      get currentReaction => $composableBuilder(
          column: $table.currentReaction,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BlogPostCommentTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCommentTableTable> {
  $$BlogPostCommentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postId => $composableBuilder(
      column: $table.postId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user => $composableBuilder(
      column: $table.user, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentReaction => $composableBuilder(
      column: $table.currentReaction,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BlogPostCommentTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCommentTableTable> {
  $$BlogPostCommentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserEntity?, String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReactionEntity?, String>
      get currentReaction => $composableBuilder(
          column: $table.currentReaction, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => column);

  GeneratedColumn<int> get numberOfReactions => $composableBuilder(
      column: $table.numberOfReactions, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BlogPostCommentTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $BlogPostCommentTableTable,
    BlogPostCommentEntry,
    $$BlogPostCommentTableTableFilterComposer,
    $$BlogPostCommentTableTableOrderingComposer,
    $$BlogPostCommentTableTableAnnotationComposer,
    $$BlogPostCommentTableTableCreateCompanionBuilder,
    $$BlogPostCommentTableTableUpdateCompanionBuilder,
    (
      BlogPostCommentEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostCommentTableTable,
          BlogPostCommentEntry>
    ),
    BlogPostCommentEntry,
    PrefetchHooks Function()> {
  $$BlogPostCommentTableTableTableManager(
      _$DriftMtpDatabase db, $BlogPostCommentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlogPostCommentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlogPostCommentTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlogPostCommentTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> postId = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<UserEntity?> user = const Value.absent(),
            Value<ReactionEntity?> currentReaction = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> videoUrl = const Value.absent(),
            Value<int> replyCount = const Value.absent(),
            Value<int> numberOfReactions = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostCommentTableCompanion(
            id: id,
            postId: postId,
            comment: comment,
            user: user,
            currentReaction: currentReaction,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            replyCount: replyCount,
            numberOfReactions: numberOfReactions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String postId,
            required String comment,
            Value<UserEntity?> user = const Value.absent(),
            Value<ReactionEntity?> currentReaction = const Value.absent(),
            required String imageUrl,
            required String videoUrl,
            required int replyCount,
            required int numberOfReactions,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostCommentTableCompanion.insert(
            id: id,
            postId: postId,
            comment: comment,
            user: user,
            currentReaction: currentReaction,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            replyCount: replyCount,
            numberOfReactions: numberOfReactions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BlogPostCommentTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $BlogPostCommentTableTable,
        BlogPostCommentEntry,
        $$BlogPostCommentTableTableFilterComposer,
        $$BlogPostCommentTableTableOrderingComposer,
        $$BlogPostCommentTableTableAnnotationComposer,
        $$BlogPostCommentTableTableCreateCompanionBuilder,
        $$BlogPostCommentTableTableUpdateCompanionBuilder,
        (
          BlogPostCommentEntry,
          BaseReferences<_$DriftMtpDatabase, $BlogPostCommentTableTable,
              BlogPostCommentEntry>
        ),
        BlogPostCommentEntry,
        PrefetchHooks Function()>;
typedef $$BlogPostCategoryTableTableCreateCompanionBuilder
    = BlogPostCategoryTableCompanion Function({
  required String id,
  required String name,
  required bool active,
  required int numberOfArticles,
  required int numberOfPublicArticles,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BlogPostCategoryTableTableUpdateCompanionBuilder
    = BlogPostCategoryTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<bool> active,
  Value<int> numberOfArticles,
  Value<int> numberOfPublicArticles,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BlogPostCategoryTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCategoryTableTable> {
  $$BlogPostCategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfArticles => $composableBuilder(
      column: $table.numberOfArticles,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfPublicArticles => $composableBuilder(
      column: $table.numberOfPublicArticles,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BlogPostCategoryTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCategoryTableTable> {
  $$BlogPostCategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfArticles => $composableBuilder(
      column: $table.numberOfArticles,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfPublicArticles => $composableBuilder(
      column: $table.numberOfPublicArticles,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BlogPostCategoryTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $BlogPostCategoryTableTable> {
  $$BlogPostCategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get numberOfArticles => $composableBuilder(
      column: $table.numberOfArticles, builder: (column) => column);

  GeneratedColumn<int> get numberOfPublicArticles => $composableBuilder(
      column: $table.numberOfPublicArticles, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BlogPostCategoryTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $BlogPostCategoryTableTable,
    BlogPostCategoryEntry,
    $$BlogPostCategoryTableTableFilterComposer,
    $$BlogPostCategoryTableTableOrderingComposer,
    $$BlogPostCategoryTableTableAnnotationComposer,
    $$BlogPostCategoryTableTableCreateCompanionBuilder,
    $$BlogPostCategoryTableTableUpdateCompanionBuilder,
    (
      BlogPostCategoryEntry,
      BaseReferences<_$DriftMtpDatabase, $BlogPostCategoryTableTable,
          BlogPostCategoryEntry>
    ),
    BlogPostCategoryEntry,
    PrefetchHooks Function()> {
  $$BlogPostCategoryTableTableTableManager(
      _$DriftMtpDatabase db, $BlogPostCategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlogPostCategoryTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$BlogPostCategoryTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlogPostCategoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<int> numberOfArticles = const Value.absent(),
            Value<int> numberOfPublicArticles = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostCategoryTableCompanion(
            id: id,
            name: name,
            active: active,
            numberOfArticles: numberOfArticles,
            numberOfPublicArticles: numberOfPublicArticles,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required bool active,
            required int numberOfArticles,
            required int numberOfPublicArticles,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BlogPostCategoryTableCompanion.insert(
            id: id,
            name: name,
            active: active,
            numberOfArticles: numberOfArticles,
            numberOfPublicArticles: numberOfPublicArticles,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BlogPostCategoryTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $BlogPostCategoryTableTable,
        BlogPostCategoryEntry,
        $$BlogPostCategoryTableTableFilterComposer,
        $$BlogPostCategoryTableTableOrderingComposer,
        $$BlogPostCategoryTableTableAnnotationComposer,
        $$BlogPostCategoryTableTableCreateCompanionBuilder,
        $$BlogPostCategoryTableTableUpdateCompanionBuilder,
        (
          BlogPostCategoryEntry,
          BaseReferences<_$DriftMtpDatabase, $BlogPostCategoryTableTable,
              BlogPostCategoryEntry>
        ),
        BlogPostCategoryEntry,
        PrefetchHooks Function()>;
typedef $$CourseAssessmentQuestionTableTableCreateCompanionBuilder
    = CourseAssessmentQuestionTableCompanion Function({
  required String id,
  required String courseId,
  required String question,
  required List<String> options,
  required List<String> correctAnswers,
  required int order,
  required AssessmentQuestionTypeEntity type,
  required AssessmentQuestionPassingOptionEntity passingOption,
  Value<AssessmentUserAnswerEntity?> userAnswer,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CourseAssessmentQuestionTableTableUpdateCompanionBuilder
    = CourseAssessmentQuestionTableCompanion Function({
  Value<String> id,
  Value<String> courseId,
  Value<String> question,
  Value<List<String>> options,
  Value<List<String>> correctAnswers,
  Value<int> order,
  Value<AssessmentQuestionTypeEntity> type,
  Value<AssessmentQuestionPassingOptionEntity> passingOption,
  Value<AssessmentUserAnswerEntity?> userAnswer,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CourseAssessmentQuestionTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $CourseAssessmentQuestionTableTable> {
  $$CourseAssessmentQuestionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get options => $composableBuilder(
          column: $table.options,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get correctAnswers => $composableBuilder(
          column: $table.correctAnswers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AssessmentQuestionTypeEntity,
          AssessmentQuestionTypeEntity, String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<AssessmentQuestionPassingOptionEntity,
          AssessmentQuestionPassingOptionEntity, String>
      get passingOption => $composableBuilder(
          column: $table.passingOption,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<AssessmentUserAnswerEntity?,
          AssessmentUserAnswerEntity, String>
      get userAnswer => $composableBuilder(
          column: $table.userAnswer,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CourseAssessmentQuestionTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $CourseAssessmentQuestionTableTable> {
  $$CourseAssessmentQuestionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passingOption => $composableBuilder(
      column: $table.passingOption,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CourseAssessmentQuestionTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $CourseAssessmentQuestionTableTable> {
  $$CourseAssessmentQuestionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get correctAnswers =>
      $composableBuilder(
          column: $table.correctAnswers, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentQuestionTypeEntity, String>
      get type =>
          $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentQuestionPassingOptionEntity,
          String>
      get passingOption => $composableBuilder(
          column: $table.passingOption, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentUserAnswerEntity?, String>
      get userAnswer => $composableBuilder(
          column: $table.userAnswer, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CourseAssessmentQuestionTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $CourseAssessmentQuestionTableTable,
    CourseAssessmentQuestionEntry,
    $$CourseAssessmentQuestionTableTableFilterComposer,
    $$CourseAssessmentQuestionTableTableOrderingComposer,
    $$CourseAssessmentQuestionTableTableAnnotationComposer,
    $$CourseAssessmentQuestionTableTableCreateCompanionBuilder,
    $$CourseAssessmentQuestionTableTableUpdateCompanionBuilder,
    (
      CourseAssessmentQuestionEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseAssessmentQuestionTableTable,
          CourseAssessmentQuestionEntry>
    ),
    CourseAssessmentQuestionEntry,
    PrefetchHooks Function()> {
  $$CourseAssessmentQuestionTableTableTableManager(
      _$DriftMtpDatabase db, $CourseAssessmentQuestionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseAssessmentQuestionTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseAssessmentQuestionTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseAssessmentQuestionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<List<String>> options = const Value.absent(),
            Value<List<String>> correctAnswers = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<AssessmentQuestionTypeEntity> type = const Value.absent(),
            Value<AssessmentQuestionPassingOptionEntity> passingOption =
                const Value.absent(),
            Value<AssessmentUserAnswerEntity?> userAnswer =
                const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseAssessmentQuestionTableCompanion(
            id: id,
            courseId: courseId,
            question: question,
            options: options,
            correctAnswers: correctAnswers,
            order: order,
            type: type,
            passingOption: passingOption,
            userAnswer: userAnswer,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String courseId,
            required String question,
            required List<String> options,
            required List<String> correctAnswers,
            required int order,
            required AssessmentQuestionTypeEntity type,
            required AssessmentQuestionPassingOptionEntity passingOption,
            Value<AssessmentUserAnswerEntity?> userAnswer =
                const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseAssessmentQuestionTableCompanion.insert(
            id: id,
            courseId: courseId,
            question: question,
            options: options,
            correctAnswers: correctAnswers,
            order: order,
            type: type,
            passingOption: passingOption,
            userAnswer: userAnswer,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CourseAssessmentQuestionTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $CourseAssessmentQuestionTableTable,
        CourseAssessmentQuestionEntry,
        $$CourseAssessmentQuestionTableTableFilterComposer,
        $$CourseAssessmentQuestionTableTableOrderingComposer,
        $$CourseAssessmentQuestionTableTableAnnotationComposer,
        $$CourseAssessmentQuestionTableTableCreateCompanionBuilder,
        $$CourseAssessmentQuestionTableTableUpdateCompanionBuilder,
        (
          CourseAssessmentQuestionEntry,
          BaseReferences<
              _$DriftMtpDatabase,
              $CourseAssessmentQuestionTableTable,
              CourseAssessmentQuestionEntry>
        ),
        CourseAssessmentQuestionEntry,
        PrefetchHooks Function()>;
typedef $$CourseCategoryTableTableCreateCompanionBuilder
    = CourseCategoryTableCompanion Function({
  required String id,
  required String name,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$CourseCategoryTableTableUpdateCompanionBuilder
    = CourseCategoryTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CourseCategoryTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $CourseCategoryTableTable> {
  $$CourseCategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CourseCategoryTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $CourseCategoryTableTable> {
  $$CourseCategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CourseCategoryTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $CourseCategoryTableTable> {
  $$CourseCategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CourseCategoryTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $CourseCategoryTableTable,
    CourseCategoryEntry,
    $$CourseCategoryTableTableFilterComposer,
    $$CourseCategoryTableTableOrderingComposer,
    $$CourseCategoryTableTableAnnotationComposer,
    $$CourseCategoryTableTableCreateCompanionBuilder,
    $$CourseCategoryTableTableUpdateCompanionBuilder,
    (
      CourseCategoryEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseCategoryTableTable,
          CourseCategoryEntry>
    ),
    CourseCategoryEntry,
    PrefetchHooks Function()> {
  $$CourseCategoryTableTableTableManager(
      _$DriftMtpDatabase db, $CourseCategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseCategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseCategoryTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseCategoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseCategoryTableCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseCategoryTableCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CourseCategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $CourseCategoryTableTable,
    CourseCategoryEntry,
    $$CourseCategoryTableTableFilterComposer,
    $$CourseCategoryTableTableOrderingComposer,
    $$CourseCategoryTableTableAnnotationComposer,
    $$CourseCategoryTableTableCreateCompanionBuilder,
    $$CourseCategoryTableTableUpdateCompanionBuilder,
    (
      CourseCategoryEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseCategoryTableTable,
          CourseCategoryEntry>
    ),
    CourseCategoryEntry,
    PrefetchHooks Function()>;
typedef $$CourseTableTableCreateCompanionBuilder = CourseTableCompanion
    Function({
  required String id,
  required String title,
  required String description,
  required String objective,
  required String learningOutcome,
  required ImageUrlEntity coverImage,
  required String urlLink,
  required bool isDisplayVideo,
  required String videoUrl,
  required List<CourseCategoryEntity> categories,
  required CourseDownloadableOptionEntity downloadableOption,
  required CourseLevelEntity courseLevel,
  required CourseTypeEntity courseType,
  required bool isAllowFeedback,
  required bool isAllowDiscussion,
  Value<CourseDiscussionEntity?> discussion,
  required int acceptableScoreForAssignment,
  required int acceptableScoreForAssessment,
  required CourseDurationEntity estimatedDuration,
  required int numberOfEnrollments,
  required int totalLectures,
  required int totalQuizzes,
  required int viewCount,
  required double rating,
  required CourseMaterialOrderTypeEntity courseOrderType,
  required CourseMaterialOrderTypeEntity lectureOrderType,
  required List<CourseMaterialEntity> courseOrder,
  required Map<String, List<String>> lectureOrderByLectureId,
  required String evaluationMessage,
  required bool isXApiCourse,
  required String resourceFileUrl,
  required bool hasUserTakenCourse,
  required bool isUserCanAccessCourse,
  Value<UserEntity?> createdBy,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CourseTableTableUpdateCompanionBuilder = CourseTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<String> objective,
  Value<String> learningOutcome,
  Value<ImageUrlEntity> coverImage,
  Value<String> urlLink,
  Value<bool> isDisplayVideo,
  Value<String> videoUrl,
  Value<List<CourseCategoryEntity>> categories,
  Value<CourseDownloadableOptionEntity> downloadableOption,
  Value<CourseLevelEntity> courseLevel,
  Value<CourseTypeEntity> courseType,
  Value<bool> isAllowFeedback,
  Value<bool> isAllowDiscussion,
  Value<CourseDiscussionEntity?> discussion,
  Value<int> acceptableScoreForAssignment,
  Value<int> acceptableScoreForAssessment,
  Value<CourseDurationEntity> estimatedDuration,
  Value<int> numberOfEnrollments,
  Value<int> totalLectures,
  Value<int> totalQuizzes,
  Value<int> viewCount,
  Value<double> rating,
  Value<CourseMaterialOrderTypeEntity> courseOrderType,
  Value<CourseMaterialOrderTypeEntity> lectureOrderType,
  Value<List<CourseMaterialEntity>> courseOrder,
  Value<Map<String, List<String>>> lectureOrderByLectureId,
  Value<String> evaluationMessage,
  Value<bool> isXApiCourse,
  Value<String> resourceFileUrl,
  Value<bool> hasUserTakenCourse,
  Value<bool> isUserCanAccessCourse,
  Value<UserEntity?> createdBy,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CourseTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $CourseTableTable> {
  $$CourseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get objective => $composableBuilder(
      column: $table.objective, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get learningOutcome => $composableBuilder(
      column: $table.learningOutcome,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ImageUrlEntity, ImageUrlEntity, String>
      get coverImage => $composableBuilder(
          column: $table.coverImage,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get urlLink => $composableBuilder(
      column: $table.urlLink, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<CourseCategoryEntity>,
          List<CourseCategoryEntity>, String>
      get categories => $composableBuilder(
          column: $table.categories,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CourseDownloadableOptionEntity,
          CourseDownloadableOptionEntity, String>
      get downloadableOption => $composableBuilder(
          column: $table.downloadableOption,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CourseLevelEntity, CourseLevelEntity, String>
      get courseLevel => $composableBuilder(
          column: $table.courseLevel,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CourseTypeEntity, CourseTypeEntity, String>
      get courseType => $composableBuilder(
          column: $table.courseType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isAllowFeedback => $composableBuilder(
      column: $table.isAllowFeedback,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAllowDiscussion => $composableBuilder(
      column: $table.isAllowDiscussion,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CourseDiscussionEntity?,
          CourseDiscussionEntity, String>
      get discussion => $composableBuilder(
          column: $table.discussion,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get acceptableScoreForAssignment => $composableBuilder(
      column: $table.acceptableScoreForAssignment,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get acceptableScoreForAssessment => $composableBuilder(
      column: $table.acceptableScoreForAssessment,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CourseDurationEntity, CourseDurationEntity,
          String>
      get estimatedDuration => $composableBuilder(
          column: $table.estimatedDuration,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get numberOfEnrollments => $composableBuilder(
      column: $table.numberOfEnrollments,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalLectures => $composableBuilder(
      column: $table.totalLectures, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalQuizzes => $composableBuilder(
      column: $table.totalQuizzes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CourseMaterialOrderTypeEntity,
          CourseMaterialOrderTypeEntity, String>
      get courseOrderType => $composableBuilder(
          column: $table.courseOrderType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CourseMaterialOrderTypeEntity,
          CourseMaterialOrderTypeEntity, String>
      get lectureOrderType => $composableBuilder(
          column: $table.lectureOrderType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<CourseMaterialEntity>,
          List<CourseMaterialEntity>, String>
      get courseOrder => $composableBuilder(
          column: $table.courseOrder,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, List<String>>,
          Map<String, List<String>>, String>
      get lectureOrderByLectureId => $composableBuilder(
          column: $table.lectureOrderByLectureId,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get evaluationMessage => $composableBuilder(
      column: $table.evaluationMessage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isXApiCourse => $composableBuilder(
      column: $table.isXApiCourse, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceFileUrl => $composableBuilder(
      column: $table.resourceFileUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasUserTakenCourse => $composableBuilder(
      column: $table.hasUserTakenCourse,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isUserCanAccessCourse => $composableBuilder(
      column: $table.isUserCanAccessCourse,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<UserEntity?, UserEntity, String>
      get createdBy => $composableBuilder(
          column: $table.createdBy,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CourseTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $CourseTableTable> {
  $$CourseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get objective => $composableBuilder(
      column: $table.objective, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get learningOutcome => $composableBuilder(
      column: $table.learningOutcome,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImage => $composableBuilder(
      column: $table.coverImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlLink => $composableBuilder(
      column: $table.urlLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get downloadableOption => $composableBuilder(
      column: $table.downloadableOption,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseLevel => $composableBuilder(
      column: $table.courseLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseType => $composableBuilder(
      column: $table.courseType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAllowFeedback => $composableBuilder(
      column: $table.isAllowFeedback,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAllowDiscussion => $composableBuilder(
      column: $table.isAllowDiscussion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discussion => $composableBuilder(
      column: $table.discussion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get acceptableScoreForAssignment => $composableBuilder(
      column: $table.acceptableScoreForAssignment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get acceptableScoreForAssessment => $composableBuilder(
      column: $table.acceptableScoreForAssessment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get estimatedDuration => $composableBuilder(
      column: $table.estimatedDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfEnrollments => $composableBuilder(
      column: $table.numberOfEnrollments,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalLectures => $composableBuilder(
      column: $table.totalLectures,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalQuizzes => $composableBuilder(
      column: $table.totalQuizzes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseOrderType => $composableBuilder(
      column: $table.courseOrderType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureOrderType => $composableBuilder(
      column: $table.lectureOrderType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseOrder => $composableBuilder(
      column: $table.courseOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureOrderByLectureId => $composableBuilder(
      column: $table.lectureOrderByLectureId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evaluationMessage => $composableBuilder(
      column: $table.evaluationMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isXApiCourse => $composableBuilder(
      column: $table.isXApiCourse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceFileUrl => $composableBuilder(
      column: $table.resourceFileUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasUserTakenCourse => $composableBuilder(
      column: $table.hasUserTakenCourse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isUserCanAccessCourse => $composableBuilder(
      column: $table.isUserCanAccessCourse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CourseTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $CourseTableTable> {
  $$CourseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get objective =>
      $composableBuilder(column: $table.objective, builder: (column) => column);

  GeneratedColumn<String> get learningOutcome => $composableBuilder(
      column: $table.learningOutcome, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ImageUrlEntity, String> get coverImage =>
      $composableBuilder(
          column: $table.coverImage, builder: (column) => column);

  GeneratedColumn<String> get urlLink =>
      $composableBuilder(column: $table.urlLink, builder: (column) => column);

  GeneratedColumn<bool> get isDisplayVideo => $composableBuilder(
      column: $table.isDisplayVideo, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<CourseCategoryEntity>, String>
      get categories => $composableBuilder(
          column: $table.categories, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseDownloadableOptionEntity, String>
      get downloadableOption => $composableBuilder(
          column: $table.downloadableOption, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseLevelEntity, String> get courseLevel =>
      $composableBuilder(
          column: $table.courseLevel, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseTypeEntity, String> get courseType =>
      $composableBuilder(
          column: $table.courseType, builder: (column) => column);

  GeneratedColumn<bool> get isAllowFeedback => $composableBuilder(
      column: $table.isAllowFeedback, builder: (column) => column);

  GeneratedColumn<bool> get isAllowDiscussion => $composableBuilder(
      column: $table.isAllowDiscussion, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseDiscussionEntity?, String>
      get discussion => $composableBuilder(
          column: $table.discussion, builder: (column) => column);

  GeneratedColumn<int> get acceptableScoreForAssignment => $composableBuilder(
      column: $table.acceptableScoreForAssignment, builder: (column) => column);

  GeneratedColumn<int> get acceptableScoreForAssessment => $composableBuilder(
      column: $table.acceptableScoreForAssessment, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseDurationEntity, String>
      get estimatedDuration => $composableBuilder(
          column: $table.estimatedDuration, builder: (column) => column);

  GeneratedColumn<int> get numberOfEnrollments => $composableBuilder(
      column: $table.numberOfEnrollments, builder: (column) => column);

  GeneratedColumn<int> get totalLectures => $composableBuilder(
      column: $table.totalLectures, builder: (column) => column);

  GeneratedColumn<int> get totalQuizzes => $composableBuilder(
      column: $table.totalQuizzes, builder: (column) => column);

  GeneratedColumn<int> get viewCount =>
      $composableBuilder(column: $table.viewCount, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseMaterialOrderTypeEntity, String>
      get courseOrderType => $composableBuilder(
          column: $table.courseOrderType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseMaterialOrderTypeEntity, String>
      get lectureOrderType => $composableBuilder(
          column: $table.lectureOrderType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<CourseMaterialEntity>, String>
      get courseOrder => $composableBuilder(
          column: $table.courseOrder, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, List<String>>, String>
      get lectureOrderByLectureId => $composableBuilder(
          column: $table.lectureOrderByLectureId, builder: (column) => column);

  GeneratedColumn<String> get evaluationMessage => $composableBuilder(
      column: $table.evaluationMessage, builder: (column) => column);

  GeneratedColumn<bool> get isXApiCourse => $composableBuilder(
      column: $table.isXApiCourse, builder: (column) => column);

  GeneratedColumn<String> get resourceFileUrl => $composableBuilder(
      column: $table.resourceFileUrl, builder: (column) => column);

  GeneratedColumn<bool> get hasUserTakenCourse => $composableBuilder(
      column: $table.hasUserTakenCourse, builder: (column) => column);

  GeneratedColumn<bool> get isUserCanAccessCourse => $composableBuilder(
      column: $table.isUserCanAccessCourse, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserEntity?, String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CourseTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $CourseTableTable,
    CourseEntry,
    $$CourseTableTableFilterComposer,
    $$CourseTableTableOrderingComposer,
    $$CourseTableTableAnnotationComposer,
    $$CourseTableTableCreateCompanionBuilder,
    $$CourseTableTableUpdateCompanionBuilder,
    (
      CourseEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseTableTable, CourseEntry>
    ),
    CourseEntry,
    PrefetchHooks Function()> {
  $$CourseTableTableTableManager(_$DriftMtpDatabase db, $CourseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> objective = const Value.absent(),
            Value<String> learningOutcome = const Value.absent(),
            Value<ImageUrlEntity> coverImage = const Value.absent(),
            Value<String> urlLink = const Value.absent(),
            Value<bool> isDisplayVideo = const Value.absent(),
            Value<String> videoUrl = const Value.absent(),
            Value<List<CourseCategoryEntity>> categories = const Value.absent(),
            Value<CourseDownloadableOptionEntity> downloadableOption =
                const Value.absent(),
            Value<CourseLevelEntity> courseLevel = const Value.absent(),
            Value<CourseTypeEntity> courseType = const Value.absent(),
            Value<bool> isAllowFeedback = const Value.absent(),
            Value<bool> isAllowDiscussion = const Value.absent(),
            Value<CourseDiscussionEntity?> discussion = const Value.absent(),
            Value<int> acceptableScoreForAssignment = const Value.absent(),
            Value<int> acceptableScoreForAssessment = const Value.absent(),
            Value<CourseDurationEntity> estimatedDuration =
                const Value.absent(),
            Value<int> numberOfEnrollments = const Value.absent(),
            Value<int> totalLectures = const Value.absent(),
            Value<int> totalQuizzes = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<CourseMaterialOrderTypeEntity> courseOrderType =
                const Value.absent(),
            Value<CourseMaterialOrderTypeEntity> lectureOrderType =
                const Value.absent(),
            Value<List<CourseMaterialEntity>> courseOrder =
                const Value.absent(),
            Value<Map<String, List<String>>> lectureOrderByLectureId =
                const Value.absent(),
            Value<String> evaluationMessage = const Value.absent(),
            Value<bool> isXApiCourse = const Value.absent(),
            Value<String> resourceFileUrl = const Value.absent(),
            Value<bool> hasUserTakenCourse = const Value.absent(),
            Value<bool> isUserCanAccessCourse = const Value.absent(),
            Value<UserEntity?> createdBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseTableCompanion(
            id: id,
            title: title,
            description: description,
            objective: objective,
            learningOutcome: learningOutcome,
            coverImage: coverImage,
            urlLink: urlLink,
            isDisplayVideo: isDisplayVideo,
            videoUrl: videoUrl,
            categories: categories,
            downloadableOption: downloadableOption,
            courseLevel: courseLevel,
            courseType: courseType,
            isAllowFeedback: isAllowFeedback,
            isAllowDiscussion: isAllowDiscussion,
            discussion: discussion,
            acceptableScoreForAssignment: acceptableScoreForAssignment,
            acceptableScoreForAssessment: acceptableScoreForAssessment,
            estimatedDuration: estimatedDuration,
            numberOfEnrollments: numberOfEnrollments,
            totalLectures: totalLectures,
            totalQuizzes: totalQuizzes,
            viewCount: viewCount,
            rating: rating,
            courseOrderType: courseOrderType,
            lectureOrderType: lectureOrderType,
            courseOrder: courseOrder,
            lectureOrderByLectureId: lectureOrderByLectureId,
            evaluationMessage: evaluationMessage,
            isXApiCourse: isXApiCourse,
            resourceFileUrl: resourceFileUrl,
            hasUserTakenCourse: hasUserTakenCourse,
            isUserCanAccessCourse: isUserCanAccessCourse,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            required String objective,
            required String learningOutcome,
            required ImageUrlEntity coverImage,
            required String urlLink,
            required bool isDisplayVideo,
            required String videoUrl,
            required List<CourseCategoryEntity> categories,
            required CourseDownloadableOptionEntity downloadableOption,
            required CourseLevelEntity courseLevel,
            required CourseTypeEntity courseType,
            required bool isAllowFeedback,
            required bool isAllowDiscussion,
            Value<CourseDiscussionEntity?> discussion = const Value.absent(),
            required int acceptableScoreForAssignment,
            required int acceptableScoreForAssessment,
            required CourseDurationEntity estimatedDuration,
            required int numberOfEnrollments,
            required int totalLectures,
            required int totalQuizzes,
            required int viewCount,
            required double rating,
            required CourseMaterialOrderTypeEntity courseOrderType,
            required CourseMaterialOrderTypeEntity lectureOrderType,
            required List<CourseMaterialEntity> courseOrder,
            required Map<String, List<String>> lectureOrderByLectureId,
            required String evaluationMessage,
            required bool isXApiCourse,
            required String resourceFileUrl,
            required bool hasUserTakenCourse,
            required bool isUserCanAccessCourse,
            Value<UserEntity?> createdBy = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            objective: objective,
            learningOutcome: learningOutcome,
            coverImage: coverImage,
            urlLink: urlLink,
            isDisplayVideo: isDisplayVideo,
            videoUrl: videoUrl,
            categories: categories,
            downloadableOption: downloadableOption,
            courseLevel: courseLevel,
            courseType: courseType,
            isAllowFeedback: isAllowFeedback,
            isAllowDiscussion: isAllowDiscussion,
            discussion: discussion,
            acceptableScoreForAssignment: acceptableScoreForAssignment,
            acceptableScoreForAssessment: acceptableScoreForAssessment,
            estimatedDuration: estimatedDuration,
            numberOfEnrollments: numberOfEnrollments,
            totalLectures: totalLectures,
            totalQuizzes: totalQuizzes,
            viewCount: viewCount,
            rating: rating,
            courseOrderType: courseOrderType,
            lectureOrderType: lectureOrderType,
            courseOrder: courseOrder,
            lectureOrderByLectureId: lectureOrderByLectureId,
            evaluationMessage: evaluationMessage,
            isXApiCourse: isXApiCourse,
            resourceFileUrl: resourceFileUrl,
            hasUserTakenCourse: hasUserTakenCourse,
            isUserCanAccessCourse: isUserCanAccessCourse,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CourseTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $CourseTableTable,
    CourseEntry,
    $$CourseTableTableFilterComposer,
    $$CourseTableTableOrderingComposer,
    $$CourseTableTableAnnotationComposer,
    $$CourseTableTableCreateCompanionBuilder,
    $$CourseTableTableUpdateCompanionBuilder,
    (
      CourseEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseTableTable, CourseEntry>
    ),
    CourseEntry,
    PrefetchHooks Function()>;
typedef $$CourseLearnerTableTableCreateCompanionBuilder
    = CourseLearnerTableCompanion Function({
  required String id,
  required String courseId,
  required String userId,
  required CourseLearnerStatusEntity status,
  Value<int?> percentage,
  required int notifyCount,
  required bool isActive,
  required Map<String, bool> completionStatusByMaterialKey,
  required bool isReadyToEvaluate,
  required bool isReadyToGenerateCertificate,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CourseLearnerTableTableUpdateCompanionBuilder
    = CourseLearnerTableCompanion Function({
  Value<String> id,
  Value<String> courseId,
  Value<String> userId,
  Value<CourseLearnerStatusEntity> status,
  Value<int?> percentage,
  Value<int> notifyCount,
  Value<bool> isActive,
  Value<Map<String, bool>> completionStatusByMaterialKey,
  Value<bool> isReadyToEvaluate,
  Value<bool> isReadyToGenerateCertificate,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CourseLearnerTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $CourseLearnerTableTable> {
  $$CourseLearnerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CourseLearnerStatusEntity,
          CourseLearnerStatusEntity, String>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notifyCount => $composableBuilder(
      column: $table.notifyCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, bool>, Map<String, bool>, String>
      get completionStatusByMaterialKey => $composableBuilder(
          column: $table.completionStatusByMaterialKey,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isReadyToEvaluate => $composableBuilder(
      column: $table.isReadyToEvaluate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isReadyToGenerateCertificate => $composableBuilder(
      column: $table.isReadyToGenerateCertificate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CourseLearnerTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $CourseLearnerTableTable> {
  $$CourseLearnerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notifyCount => $composableBuilder(
      column: $table.notifyCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get completionStatusByMaterialKey =>
      $composableBuilder(
          column: $table.completionStatusByMaterialKey,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isReadyToEvaluate => $composableBuilder(
      column: $table.isReadyToEvaluate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isReadyToGenerateCertificate => $composableBuilder(
      column: $table.isReadyToGenerateCertificate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CourseLearnerTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $CourseLearnerTableTable> {
  $$CourseLearnerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CourseLearnerStatusEntity, String>
      get status => $composableBuilder(
          column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => column);

  GeneratedColumn<int> get notifyCount => $composableBuilder(
      column: $table.notifyCount, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, bool>, String>
      get completionStatusByMaterialKey => $composableBuilder(
          column: $table.completionStatusByMaterialKey,
          builder: (column) => column);

  GeneratedColumn<bool> get isReadyToEvaluate => $composableBuilder(
      column: $table.isReadyToEvaluate, builder: (column) => column);

  GeneratedColumn<bool> get isReadyToGenerateCertificate => $composableBuilder(
      column: $table.isReadyToGenerateCertificate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CourseLearnerTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $CourseLearnerTableTable,
    CourseLearnerEntry,
    $$CourseLearnerTableTableFilterComposer,
    $$CourseLearnerTableTableOrderingComposer,
    $$CourseLearnerTableTableAnnotationComposer,
    $$CourseLearnerTableTableCreateCompanionBuilder,
    $$CourseLearnerTableTableUpdateCompanionBuilder,
    (
      CourseLearnerEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseLearnerTableTable,
          CourseLearnerEntry>
    ),
    CourseLearnerEntry,
    PrefetchHooks Function()> {
  $$CourseLearnerTableTableTableManager(
      _$DriftMtpDatabase db, $CourseLearnerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseLearnerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseLearnerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseLearnerTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<CourseLearnerStatusEntity> status = const Value.absent(),
            Value<int?> percentage = const Value.absent(),
            Value<int> notifyCount = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<Map<String, bool>> completionStatusByMaterialKey =
                const Value.absent(),
            Value<bool> isReadyToEvaluate = const Value.absent(),
            Value<bool> isReadyToGenerateCertificate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseLearnerTableCompanion(
            id: id,
            courseId: courseId,
            userId: userId,
            status: status,
            percentage: percentage,
            notifyCount: notifyCount,
            isActive: isActive,
            completionStatusByMaterialKey: completionStatusByMaterialKey,
            isReadyToEvaluate: isReadyToEvaluate,
            isReadyToGenerateCertificate: isReadyToGenerateCertificate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String courseId,
            required String userId,
            required CourseLearnerStatusEntity status,
            Value<int?> percentage = const Value.absent(),
            required int notifyCount,
            required bool isActive,
            required Map<String, bool> completionStatusByMaterialKey,
            required bool isReadyToEvaluate,
            required bool isReadyToGenerateCertificate,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseLearnerTableCompanion.insert(
            id: id,
            courseId: courseId,
            userId: userId,
            status: status,
            percentage: percentage,
            notifyCount: notifyCount,
            isActive: isActive,
            completionStatusByMaterialKey: completionStatusByMaterialKey,
            isReadyToEvaluate: isReadyToEvaluate,
            isReadyToGenerateCertificate: isReadyToGenerateCertificate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CourseLearnerTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $CourseLearnerTableTable,
    CourseLearnerEntry,
    $$CourseLearnerTableTableFilterComposer,
    $$CourseLearnerTableTableOrderingComposer,
    $$CourseLearnerTableTableAnnotationComposer,
    $$CourseLearnerTableTableCreateCompanionBuilder,
    $$CourseLearnerTableTableUpdateCompanionBuilder,
    (
      CourseLearnerEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseLearnerTableTable,
          CourseLearnerEntry>
    ),
    CourseLearnerEntry,
    PrefetchHooks Function()>;
typedef $$OfflineCourseTableTableCreateCompanionBuilder
    = OfflineCourseTableCompanion Function({
  required String courseId,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$OfflineCourseTableTableUpdateCompanionBuilder
    = OfflineCourseTableCompanion Function({
  Value<String> courseId,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$OfflineCourseTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseTableTable> {
  $$OfflineCourseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$OfflineCourseTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseTableTable> {
  $$OfflineCourseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$OfflineCourseTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseTableTable> {
  $$OfflineCourseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$OfflineCourseTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $OfflineCourseTableTable,
    OfflineCourseEntry,
    $$OfflineCourseTableTableFilterComposer,
    $$OfflineCourseTableTableOrderingComposer,
    $$OfflineCourseTableTableAnnotationComposer,
    $$OfflineCourseTableTableCreateCompanionBuilder,
    $$OfflineCourseTableTableUpdateCompanionBuilder,
    (
      OfflineCourseEntry,
      BaseReferences<_$DriftMtpDatabase, $OfflineCourseTableTable,
          OfflineCourseEntry>
    ),
    OfflineCourseEntry,
    PrefetchHooks Function()> {
  $$OfflineCourseTableTableTableManager(
      _$DriftMtpDatabase db, $OfflineCourseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineCourseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineCourseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineCourseTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> courseId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineCourseTableCompanion(
            courseId: courseId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String courseId,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineCourseTableCompanion.insert(
            courseId: courseId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflineCourseTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $OfflineCourseTableTable,
    OfflineCourseEntry,
    $$OfflineCourseTableTableFilterComposer,
    $$OfflineCourseTableTableOrderingComposer,
    $$OfflineCourseTableTableAnnotationComposer,
    $$OfflineCourseTableTableCreateCompanionBuilder,
    $$OfflineCourseTableTableUpdateCompanionBuilder,
    (
      OfflineCourseEntry,
      BaseReferences<_$DriftMtpDatabase, $OfflineCourseTableTable,
          OfflineCourseEntry>
    ),
    OfflineCourseEntry,
    PrefetchHooks Function()>;
typedef $$OfflineCourseMediaTableTableCreateCompanionBuilder
    = OfflineCourseMediaTableCompanion Function({
  Value<int> id,
  required String courseId,
  required String url,
  required String title,
  Value<String?> thumbnail,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$OfflineCourseMediaTableTableUpdateCompanionBuilder
    = OfflineCourseMediaTableCompanion Function({
  Value<int> id,
  Value<String> courseId,
  Value<String> url,
  Value<String> title,
  Value<String?> thumbnail,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
});

class $$OfflineCourseMediaTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseMediaTableTable> {
  $$OfflineCourseMediaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$OfflineCourseMediaTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseMediaTableTable> {
  $$OfflineCourseMediaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$OfflineCourseMediaTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $OfflineCourseMediaTableTable> {
  $$OfflineCourseMediaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$OfflineCourseMediaTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $OfflineCourseMediaTableTable,
    OfflineCourseMediaEntry,
    $$OfflineCourseMediaTableTableFilterComposer,
    $$OfflineCourseMediaTableTableOrderingComposer,
    $$OfflineCourseMediaTableTableAnnotationComposer,
    $$OfflineCourseMediaTableTableCreateCompanionBuilder,
    $$OfflineCourseMediaTableTableUpdateCompanionBuilder,
    (
      OfflineCourseMediaEntry,
      BaseReferences<_$DriftMtpDatabase, $OfflineCourseMediaTableTable,
          OfflineCourseMediaEntry>
    ),
    OfflineCourseMediaEntry,
    PrefetchHooks Function()> {
  $$OfflineCourseMediaTableTableTableManager(
      _$DriftMtpDatabase db, $OfflineCourseMediaTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineCourseMediaTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineCourseMediaTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineCourseMediaTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              OfflineCourseMediaTableCompanion(
            id: id,
            courseId: courseId,
            url: url,
            title: title,
            thumbnail: thumbnail,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String courseId,
            required String url,
            required String title,
            Value<String?> thumbnail = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              OfflineCourseMediaTableCompanion.insert(
            id: id,
            courseId: courseId,
            url: url,
            title: title,
            thumbnail: thumbnail,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflineCourseMediaTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $OfflineCourseMediaTableTable,
        OfflineCourseMediaEntry,
        $$OfflineCourseMediaTableTableFilterComposer,
        $$OfflineCourseMediaTableTableOrderingComposer,
        $$OfflineCourseMediaTableTableAnnotationComposer,
        $$OfflineCourseMediaTableTableCreateCompanionBuilder,
        $$OfflineCourseMediaTableTableUpdateCompanionBuilder,
        (
          OfflineCourseMediaEntry,
          BaseReferences<_$DriftMtpDatabase, $OfflineCourseMediaTableTable,
              OfflineCourseMediaEntry>
        ),
        OfflineCourseMediaEntry,
        PrefetchHooks Function()>;
typedef $$CourseDownloadStatusTableTableCreateCompanionBuilder
    = CourseDownloadStatusTableCompanion Function({
  required String courseId,
  required String downloadTaskId,
  required String downloadRecordJson,
  Value<bool> isHandled,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CourseDownloadStatusTableTableUpdateCompanionBuilder
    = CourseDownloadStatusTableCompanion Function({
  Value<String> courseId,
  Value<String> downloadTaskId,
  Value<String> downloadRecordJson,
  Value<bool> isHandled,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CourseDownloadStatusTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $CourseDownloadStatusTableTable> {
  $$CourseDownloadStatusTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get downloadTaskId => $composableBuilder(
      column: $table.downloadTaskId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get downloadRecordJson => $composableBuilder(
      column: $table.downloadRecordJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHandled => $composableBuilder(
      column: $table.isHandled, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CourseDownloadStatusTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $CourseDownloadStatusTableTable> {
  $$CourseDownloadStatusTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get downloadTaskId => $composableBuilder(
      column: $table.downloadTaskId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get downloadRecordJson => $composableBuilder(
      column: $table.downloadRecordJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHandled => $composableBuilder(
      column: $table.isHandled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CourseDownloadStatusTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $CourseDownloadStatusTableTable> {
  $$CourseDownloadStatusTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get downloadTaskId => $composableBuilder(
      column: $table.downloadTaskId, builder: (column) => column);

  GeneratedColumn<String> get downloadRecordJson => $composableBuilder(
      column: $table.downloadRecordJson, builder: (column) => column);

  GeneratedColumn<bool> get isHandled =>
      $composableBuilder(column: $table.isHandled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CourseDownloadStatusTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $CourseDownloadStatusTableTable,
    CourseDownloadStatusEntry,
    $$CourseDownloadStatusTableTableFilterComposer,
    $$CourseDownloadStatusTableTableOrderingComposer,
    $$CourseDownloadStatusTableTableAnnotationComposer,
    $$CourseDownloadStatusTableTableCreateCompanionBuilder,
    $$CourseDownloadStatusTableTableUpdateCompanionBuilder,
    (
      CourseDownloadStatusEntry,
      BaseReferences<_$DriftMtpDatabase, $CourseDownloadStatusTableTable,
          CourseDownloadStatusEntry>
    ),
    CourseDownloadStatusEntry,
    PrefetchHooks Function()> {
  $$CourseDownloadStatusTableTableTableManager(
      _$DriftMtpDatabase db, $CourseDownloadStatusTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseDownloadStatusTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseDownloadStatusTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseDownloadStatusTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> courseId = const Value.absent(),
            Value<String> downloadTaskId = const Value.absent(),
            Value<String> downloadRecordJson = const Value.absent(),
            Value<bool> isHandled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseDownloadStatusTableCompanion(
            courseId: courseId,
            downloadTaskId: downloadTaskId,
            downloadRecordJson: downloadRecordJson,
            isHandled: isHandled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String courseId,
            required String downloadTaskId,
            required String downloadRecordJson,
            Value<bool> isHandled = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CourseDownloadStatusTableCompanion.insert(
            courseId: courseId,
            downloadTaskId: downloadTaskId,
            downloadRecordJson: downloadRecordJson,
            isHandled: isHandled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CourseDownloadStatusTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $CourseDownloadStatusTableTable,
        CourseDownloadStatusEntry,
        $$CourseDownloadStatusTableTableFilterComposer,
        $$CourseDownloadStatusTableTableOrderingComposer,
        $$CourseDownloadStatusTableTableAnnotationComposer,
        $$CourseDownloadStatusTableTableCreateCompanionBuilder,
        $$CourseDownloadStatusTableTableUpdateCompanionBuilder,
        (
          CourseDownloadStatusEntry,
          BaseReferences<_$DriftMtpDatabase, $CourseDownloadStatusTableTable,
              CourseDownloadStatusEntry>
        ),
        CourseDownloadStatusEntry,
        PrefetchHooks Function()>;
typedef $$LectureTableTableCreateCompanionBuilder = LectureTableCompanion
    Function({
  required String id,
  required String title,
  required String resourceUrl,
  required String description,
  required LectureResourceTypeEntity resourceType,
  required String videoUrl,
  required String attachedFileUrl,
  required String courseId,
  Value<MediaEntity?> media,
  required List<InteractiveFeatureEntity> interactiveFeatures,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$LectureTableTableUpdateCompanionBuilder = LectureTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> resourceUrl,
  Value<String> description,
  Value<LectureResourceTypeEntity> resourceType,
  Value<String> videoUrl,
  Value<String> attachedFileUrl,
  Value<String> courseId,
  Value<MediaEntity?> media,
  Value<List<InteractiveFeatureEntity>> interactiveFeatures,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$LectureTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $LectureTableTable> {
  $$LectureTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceUrl => $composableBuilder(
      column: $table.resourceUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LectureResourceTypeEntity,
          LectureResourceTypeEntity, String>
      get resourceType => $composableBuilder(
          column: $table.resourceType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachedFileUrl => $composableBuilder(
      column: $table.attachedFileUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MediaEntity?, MediaEntity, String> get media =>
      $composableBuilder(
          column: $table.media,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<InteractiveFeatureEntity>,
          List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$LectureTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $LectureTableTable> {
  $$LectureTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceUrl => $composableBuilder(
      column: $table.resourceUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachedFileUrl => $composableBuilder(
      column: $table.attachedFileUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get interactiveFeatures => $composableBuilder(
      column: $table.interactiveFeatures,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$LectureTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $LectureTableTable> {
  $$LectureTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get resourceUrl => $composableBuilder(
      column: $table.resourceUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LectureResourceTypeEntity, String>
      get resourceType => $composableBuilder(
          column: $table.resourceType, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get attachedFileUrl => $composableBuilder(
      column: $table.attachedFileUrl, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaEntity?, String> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$LectureTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $LectureTableTable,
    LectureEntry,
    $$LectureTableTableFilterComposer,
    $$LectureTableTableOrderingComposer,
    $$LectureTableTableAnnotationComposer,
    $$LectureTableTableCreateCompanionBuilder,
    $$LectureTableTableUpdateCompanionBuilder,
    (
      LectureEntry,
      BaseReferences<_$DriftMtpDatabase, $LectureTableTable, LectureEntry>
    ),
    LectureEntry,
    PrefetchHooks Function()> {
  $$LectureTableTableTableManager(
      _$DriftMtpDatabase db, $LectureTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LectureTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LectureTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LectureTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> resourceUrl = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<LectureResourceTypeEntity> resourceType =
                const Value.absent(),
            Value<String> videoUrl = const Value.absent(),
            Value<String> attachedFileUrl = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<MediaEntity?> media = const Value.absent(),
            Value<List<InteractiveFeatureEntity>> interactiveFeatures =
                const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LectureTableCompanion(
            id: id,
            title: title,
            resourceUrl: resourceUrl,
            description: description,
            resourceType: resourceType,
            videoUrl: videoUrl,
            attachedFileUrl: attachedFileUrl,
            courseId: courseId,
            media: media,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String resourceUrl,
            required String description,
            required LectureResourceTypeEntity resourceType,
            required String videoUrl,
            required String attachedFileUrl,
            required String courseId,
            Value<MediaEntity?> media = const Value.absent(),
            required List<InteractiveFeatureEntity> interactiveFeatures,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LectureTableCompanion.insert(
            id: id,
            title: title,
            resourceUrl: resourceUrl,
            description: description,
            resourceType: resourceType,
            videoUrl: videoUrl,
            attachedFileUrl: attachedFileUrl,
            courseId: courseId,
            media: media,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LectureTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $LectureTableTable,
    LectureEntry,
    $$LectureTableTableFilterComposer,
    $$LectureTableTableOrderingComposer,
    $$LectureTableTableAnnotationComposer,
    $$LectureTableTableCreateCompanionBuilder,
    $$LectureTableTableUpdateCompanionBuilder,
    (
      LectureEntry,
      BaseReferences<_$DriftMtpDatabase, $LectureTableTable, LectureEntry>
    ),
    LectureEntry,
    PrefetchHooks Function()>;
typedef $$LearningActivityTableTableCreateCompanionBuilder
    = LearningActivityTableCompanion Function({
  required String id,
  required String title,
  required String description,
  Value<MediaEntity?> media,
  required String courseId,
  required String lectureId,
  required List<InteractiveFeatureEntity> interactiveFeatures,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$LearningActivityTableTableUpdateCompanionBuilder
    = LearningActivityTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<MediaEntity?> media,
  Value<String> courseId,
  Value<String> lectureId,
  Value<List<InteractiveFeatureEntity>> interactiveFeatures,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$LearningActivityTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $LearningActivityTableTable> {
  $$LearningActivityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MediaEntity?, MediaEntity, String> get media =>
      $composableBuilder(
          column: $table.media,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<InteractiveFeatureEntity>,
          List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$LearningActivityTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $LearningActivityTableTable> {
  $$LearningActivityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get interactiveFeatures => $composableBuilder(
      column: $table.interactiveFeatures,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$LearningActivityTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $LearningActivityTableTable> {
  $$LearningActivityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaEntity?, String> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$LearningActivityTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $LearningActivityTableTable,
    LearningActivityEntry,
    $$LearningActivityTableTableFilterComposer,
    $$LearningActivityTableTableOrderingComposer,
    $$LearningActivityTableTableAnnotationComposer,
    $$LearningActivityTableTableCreateCompanionBuilder,
    $$LearningActivityTableTableUpdateCompanionBuilder,
    (
      LearningActivityEntry,
      BaseReferences<_$DriftMtpDatabase, $LearningActivityTableTable,
          LearningActivityEntry>
    ),
    LearningActivityEntry,
    PrefetchHooks Function()> {
  $$LearningActivityTableTableTableManager(
      _$DriftMtpDatabase db, $LearningActivityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningActivityTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningActivityTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningActivityTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<MediaEntity?> media = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<String> lectureId = const Value.absent(),
            Value<List<InteractiveFeatureEntity>> interactiveFeatures =
                const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningActivityTableCompanion(
            id: id,
            title: title,
            description: description,
            media: media,
            courseId: courseId,
            lectureId: lectureId,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            Value<MediaEntity?> media = const Value.absent(),
            required String courseId,
            required String lectureId,
            required List<InteractiveFeatureEntity> interactiveFeatures,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningActivityTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            media: media,
            courseId: courseId,
            lectureId: lectureId,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningActivityTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $LearningActivityTableTable,
        LearningActivityEntry,
        $$LearningActivityTableTableFilterComposer,
        $$LearningActivityTableTableOrderingComposer,
        $$LearningActivityTableTableAnnotationComposer,
        $$LearningActivityTableTableCreateCompanionBuilder,
        $$LearningActivityTableTableUpdateCompanionBuilder,
        (
          LearningActivityEntry,
          BaseReferences<_$DriftMtpDatabase, $LearningActivityTableTable,
              LearningActivityEntry>
        ),
        LearningActivityEntry,
        PrefetchHooks Function()>;
typedef $$LearningSummaryTableTableCreateCompanionBuilder
    = LearningSummaryTableCompanion Function({
  required String id,
  required String title,
  required String description,
  Value<MediaEntity?> media,
  required String lectureId,
  required String courseId,
  required List<InteractiveFeatureEntity> interactiveFeatures,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$LearningSummaryTableTableUpdateCompanionBuilder
    = LearningSummaryTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<MediaEntity?> media,
  Value<String> lectureId,
  Value<String> courseId,
  Value<List<InteractiveFeatureEntity>> interactiveFeatures,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$LearningSummaryTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $LearningSummaryTableTable> {
  $$LearningSummaryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MediaEntity?, MediaEntity, String> get media =>
      $composableBuilder(
          column: $table.media,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<InteractiveFeatureEntity>,
          List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$LearningSummaryTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $LearningSummaryTableTable> {
  $$LearningSummaryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get interactiveFeatures => $composableBuilder(
      column: $table.interactiveFeatures,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$LearningSummaryTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $LearningSummaryTableTable> {
  $$LearningSummaryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaEntity?, String> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<String> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<InteractiveFeatureEntity>, String>
      get interactiveFeatures => $composableBuilder(
          column: $table.interactiveFeatures, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$LearningSummaryTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $LearningSummaryTableTable,
    LearningSummaryEntry,
    $$LearningSummaryTableTableFilterComposer,
    $$LearningSummaryTableTableOrderingComposer,
    $$LearningSummaryTableTableAnnotationComposer,
    $$LearningSummaryTableTableCreateCompanionBuilder,
    $$LearningSummaryTableTableUpdateCompanionBuilder,
    (
      LearningSummaryEntry,
      BaseReferences<_$DriftMtpDatabase, $LearningSummaryTableTable,
          LearningSummaryEntry>
    ),
    LearningSummaryEntry,
    PrefetchHooks Function()> {
  $$LearningSummaryTableTableTableManager(
      _$DriftMtpDatabase db, $LearningSummaryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningSummaryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningSummaryTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningSummaryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<MediaEntity?> media = const Value.absent(),
            Value<String> lectureId = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<List<InteractiveFeatureEntity>> interactiveFeatures =
                const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningSummaryTableCompanion(
            id: id,
            title: title,
            description: description,
            media: media,
            lectureId: lectureId,
            courseId: courseId,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            Value<MediaEntity?> media = const Value.absent(),
            required String lectureId,
            required String courseId,
            required List<InteractiveFeatureEntity> interactiveFeatures,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningSummaryTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            media: media,
            lectureId: lectureId,
            courseId: courseId,
            interactiveFeatures: interactiveFeatures,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningSummaryTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftMtpDatabase,
        $LearningSummaryTableTable,
        LearningSummaryEntry,
        $$LearningSummaryTableTableFilterComposer,
        $$LearningSummaryTableTableOrderingComposer,
        $$LearningSummaryTableTableAnnotationComposer,
        $$LearningSummaryTableTableCreateCompanionBuilder,
        $$LearningSummaryTableTableUpdateCompanionBuilder,
        (
          LearningSummaryEntry,
          BaseReferences<_$DriftMtpDatabase, $LearningSummaryTableTable,
              LearningSummaryEntry>
        ),
        LearningSummaryEntry,
        PrefetchHooks Function()>;
typedef $$LearningQuizTableTableCreateCompanionBuilder
    = LearningQuizTableCompanion Function({
  required String id,
  required String title,
  required String lectureId,
  required String courseId,
  required LearningQuizTypeEntity type,
  required bool isTryAgain,
  required List<LearningQuizQuestionEntity> questions,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$LearningQuizTableTableUpdateCompanionBuilder
    = LearningQuizTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> lectureId,
  Value<String> courseId,
  Value<LearningQuizTypeEntity> type,
  Value<bool> isTryAgain,
  Value<List<LearningQuizQuestionEntity>> questions,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$LearningQuizTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $LearningQuizTableTable> {
  $$LearningQuizTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LearningQuizTypeEntity, LearningQuizTypeEntity,
          String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isTryAgain => $composableBuilder(
      column: $table.isTryAgain, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<LearningQuizQuestionEntity>,
          List<LearningQuizQuestionEntity>, String>
      get questions => $composableBuilder(
          column: $table.questions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$LearningQuizTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $LearningQuizTableTable> {
  $$LearningQuizTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTryAgain => $composableBuilder(
      column: $table.isTryAgain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questions => $composableBuilder(
      column: $table.questions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$LearningQuizTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $LearningQuizTableTable> {
  $$LearningQuizTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LearningQuizTypeEntity, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isTryAgain => $composableBuilder(
      column: $table.isTryAgain, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<LearningQuizQuestionEntity>, String>
      get questions => $composableBuilder(
          column: $table.questions, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$LearningQuizTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $LearningQuizTableTable,
    LearningQuizEntry,
    $$LearningQuizTableTableFilterComposer,
    $$LearningQuizTableTableOrderingComposer,
    $$LearningQuizTableTableAnnotationComposer,
    $$LearningQuizTableTableCreateCompanionBuilder,
    $$LearningQuizTableTableUpdateCompanionBuilder,
    (
      LearningQuizEntry,
      BaseReferences<_$DriftMtpDatabase, $LearningQuizTableTable,
          LearningQuizEntry>
    ),
    LearningQuizEntry,
    PrefetchHooks Function()> {
  $$LearningQuizTableTableTableManager(
      _$DriftMtpDatabase db, $LearningQuizTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningQuizTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningQuizTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningQuizTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> lectureId = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<LearningQuizTypeEntity> type = const Value.absent(),
            Value<bool> isTryAgain = const Value.absent(),
            Value<List<LearningQuizQuestionEntity>> questions =
                const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningQuizTableCompanion(
            id: id,
            title: title,
            lectureId: lectureId,
            courseId: courseId,
            type: type,
            isTryAgain: isTryAgain,
            questions: questions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String lectureId,
            required String courseId,
            required LearningQuizTypeEntity type,
            required bool isTryAgain,
            required List<LearningQuizQuestionEntity> questions,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningQuizTableCompanion.insert(
            id: id,
            title: title,
            lectureId: lectureId,
            courseId: courseId,
            type: type,
            isTryAgain: isTryAgain,
            questions: questions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningQuizTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $LearningQuizTableTable,
    LearningQuizEntry,
    $$LearningQuizTableTableFilterComposer,
    $$LearningQuizTableTableOrderingComposer,
    $$LearningQuizTableTableAnnotationComposer,
    $$LearningQuizTableTableCreateCompanionBuilder,
    $$LearningQuizTableTableUpdateCompanionBuilder,
    (
      LearningQuizEntry,
      BaseReferences<_$DriftMtpDatabase, $LearningQuizTableTable,
          LearningQuizEntry>
    ),
    LearningQuizEntry,
    PrefetchHooks Function()>;
typedef $$UserCourseTableTableCreateCompanionBuilder = UserCourseTableCompanion
    Function({
  required String courseId,
  required String learnerId,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$UserCourseTableTableUpdateCompanionBuilder = UserCourseTableCompanion
    Function({
  Value<String> courseId,
  Value<String> learnerId,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$UserCourseTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $UserCourseTableTable> {
  $$UserCourseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get learnerId => $composableBuilder(
      column: $table.learnerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$UserCourseTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $UserCourseTableTable> {
  $$UserCourseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get learnerId => $composableBuilder(
      column: $table.learnerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserCourseTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $UserCourseTableTable> {
  $$UserCourseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get learnerId =>
      $composableBuilder(column: $table.learnerId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$UserCourseTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $UserCourseTableTable,
    UserCourseEntry,
    $$UserCourseTableTableFilterComposer,
    $$UserCourseTableTableOrderingComposer,
    $$UserCourseTableTableAnnotationComposer,
    $$UserCourseTableTableCreateCompanionBuilder,
    $$UserCourseTableTableUpdateCompanionBuilder,
    (
      UserCourseEntry,
      BaseReferences<_$DriftMtpDatabase, $UserCourseTableTable, UserCourseEntry>
    ),
    UserCourseEntry,
    PrefetchHooks Function()> {
  $$UserCourseTableTableTableManager(
      _$DriftMtpDatabase db, $UserCourseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserCourseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserCourseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserCourseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> courseId = const Value.absent(),
            Value<String> learnerId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserCourseTableCompanion(
            courseId: courseId,
            learnerId: learnerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String courseId,
            required String learnerId,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserCourseTableCompanion.insert(
            courseId: courseId,
            learnerId: learnerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserCourseTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $UserCourseTableTable,
    UserCourseEntry,
    $$UserCourseTableTableFilterComposer,
    $$UserCourseTableTableOrderingComposer,
    $$UserCourseTableTableAnnotationComposer,
    $$UserCourseTableTableCreateCompanionBuilder,
    $$UserCourseTableTableUpdateCompanionBuilder,
    (
      UserCourseEntry,
      BaseReferences<_$DriftMtpDatabase, $UserCourseTableTable, UserCourseEntry>
    ),
    UserCourseEntry,
    PrefetchHooks Function()>;
typedef $$LiveSessionTableTableCreateCompanionBuilder
    = LiveSessionTableCompanion Function({
  required String id,
  required String courseId,
  required String lectureId,
  required String topic,
  required String meetingId,
  required DateTime startDateTime,
  required String agenda,
  required bool isHostVideoEnabled,
  required bool isParticipantVideoEnabled,
  required int durationInMinutes,
  required String description,
  required String passcode,
  required String status,
  required String startUrl,
  required String joinUrl,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$LiveSessionTableTableUpdateCompanionBuilder
    = LiveSessionTableCompanion Function({
  Value<String> id,
  Value<String> courseId,
  Value<String> lectureId,
  Value<String> topic,
  Value<String> meetingId,
  Value<DateTime> startDateTime,
  Value<String> agenda,
  Value<bool> isHostVideoEnabled,
  Value<bool> isParticipantVideoEnabled,
  Value<int> durationInMinutes,
  Value<String> description,
  Value<String> passcode,
  Value<String> status,
  Value<String> startUrl,
  Value<String> joinUrl,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$LiveSessionTableTableFilterComposer
    extends Composer<_$DriftMtpDatabase, $LiveSessionTableTable> {
  $$LiveSessionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetingId => $composableBuilder(
      column: $table.meetingId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHostVideoEnabled => $composableBuilder(
      column: $table.isHostVideoEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isParticipantVideoEnabled => $composableBuilder(
      column: $table.isParticipantVideoEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationInMinutes => $composableBuilder(
      column: $table.durationInMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passcode => $composableBuilder(
      column: $table.passcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startUrl => $composableBuilder(
      column: $table.startUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get joinUrl => $composableBuilder(
      column: $table.joinUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$LiveSessionTableTableOrderingComposer
    extends Composer<_$DriftMtpDatabase, $LiveSessionTableTable> {
  $$LiveSessionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseId => $composableBuilder(
      column: $table.courseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetingId => $composableBuilder(
      column: $table.meetingId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHostVideoEnabled => $composableBuilder(
      column: $table.isHostVideoEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isParticipantVideoEnabled => $composableBuilder(
      column: $table.isParticipantVideoEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationInMinutes => $composableBuilder(
      column: $table.durationInMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passcode => $composableBuilder(
      column: $table.passcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startUrl => $composableBuilder(
      column: $table.startUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get joinUrl => $composableBuilder(
      column: $table.joinUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$LiveSessionTableTableAnnotationComposer
    extends Composer<_$DriftMtpDatabase, $LiveSessionTableTable> {
  $$LiveSessionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get meetingId =>
      $composableBuilder(column: $table.meetingId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime, builder: (column) => column);

  GeneratedColumn<String> get agenda =>
      $composableBuilder(column: $table.agenda, builder: (column) => column);

  GeneratedColumn<bool> get isHostVideoEnabled => $composableBuilder(
      column: $table.isHostVideoEnabled, builder: (column) => column);

  GeneratedColumn<bool> get isParticipantVideoEnabled => $composableBuilder(
      column: $table.isParticipantVideoEnabled, builder: (column) => column);

  GeneratedColumn<int> get durationInMinutes => $composableBuilder(
      column: $table.durationInMinutes, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get passcode =>
      $composableBuilder(column: $table.passcode, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get startUrl =>
      $composableBuilder(column: $table.startUrl, builder: (column) => column);

  GeneratedColumn<String> get joinUrl =>
      $composableBuilder(column: $table.joinUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$LiveSessionTableTableTableManager extends RootTableManager<
    _$DriftMtpDatabase,
    $LiveSessionTableTable,
    LiveSessionEntry,
    $$LiveSessionTableTableFilterComposer,
    $$LiveSessionTableTableOrderingComposer,
    $$LiveSessionTableTableAnnotationComposer,
    $$LiveSessionTableTableCreateCompanionBuilder,
    $$LiveSessionTableTableUpdateCompanionBuilder,
    (
      LiveSessionEntry,
      BaseReferences<_$DriftMtpDatabase, $LiveSessionTableTable,
          LiveSessionEntry>
    ),
    LiveSessionEntry,
    PrefetchHooks Function()> {
  $$LiveSessionTableTableTableManager(
      _$DriftMtpDatabase db, $LiveSessionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LiveSessionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LiveSessionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LiveSessionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> courseId = const Value.absent(),
            Value<String> lectureId = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<String> meetingId = const Value.absent(),
            Value<DateTime> startDateTime = const Value.absent(),
            Value<String> agenda = const Value.absent(),
            Value<bool> isHostVideoEnabled = const Value.absent(),
            Value<bool> isParticipantVideoEnabled = const Value.absent(),
            Value<int> durationInMinutes = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> passcode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> startUrl = const Value.absent(),
            Value<String> joinUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LiveSessionTableCompanion(
            id: id,
            courseId: courseId,
            lectureId: lectureId,
            topic: topic,
            meetingId: meetingId,
            startDateTime: startDateTime,
            agenda: agenda,
            isHostVideoEnabled: isHostVideoEnabled,
            isParticipantVideoEnabled: isParticipantVideoEnabled,
            durationInMinutes: durationInMinutes,
            description: description,
            passcode: passcode,
            status: status,
            startUrl: startUrl,
            joinUrl: joinUrl,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String courseId,
            required String lectureId,
            required String topic,
            required String meetingId,
            required DateTime startDateTime,
            required String agenda,
            required bool isHostVideoEnabled,
            required bool isParticipantVideoEnabled,
            required int durationInMinutes,
            required String description,
            required String passcode,
            required String status,
            required String startUrl,
            required String joinUrl,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LiveSessionTableCompanion.insert(
            id: id,
            courseId: courseId,
            lectureId: lectureId,
            topic: topic,
            meetingId: meetingId,
            startDateTime: startDateTime,
            agenda: agenda,
            isHostVideoEnabled: isHostVideoEnabled,
            isParticipantVideoEnabled: isParticipantVideoEnabled,
            durationInMinutes: durationInMinutes,
            description: description,
            passcode: passcode,
            status: status,
            startUrl: startUrl,
            joinUrl: joinUrl,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LiveSessionTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftMtpDatabase,
    $LiveSessionTableTable,
    LiveSessionEntry,
    $$LiveSessionTableTableFilterComposer,
    $$LiveSessionTableTableOrderingComposer,
    $$LiveSessionTableTableAnnotationComposer,
    $$LiveSessionTableTableCreateCompanionBuilder,
    $$LiveSessionTableTableUpdateCompanionBuilder,
    (
      LiveSessionEntry,
      BaseReferences<_$DriftMtpDatabase, $LiveSessionTableTable,
          LiveSessionEntry>
    ),
    LiveSessionEntry,
    PrefetchHooks Function()>;

class $DriftMtpDatabaseManager {
  final _$DriftMtpDatabase _db;
  $DriftMtpDatabaseManager(this._db);
  $$BlogPostTableTableTableManager get blogPostTable =>
      $$BlogPostTableTableTableManager(_db, _db.blogPostTable);
  $$BlogPostQueryTableTableTableManager get blogPostQueryTable =>
      $$BlogPostQueryTableTableTableManager(_db, _db.blogPostQueryTable);
  $$BlogPostCommentTableTableTableManager get blogPostCommentTable =>
      $$BlogPostCommentTableTableTableManager(_db, _db.blogPostCommentTable);
  $$BlogPostCategoryTableTableTableManager get blogPostCategoryTable =>
      $$BlogPostCategoryTableTableTableManager(_db, _db.blogPostCategoryTable);
  $$CourseAssessmentQuestionTableTableTableManager
      get courseAssessmentQuestionTable =>
          $$CourseAssessmentQuestionTableTableTableManager(
              _db, _db.courseAssessmentQuestionTable);
  $$CourseCategoryTableTableTableManager get courseCategoryTable =>
      $$CourseCategoryTableTableTableManager(_db, _db.courseCategoryTable);
  $$CourseTableTableTableManager get courseTable =>
      $$CourseTableTableTableManager(_db, _db.courseTable);
  $$CourseLearnerTableTableTableManager get courseLearnerTable =>
      $$CourseLearnerTableTableTableManager(_db, _db.courseLearnerTable);
  $$OfflineCourseTableTableTableManager get offlineCourseTable =>
      $$OfflineCourseTableTableTableManager(_db, _db.offlineCourseTable);
  $$OfflineCourseMediaTableTableTableManager get offlineCourseMediaTable =>
      $$OfflineCourseMediaTableTableTableManager(
          _db, _db.offlineCourseMediaTable);
  $$CourseDownloadStatusTableTableTableManager get courseDownloadStatusTable =>
      $$CourseDownloadStatusTableTableTableManager(
          _db, _db.courseDownloadStatusTable);
  $$LectureTableTableTableManager get lectureTable =>
      $$LectureTableTableTableManager(_db, _db.lectureTable);
  $$LearningActivityTableTableTableManager get learningActivityTable =>
      $$LearningActivityTableTableTableManager(_db, _db.learningActivityTable);
  $$LearningSummaryTableTableTableManager get learningSummaryTable =>
      $$LearningSummaryTableTableTableManager(_db, _db.learningSummaryTable);
  $$LearningQuizTableTableTableManager get learningQuizTable =>
      $$LearningQuizTableTableTableManager(_db, _db.learningQuizTable);
  $$UserCourseTableTableTableManager get userCourseTable =>
      $$UserCourseTableTableTableManager(_db, _db.userCourseTable);
  $$LiveSessionTableTableTableManager get liveSessionTable =>
      $$LiveSessionTableTableTableManager(_db, _db.liveSessionTable);
}

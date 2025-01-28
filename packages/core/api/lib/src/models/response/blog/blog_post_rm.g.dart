// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostRM _$BlogPostRMFromJson(Map<String, dynamic> json) => BlogPostRM(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      titleMm: json['title_mm'] as String?,
      bodyUpper: json['body_upper'] as String?,
      bodyUpperMm: json['body_upper_mm'] as String?,
      privacy: json['privacy'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => BlogPostTagRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewCount: (json['view_count'] as num?)?.toInt(),
      shareCount: (json['shares'] as num?)?.toInt(),
      estimatedDuration: (json['estimated_duration'] as num?)?.toInt(),
      estimatedDurationUnit: json['estimated_duration_unit'] == null
          ? null
          : BlogPostDurationUnitRM.fromJson(
              json['estimated_duration_unit'] as String),
      coverImages: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
      featuredVideo: json['featured_video'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      blockQuote: json['blockquote'] as String?,
      blocQuoteMm: json['blockquote_mm'] as String?,
      bodyLower: json['body_lower'] as String?,
      bodyLowerMm: json['body_lower_mm'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => BlogPostCategoryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDisplayVideo: (json['is_display_video'] as num?)?.toInt(),
      videoLink: json['video_link'] as String?,
      author: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      hasRead: json['user_read'] as bool?,
      shareLink: json['share_link'] as String?,
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      numberOfComments: (json['number_of_comments'] as num?)?.toInt(),
      currentReaction: json['my_reaction'] == null
          ? null
          : ReactionRM.fromJson(json['my_reaction'] as Map<String, dynamic>),
      postReactions: (json['blog_reactions'] as List<dynamic>?)
          ?.map((e) => ReactionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallScore: (json['overall_score'] as num?)?.toInt(),
      hasQuiz: json['has_questions'] as bool?,
    );

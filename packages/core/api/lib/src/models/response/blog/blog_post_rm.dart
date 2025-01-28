import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../json/converters/converters.dart';

part 'blog_post_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class BlogPostRM extends Equatable {
  const BlogPostRM({
    this.id,
    this.slug,
    this.title,
    this.titleMm,
    this.bodyUpper,
    this.bodyUpperMm,
    this.privacy,
    this.tags,
    this.viewCount,
    this.shareCount,
    this.estimatedDuration,
    this.estimatedDurationUnit,
    this.coverImages,
    this.featuredVideo,
    this.createdAt,
    this.updatedAt,
    this.blockQuote,
    this.blocQuoteMm,
    this.bodyLower,
    this.bodyLowerMm,
    this.categories,
    this.isDisplayVideo,
    this.videoLink,
    this.author,
    this.hasRead,
    this.shareLink,
    this.numberOfReactions,
    this.numberOfComments,
    this.currentReaction,
    this.postReactions,
    this.overallScore,
    this.hasQuiz,
  });

  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "slug")
  final String? slug;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "title_mm")
  final String? titleMm;

  @JsonKey(name: "body_upper")
  final String? bodyUpper;

  @JsonKey(name: "body_upper_mm")
  final String? bodyUpperMm;

  @JsonKey(name: "privacy")
  final String? privacy;

  @JsonKey(name: "view_count")
  final int? viewCount;

  @JsonKey(name: "shares")
  final int? shareCount;

  @JsonKey(name: "estimated_duration")
  final int? estimatedDuration;

  @JsonKey(
      name: "estimated_duration_unit",
      unknownEnumValue: BlogPostDurationUnitRM.unknown)
  final BlogPostDurationUnitRM? estimatedDurationUnit;

  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImages;

  @JsonKey(name: "featured_video")
  final String? featuredVideo;

  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @JsonKey(name: "blockquote")
  final String? blockQuote;

  @JsonKey(name: "blockquote_mm")
  final String? blocQuoteMm;

  @JsonKey(name: "body_lower")
  final String? bodyLower;

  @JsonKey(name: "body_lower_mm")
  final String? bodyLowerMm;

  @JsonKey(name: "categories")
  final List<BlogPostCategoryRM>? categories;

  @JsonKey(name: "tags")
  final List<BlogPostTagRM>? tags;

  @JsonKey(name: "is_display_video")
  final int? isDisplayVideo;

  @JsonKey(name: "video_link")
  final String? videoLink;

  @JsonKey(name: "user")
  final UserRM? author;

  @JsonKey(name: "user_read")
  final bool? hasRead;

  @JsonKey(name: "share_link")
  final String? shareLink;

  @JsonKey(name: 'number_of_reactions')
  final int? numberOfReactions;

  @JsonKey(name: 'number_of_comments')
  final int? numberOfComments;

  @JsonKey(name: 'my_reaction')
  final ReactionRM? currentReaction;

  @JsonKey(name: 'blog_reactions')
  final List<ReactionRM>? postReactions;

  @JsonKey(name: 'overall_score')
  final int? overallScore;

  @JsonKey(name: 'has_questions')
  final bool? hasQuiz;

  @override
  List<Object?> get props => [
        id,
        slug,
        title,
        titleMm,
        bodyUpper,
        bodyUpperMm,
        privacy,
        tags,
        viewCount,
        shareCount,
        estimatedDuration,
        featuredVideo,
        createdAt,
        updatedAt,
        blockQuote,
        blocQuoteMm,
        bodyLower,
        bodyLowerMm,
        coverImages,
        isDisplayVideo,
        videoLink,
        author,
        hasRead,
        shareLink,
        tags,
        numberOfReactions,
        numberOfComments,
        currentReaction,
        postReactions,
        overallScore,
        hasQuiz,
      ];

  factory BlogPostRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostRMFromJson(json);

  BlogPost toDomain() => BlogPost(
        id: id?.toString() ?? (throw Exception("id must not be null")),
        slug: slug ?? '',
        title: title ?? '',
        bodyUpper: bodyUpper ?? '',
        privacy: privacy ?? '',
        tags: tags?.map((e) => e.toDomain()).toList() ?? [],
        viewCount: viewCount ?? 0,
        shareCount: shareCount ?? 0,
        estimatedDuration: mapEstablishmentDuration(),
        imageUrl: coverImages?.toDomainModel() ?? ImageUrl.empty(),
        createdAt: createdAt ?? (throw Exception("createdAt must not be null")),
        updatedAt: updatedAt ?? (throw Exception("updatedAt must not be null")),
        blockQuote: blockQuote ?? '',
        bodyLower: bodyLower ?? '',
        categories: categories?.map((e) => e.toDomainModel()).toList() ?? [],
        isDisplayVideo: isDisplayVideo == 1 ? true : false,
        videoLink: videoLink ?? '',
        author: author?.toDomainModel(),
        //TODO: throws exception
        hasRead: hasRead ?? false,
        shareLink: shareLink ?? '',
        numberOfReactions: numberOfReactions ?? 0,
        numberOfComments: numberOfComments ?? 0,
        currentReaction: currentReaction?.toDomainModel(),
        postReactions:
            postReactions?.map((e) => e.toDomainModel()).toList() ?? [],
        overallScore: overallScore ?? 0,
        hasQuiz: hasQuiz ?? false,
      );

  BlogPostDuration mapEstablishmentDuration() {
    return BlogPostDuration(
      duration: estimatedDuration ?? 0,
      unit: estimatedDurationUnit?.toDomainModel() ??
          BlogPostDurationUnit.unknown,
    );
  }
}

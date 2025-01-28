import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class BlogPostEntity extends Equatable {
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
  final BlogPostDurationEntity estimatedDuration;
  final ImageUrlEntity imageUrl;
  final String featuredVideo;
  final DateTime createdAt;
  final DateTime updatedAt;
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

  const BlogPostEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.bodyUpper,
    required this.blockQuote,
    required this.bodyLower,
    required this.privacy,
    required this.viewCount,
    required this.shareCount,
    required this.shareLink,
    required this.estimatedDuration,
    required this.imageUrl,
    required this.featuredVideo,
    required this.createdAt,
    required this.updatedAt,
    required this.isDisplayVideo,
    required this.videoLink,
    required this.author,
    required this.hasRead,
    required this.numberOfReactions,
    required this.numberOfComments,
    required this.overallScore,
    required this.hasQuiz,
    required this.categories,
    required this.tags,
    required this.currentReaction,
    required this.postReactions,
  });

  @override
  List<Object?> get props => [
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
        estimatedDuration,
        featuredVideo,
        createdAt,
        updatedAt,
        isDisplayVideo,
        videoLink,
        hasRead,
        numberOfReactions,
        numberOfComments,
        overallScore,
        hasQuiz,
        categories,
        tags,
        currentReaction,
      ];

  BlogPost toDomainModel() {
    return BlogPost(
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
      estimatedDuration: estimatedDuration.toDomainModel(),
      imageUrl: imageUrl.toDomainModel(),
      isDisplayVideo: isDisplayVideo,
      videoLink: videoLink,
      author: author?.toDomainModel(),
      hasRead: hasRead,
      numberOfReactions: numberOfReactions,
      numberOfComments: numberOfComments,
      overallScore: overallScore,
      hasQuiz: hasQuiz,
      categories: categories.map((e) => e.toDomainModel()).toList(),
      tags: tags.map((e) => e.toDomainModel()).toList(),
      currentReaction: currentReaction?.toDomainModel(),
      postReactions: postReactions.map((e) => e.toDomainModel()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  BlogPostEntity copyWith({
    String? id,
    String? slug,
    String? title,
    String? bodyUpper,
    String? blockQuote,
    String? bodyLower,
    String? privacy,
    int? viewCount,
    int? shareCount,
    String? shareLink,
    BlogPostDurationEntity? estimatedDuration,
    ImageUrlEntity? imageUrl,
    String? featuredVideo,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDisplayVideo,
    String? videoLink,
    UserEntity? author,
    bool? hasRead,
    int? numberOfReactions,
    int? numberOfComments,
    int? overallScore,
    bool? hasQuiz,
    List<BlogPostCategoryEntity>? categories,
    List<BlogPostTagEntity>? tags,
    ReactionEntity? Function()? currentReaction,
    List<ReactionEntity>? postReactions,
  }) {
    return BlogPostEntity(
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
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      imageUrl: imageUrl ?? this.imageUrl,
      featuredVideo: featuredVideo ?? this.featuredVideo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      currentReaction: currentReaction != null ? currentReaction() : this.currentReaction,
      postReactions: postReactions ?? this.postReactions,
    );
  }
}

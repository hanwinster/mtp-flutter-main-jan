import 'package:base/base.dart';
import 'package:domain/domain.dart';

class BlogPost extends Equatable {
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
  final BlogPostDuration estimatedDuration;
  final ImageUrl imageUrl;
  final bool isDisplayVideo;
  final String videoLink;
  final User? author;
  final bool hasRead;
  final int numberOfReactions;
  final int numberOfComments;
  final int overallScore;
  final bool hasQuiz;
  final List<BlogPostCategory> categories;
  final List<BlogPostTag> tags;
  final Reaction? currentReaction;
  final List<Reaction> postReactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BlogPost({
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
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
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
        imageUrl,
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
        updatedAt,
      ];
}

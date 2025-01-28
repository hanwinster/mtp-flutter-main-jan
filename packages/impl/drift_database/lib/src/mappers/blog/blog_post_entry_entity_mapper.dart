import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostEntryEntityMapper on BlogPostEntry {
  BlogPostEntity toEntity() {
    return BlogPostEntity(
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
      estimatedDuration: BlogPostDurationEntity(
        duration: duration,
        unit: durationUnit,
      ),
      imageUrl: imageUrl,
      featuredVideo: featuredVideo,
      isDisplayVideo: isDisplayVideo,
      videoLink: videoLink,
      hasRead: hasRead,
      numberOfReactions: numberOfReactions,
      numberOfComments: numberOfComments,
      overallScore: overallScore,
      hasQuiz: hasQuiz,
      categories: categories,
      tags: tags,
      currentReaction: currentReaction,
      postReactions: postReactions,
      author: author,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

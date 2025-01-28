import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostEntityEntryMapper on BlogPostEntity {
  BlogPostEntry toEntry() {
    return BlogPostEntry(
      id: id,
      slug: slug,
      title: title,
      author: author,
      bodyUpper: bodyUpper,
      blockQuote: blockQuote,
      bodyLower: bodyLower,
      privacy: privacy,
      viewCount: viewCount,
      shareCount: shareCount,
      shareLink: shareLink,
      duration: estimatedDuration.duration,
      durationUnit: estimatedDuration.unit,
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
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  BlogPostTableCompanion toCompanion() {
    return BlogPostTableCompanion.insert(
      id: id,
      slug: slug,
      title: title,
      author: Value(author),
      bodyUpper: bodyUpper,
      blockQuote: blockQuote,
      bodyLower: bodyLower,
      privacy: privacy,
      viewCount: viewCount,
      shareCount: shareCount,
      shareLink: shareLink,
      duration: estimatedDuration.duration,
      durationUnit: estimatedDuration.unit,
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
      currentReaction: Value(currentReaction),
      postReactions: postReactions,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

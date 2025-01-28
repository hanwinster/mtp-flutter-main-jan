import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostCommentEntityEntryMapper on BlogPostCommentEntity {
  BlogPostCommentEntry toEntry() {
    return BlogPostCommentEntry(
      id: id,
      postId: postId,
      comment: text,
      user: user,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      replyCount: replyCount,
      numberOfReactions: numberOfReactions,
      currentReaction: currentReaction,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  BlogPostCommentTableCompanion toCompanion() {
    return BlogPostCommentTableCompanion.insert(
      id: id,
      postId: postId,
      comment: text,
      user: Value(user),
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      replyCount: replyCount,
      numberOfReactions: numberOfReactions,
      currentReaction: Value(currentReaction),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostCommentEntryEntityMapper on BlogPostCommentEntry {
  BlogPostCommentEntity toEntity() {
    return BlogPostCommentEntity(
      id: id,
      postId: postId,
      text: comment,
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
}
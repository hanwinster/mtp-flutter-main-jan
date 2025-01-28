import 'package:api/api.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension BlogPostCommentRMEntityMapper on BlogPostCommentRM {
  BlogPostCommentEntity toEntity() {
    return BlogPostCommentEntity(
      id: id?.toString() ?? (throw 'id is required'),
      postId: postId?.toString() ?? (throw 'postId is required'),
      text: text ?? '',
      user: user?.toEntity(),
      imageUrl: imageUrl ?? '',
      videoUrl: videoUrl ?? '',
      replyCount: replyCount ?? 0,
      numberOfReactions: numberOfReactions ?? 0,
      currentReaction: currentReaction?.toEntity(),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}

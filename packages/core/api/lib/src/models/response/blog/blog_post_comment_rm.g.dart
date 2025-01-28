// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_comment_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostCommentRM _$BlogPostCommentRMFromJson(Map<String, dynamic> json) =>
    BlogPostCommentRM(
      id: (json['id'] as num?)?.toInt(),
      postId: (json['blog_id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      text: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      videoUrl: json['uploaded_video_url'] as String?,
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      replyCount: (json['reply_count'] as num?)?.toInt(),
      currentReaction: json['my_reaction'] == null
          ? null
          : ReactionRM.fromJson(json['my_reaction'] as Map<String, dynamic>),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

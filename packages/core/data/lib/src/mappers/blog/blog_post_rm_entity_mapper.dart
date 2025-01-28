import 'package:api/api.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension BlogPostRMEntityMapper on BlogPostRM {
  BlogPostEntity toEntity() {
    return BlogPostEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      slug: slug ?? '',
      title: title ?? '',
      bodyUpper: bodyUpper ?? '',
      blockQuote: blockQuote ?? '',
      bodyLower: bodyLower ?? '',
      privacy: privacy ?? '',
      viewCount: viewCount ?? 0,
      shareCount: shareCount ?? 0,
      shareLink: shareLink ?? '',
      estimatedDuration: BlogPostDurationEntity(
        duration: estimatedDuration ?? 0,
        unit: estimatedDurationUnit?.toEntity() ??
            BlogPostDurationUnitEntity.unknown,
      ),
      imageUrl: coverImages?.toEntity() ?? ImageUrlEntity.empty(),
      featuredVideo: featuredVideo ?? '',
      isDisplayVideo: isDisplayVideo == 1,
      videoLink: videoLink ?? '',
      hasRead: hasRead ?? false,
      numberOfReactions: numberOfReactions ?? 0,
      numberOfComments: numberOfComments ?? 0,
      overallScore: overallScore ?? 0,
      hasQuiz: hasQuiz ?? false,
      categories: categories?.map((e) => e.toEntity()).toList() ?? [],
      tags: tags?.map((e) => e.toEntity()).toList() ?? [],
      currentReaction: currentReaction?.toEntity(),
      postReactions: postReactions?.map((e) => e.toEntity()).toList() ?? [],
      author: author?.toEntity(),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}

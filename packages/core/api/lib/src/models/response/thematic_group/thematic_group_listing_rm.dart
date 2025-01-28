import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_listing_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupListingRM {
  ThematicGroupListingRM({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.privacy,
    this.categories,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedBy,
    this.deletedAt,
    this.viewCount,
    this.numberOfMembers,
    this.numberOfPosts,
    this.joined,
    this.sentRequest,
    this.isAdmin,
    this.isModerator,
    this.coverImages,
  });

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'privacy')
  final String? privacy;

  @JsonKey(name: 'categories')
  final List<ThematicGroupCategoryRM>? categories;

  @JsonKey(name: 'active')
  final int? active;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'deleted_by')
  final int? deletedBy;

  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @JsonKey(name: 'view_count')
  final int? viewCount;

  @JsonKey(name: 'number_of_members')
  final int? numberOfMembers;

  @JsonKey(name: 'number_of_posts')
  final int? numberOfPosts;

  @JsonKey(name: 'joined')
  final bool? joined;

  @JsonKey(name: 'sent_request')
  final bool? sentRequest;

  @JsonKey(name: 'is_admin')
  final bool? isAdmin;

  @JsonKey(name: 'is_moderator')
  final bool? isModerator;

  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImages;

  ThematicGroupListing toDomainModel() => ThematicGroupListing(
        id: id?.toString() ?? (throw Exception("id is required")),
        title: title ?? '',
        slug: slug ?? '',
        description: description ?? '',
        privacy: privacy ?? '',
        categories: categories?.map((e) => e.toDomainModel()).toList() ?? [],
        active: active ?? 0,
        createdAt: createdAt ?? DateTime.now(),
        updatedAt: updatedAt,
        deletedBy: deletedBy,
        deletedAt: deletedAt,
        viewCount: viewCount ?? 0,
        numberOfMembers: numberOfMembers ?? 0,
        numberOfPosts: numberOfPosts ?? 0,
        joined: joined ?? false,
        sentRequest: sentRequest ?? false,
        isAdmin: isAdmin,
        isModerator: isModerator,
        coverImages: coverImages?.toDomainModel() ?? ImageUrl.empty(),
      );

  factory ThematicGroupListingRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupListingRMFromJson(json);
}

@JsonSerializable()
class PaginationLinksRM {
  PaginationLinksRM({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  @JsonKey(name: 'first')
  final String? first;

  @JsonKey(name: 'last')
  final String? last;

  @JsonKey(name: 'prev')
  final String? prev;

  @JsonKey(name: 'next')
  final String? next;

  PaginationLinks toDomainModel() =>
      PaginationLinks(first: first, last: last, prev: prev, next: next);

  factory PaginationLinksRM.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksRMFromJson(json);
}

@JsonSerializable()
class MetaRM {
  MetaRM({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'from')
  final int from;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total')
  final int total;

  Meta toDomainModel() => Meta(
      currentPage: currentPage,
      from: from,
      lastPage: lastPage,
      perPage: perPage,
      total: total);

  factory MetaRM.fromJson(Map<String, dynamic> json) => _$MetaRMFromJson(json);
}

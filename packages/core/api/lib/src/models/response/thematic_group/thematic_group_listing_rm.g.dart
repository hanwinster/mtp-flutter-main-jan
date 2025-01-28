// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_listing_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupListingRM _$ThematicGroupListingRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupListingRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      privacy: json['privacy'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) =>
              ThematicGroupCategoryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedBy: (json['deleted_by'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      viewCount: (json['view_count'] as num?)?.toInt(),
      numberOfMembers: (json['number_of_members'] as num?)?.toInt(),
      numberOfPosts: (json['number_of_posts'] as num?)?.toInt(),
      joined: json['joined'] as bool?,
      sentRequest: json['sent_request'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      isModerator: json['is_moderator'] as bool?,
      coverImages: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
    );

PaginationLinksRM _$PaginationLinksRMFromJson(Map<String, dynamic> json) =>
    PaginationLinksRM(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PaginationLinksRMToJson(PaginationLinksRM instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaRM _$MetaRMFromJson(Map<String, dynamic> json) => MetaRM(
      currentPage: (json['current_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$MetaRMToJson(MetaRM instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

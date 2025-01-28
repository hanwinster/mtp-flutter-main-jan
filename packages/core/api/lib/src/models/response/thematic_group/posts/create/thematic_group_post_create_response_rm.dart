import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart'; // Import your domain models here

part 'thematic_group_post_create_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupPostCreateResponseRM {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'tgroup_id')
  final int? tgroupId;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'youtube_link')
  final String? youtubeLink;
  @JsonKey(name: 'tagged_users')
  final List<String>? taggedUsers;
  @JsonKey(name: 'shares')
  final int? shares;
  @JsonKey(name: 'view_count')
  final int? viewCount;
  @JsonKey(name: 'active')
  final int? active;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'user_avatar')
  final String? userAvatar;
  @JsonKey(name: 'is_owner')
  final bool? isOwner;
  @JsonKey(name: 'my_reaction')
  final String? myReaction;
  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImages;
  @JsonKey(name: 'user')
  final UserRM? user;

  ThematicGroupPostCreateResponseRM({
    this.id,
    this.userId,
    this.tgroupId,
    this.slug,
    this.description,
    this.youtubeLink,
    this.taggedUsers,
    this.shares,
    this.viewCount,
    this.active,
    this.username,
    this.userAvatar,
    this.isOwner,
    this.myReaction,
    this.coverImages,
    this.user,
  });

  factory ThematicGroupPostCreateResponseRM.fromJson(
          Map<String, dynamic> json) =>
      _$ThematicGroupPostCreateResponseRMFromJson(json);

  ThematicGroupPostCreateResponse toDomainModel() {
    return ThematicGroupPostCreateResponse(
      id: id ?? (throw Exception('id is null')),
      userId: userId ?? 0,
      tgroupId: tgroupId ?? 0,
      slug: slug ?? '',
      description: description ?? '',
      youtubeLink: youtubeLink,
      taggedUsers: taggedUsers,
      shares: shares ?? 0,
      viewCount: viewCount ?? 0,
      active: active ?? 0,
      username: username ?? '',
      userAvatar: userAvatar,
      isOwner: isOwner ?? false,
      myReaction: myReaction,
      coverImages: coverImages?.toDomainModel() ?? ImageUrl.empty(),
      user: user?.toDomainModel() ?? (throw Exception('user is null')),
    );
  }
}

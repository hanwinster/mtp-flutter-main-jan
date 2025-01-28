import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ThematicGroupPostCreateResponse extends Equatable {
  final int id;
  final int userId;
  final int tgroupId;
  final String slug;
  final String description;
  final String? youtubeLink;
  final List<String>? taggedUsers;
  final int shares;
  final int viewCount;
  final int active;
  final String username;
  final String? userAvatar;
  final bool isOwner;
  final String? myReaction;
  final ImageUrl coverImages;
  final User user;

  const ThematicGroupPostCreateResponse({
    required this.id,
    required this.userId,
    required this.tgroupId,
    required this.slug,
    required this.description,
    this.youtubeLink,
    this.taggedUsers,
    required this.shares,
    required this.viewCount,
    required this.active,
    required this.username,
    this.userAvatar,
    required this.isOwner,
    this.myReaction,
    required this.coverImages,
    required this.user,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    tgroupId,
    slug,
    description,
    youtubeLink,
    taggedUsers,
    shares,
    viewCount,
    active,
    username,
    userAvatar,
    isOwner,
    myReaction,
    coverImages,
    user,
  ];
}
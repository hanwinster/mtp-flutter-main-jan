import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ThematicGroupListing extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String privacy;
  final List<ThematicGroupCategory> categories;
  final int active;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? deletedBy;
  final DateTime? deletedAt;
  final int viewCount;
  final int numberOfMembers;
  final int numberOfPosts;
  final bool joined;
  final bool sentRequest;
  final bool? isAdmin;
  final bool? isModerator;
  final ImageUrl coverImages;

  const ThematicGroupListing({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.privacy,
    required this.categories,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.deletedBy,
    this.deletedAt,
    required this.viewCount,
    required this.numberOfMembers,
    required this.numberOfPosts,
    required this.joined,
    required this.sentRequest,
    this.isAdmin,
    this.isModerator,
    required this.coverImages,
  });

  bool get isPrivate => privacy == 'private';

  @override
  List<Object?> get props => [
    id,
    title,
    slug,
    description,
    privacy,
    categories,
    active,
    createdAt,
    updatedAt,
    deletedBy,
    deletedAt,
    viewCount,
    numberOfMembers,
    numberOfPosts,
    joined,
    sentRequest,
    isAdmin,
    isModerator,
    coverImages,
  ];
}

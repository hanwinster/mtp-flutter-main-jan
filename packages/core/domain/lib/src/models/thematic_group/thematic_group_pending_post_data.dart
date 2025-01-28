import 'dart:io';

import '../../../domain.dart';

class GroupPendingPostData {
  final User user;
  final DateTime createdAt;
  final File? imageUrl;
  final File? uploadedVideoUrl;
  final String? description;

  GroupPendingPostData({
    required this.user,
    required this.createdAt,
    this.imageUrl,
    this.uploadedVideoUrl,
    this.description,
  });
}

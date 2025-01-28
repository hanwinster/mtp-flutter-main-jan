import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_post_comment_user_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupPostCommentUserRM {
  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'user_avatar')
  final String? userAvatar;

  ThematicGroupPostCommentUserRM({
     this.userId,
     this.userName,
    this.userAvatar,
  });

  factory ThematicGroupPostCommentUserRM.fromJson(Map<String, dynamic> json) => _$ThematicGroupPostCommentUserRMFromJson(json);

  ThematicGroupPostCommentUser toDomainModel() {
    return ThematicGroupPostCommentUser(
      userId: userId?.toString() ?? '',
      userName: userName ?? '',
      userAvatar: userAvatar ?? '',
    );
  }
}
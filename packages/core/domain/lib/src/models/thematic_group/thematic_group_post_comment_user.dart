import 'package:base/base.dart';

class ThematicGroupPostCommentUser extends Equatable {
  final String userId;
  final String userName;
  final String userAvatar;

  const ThematicGroupPostCommentUser({
    required this.userId,
    required this.userName,
    required this.userAvatar,
  });

  factory ThematicGroupPostCommentUser.empty() {
    return ThematicGroupPostCommentUser(
      userId: '',
      userName: '',
      userAvatar: '',
    );
  }

  @override
  List<Object> get props => [userId, userName, userAvatar];
}

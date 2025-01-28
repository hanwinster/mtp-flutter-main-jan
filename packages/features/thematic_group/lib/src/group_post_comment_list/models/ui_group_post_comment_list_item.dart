import 'package:base/base.dart';
import 'package:domain/domain.dart';

import 'models.dart';

class UiGroupPostCommentListItem extends Equatable {
  final ThematicGroupPostComment comment;
  final bool isOwner;
  final List<UiGroupPostCommentReplyListItem> replies;

  const UiGroupPostCommentListItem({
    required this.comment,
    required this.isOwner,
    required this.replies,
  });

  @override
  List<Object> get props => [comment, isOwner, replies];

  UiGroupPostCommentListItem copyWith({
    ThematicGroupPostComment? comment,
    bool? isOwner,
    List<UiGroupPostCommentReplyListItem>? replies,
  }) {
    return UiGroupPostCommentListItem(
      comment: comment ?? this.comment,
      isOwner: isOwner ?? this.isOwner,
      replies: replies ?? this.replies,
    );
  }
}
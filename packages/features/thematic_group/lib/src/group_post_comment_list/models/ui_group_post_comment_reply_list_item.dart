import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UiGroupPostCommentReplyListItem extends Equatable {
  final ThematicGroupPostCommentReply reply;
  final bool isOwner;

  const UiGroupPostCommentReplyListItem({
    required this.reply,
    required this.isOwner,
  });

  @override
  List<Object> get props => [reply, isOwner];

  UiGroupPostCommentReplyListItem copyWith({
    ThematicGroupPostCommentReply? reply,
    bool? isOwner,
  }) {
    return UiGroupPostCommentReplyListItem(
      reply: reply ?? this.reply,
      isOwner: isOwner ?? this.isOwner,
    );
  }
}
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UiPostCommentItem extends Equatable {
  final BlogPostComment comment;
  final bool isOwner;

  const UiPostCommentItem({
    required this.comment,
    required this.isOwner,
  });

  @override
  List<Object> get props => [comment, isOwner];
}
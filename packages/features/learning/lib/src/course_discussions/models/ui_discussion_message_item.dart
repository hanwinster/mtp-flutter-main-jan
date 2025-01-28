import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UiDiscussionMessageItem extends Equatable {
  final CourseDiscussionMessage message;
  final bool isMine;

  const UiDiscussionMessageItem({
    required this.message,
    required this.isMine,
  });

  @override
  List<Object> get props => [message, isMine];
}
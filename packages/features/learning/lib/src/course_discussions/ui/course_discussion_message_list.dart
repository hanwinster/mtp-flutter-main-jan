import 'package:flutter/cupertino.dart';
import 'package:learning/src/course_discussions/models/models.dart';
import 'package:ui/ui.dart';

import 'components/components.dart';

class CourseDiscussionMessageList extends StatelessWidget {
  const CourseDiscussionMessageList({
    super.key,
    required this.items,
  });

  final List<UiDiscussionMessageItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: Grid.one),
      padding: const EdgeInsets.only(
        left: Grid.two,
        right: Grid.two,
        top: Grid.two,
        bottom: 120,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CourseDiscussionMessageTile(item: item);
      },
    );
  }
}

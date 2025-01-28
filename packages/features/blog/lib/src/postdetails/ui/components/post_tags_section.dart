import 'package:blog/src/common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/post_details_bloc.dart';

class PostTagsSliverSection extends StatelessWidget {
  const PostTagsSliverSection({
    super.key,
    required this.onTagTapped,
  });

  final Function(BlogPostTag) onTagTapped;

  @override
  Widget build(BuildContext context) {
    final post = context
        .select((PostDetailsBloc bloc) => bloc.state.postUiState)
        .dataOrNull;
    if (post == null) {
      return const SliverSizedBox(width: 0, height: 0);
    }

    return SliverSizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            text: context.l10n.postLabelSubtitleTags,
          ),
          const SizedBox(height: Grid.two),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (final (index, tag) in post.tags.indexed) ...[
                  if (index > 0) const SizedBox(width: Grid.one),
                  TagListItem(
                    item: tag,
                    onTapped: (tag) => onTagTapped(tag),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

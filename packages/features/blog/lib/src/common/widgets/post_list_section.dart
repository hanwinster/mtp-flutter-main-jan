import 'package:blog/blog.dart';
import 'package:blog/src/common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../blog/bloc/bloc.dart';

class PostListSection extends StatelessWidget {
  const PostListSection({
    super.key,
    required this.title,
    required this.itemsUiState,
    required this.onPostTapped,
  });

  final String title;
  final UiState<List<BlogPost>> itemsUiState;
  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: itemsUiState.toView(
            context,
            successViewBuilder: (items) {
              return PostListView(
                items: items,
                onPostTapped: onPostTapped,
              );
            },
            loadingViewBuilder: (items) {
              return const PostListLoading();
            },
            emptyViewBuilder: (_) {
              return MtpEmpty(message: context.l10n.blogLabelPostsNotFound);
            },
            onRetried: () {
              context.read<BlogBloc>()
                  .add(const BlogRecommendedPostsFetched());
            },
          ),
        ),
      ],
    );
  }
}

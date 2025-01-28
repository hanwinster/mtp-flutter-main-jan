import 'package:blog/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/post_list_bloc.dart';

import 'post_list_screen_entry.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({
    super.key,
    required this.title,
    required this.onPostTapped,
  });

  final String title;
  final PostTapCallback onPostTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          return state.postsUiState.toView(
            context,
            successViewBuilder: (posts) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Grid.two,
                  vertical: Grid.two,
                ),
                child: ListView.separated(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostListItem(
                        item: post,
                        onPostTapped: (item) {
                          onPostTapped(item);
                        });
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              );
            },
            onRetried: () {
              context.read<PostListBloc>().add(const PostListPostsFetched());
            },
          );
        },
      ),
    );
  }
}

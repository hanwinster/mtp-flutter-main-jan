import 'package:blog/src/postlist/ui/post_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_list_bloc.dart';
import '../models/post_list_filter.dart';

typedef PostTapCallback = void Function(String postId);

class PostListScreenEntry extends StatelessWidget {
  const PostListScreenEntry({
    super.key,
    required this.title,
    required this.filter,
    required this.onPostTapped,
  });

  final String title;
  final PostListFilter filter;
  final PostTapCallback onPostTapped;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostListBloc(filter: filter)..add(const PostListPostsFetched()),
      child: PostListScreen(
        title: title,
        onPostTapped: onPostTapped,
      ),
    );
  }
}

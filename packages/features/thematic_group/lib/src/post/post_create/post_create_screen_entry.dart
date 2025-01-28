import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/post/post_create/bloc/post_create_bloc.dart';
import 'package:thematic_group/src/post/post_create/post_create_screen.dart';

class PostCreateScreenEntry extends StatelessWidget {
  final String groupId;

  const PostCreateScreenEntry({
    super.key,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCreateBloc()..add(PostCreateUserFetched()),
      child: PostCreateScreen(
        groupId: groupId,
      ),
    );
  }
}

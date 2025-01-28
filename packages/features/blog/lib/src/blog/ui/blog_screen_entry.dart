import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';
import 'blog_screen.dart';

typedef OnPostTapped = void Function(String postId);

class BlogScreenEntry extends StatelessWidget {
  const BlogScreenEntry({
    super.key,
    required this.drawer,
    required this.onPostTapped,
    required this.scaffoldKey,
    required this.onNotiClick,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final OnPostTapped onPostTapped;
  final NotificationActionClickCallback onNotiClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc()
        ..add(const BlogLatestPostsFetched())
        ..add(const BlogPostCategoriesFetched())
        ..add(const BlogRecommendedPostsFetched()),
      child: BlogScreen(
        drawer: drawer,
        scaffoldKey: scaffoldKey,
        onPostTapped: onPostTapped,
        onNotiClick: onNotiClick,
      ),
    );
  }
}

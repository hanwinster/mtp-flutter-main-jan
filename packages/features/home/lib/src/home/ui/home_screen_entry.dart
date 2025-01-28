import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/home_bloc/home_bloc.dart';
import 'home_screen.dart';

typedef CourseCategoryClickCallback = void Function({
  required CourseCategory category,
});

typedef OfflineCoursesClickCallback = void Function();
typedef ChatGPTClickCallback = void Function();
typedef CommunityVideoListClickCallback = void Function();
typedef CommunityVideoDetailClickCallback = void Function(String videoId);
typedef ExploreCourseClickCallback = void Function();
typedef CourseClickCallback = void Function(String courseId);

class HomeScreenEntry extends StatelessWidget {
  const HomeScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onCourseCategoryClick,
    required this.onNotiClick,
    required this.onOfflineCoursesClick,
    required this.onChatGPTClick,
    required this.onCommunityVideoListClick,
    required this.onCommunityVideoDetailClick,
    required this.onExploreCourseClick,
    required this.onCourseClick,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final CourseCategoryClickCallback onCourseCategoryClick;
  final NotificationActionClickCallback onNotiClick;
  final OfflineCoursesClickCallback onOfflineCoursesClick;
  final ChatGPTClickCallback onChatGPTClick;
  final CommunityVideoListClickCallback onCommunityVideoListClick;
  final CommunityVideoDetailClickCallback onCommunityVideoDetailClick;
  final ExploreCourseClickCallback onExploreCourseClick;
  final CourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(const HomeCourseCategoriesFetched())
          ..add(const HomeCoursesFetched())
        ..add(const VersionCheckRequested()),
      child: HomeScreen(
        drawer: drawer,
        scaffoldKey: scaffoldKey,
        onCourseCategoryClick: onCourseCategoryClick,
        onNotiClick: onNotiClick,
        onOfflineCoursesClick: onOfflineCoursesClick,
        onChatGPTClick: onChatGPTClick,
        onCommunityVideoListClick: onCommunityVideoListClick,
        onCommunityVideoDetailClick: onCommunityVideoDetailClick,
        onExploreCourseClick: onExploreCourseClick,
        onCourseClick: onCourseClick,
      ),
    );
  }
}

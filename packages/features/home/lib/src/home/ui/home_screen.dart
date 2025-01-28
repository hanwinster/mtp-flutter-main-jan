import 'package:debug/debug.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video/bloc/community_video_bloc.dart';
import 'package:home/src/home/ui/components/community_video_section.dart';
import 'package:home/src/home/ui/components/slider_section.dart';
import 'package:open_store/open_store.dart';
import 'package:ui/ui.dart';

import '../../../home.dart';
import '../bloc/home_bloc/home_bloc.dart';
import 'components/components.dart';
import 'components/user_guide_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.versionUiState != current.versionUiState,
      listener: (context, state) async {
        if (state.versionUiState is UiStateSuccess<Version>) {
          final serverVersion =
              (state.versionUiState as UiStateSuccess<Version>).data;
          final needsUpdate = await _needsUpdate(serverVersion);
          if (needsUpdate) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text(context.l10n.updateTitle,
                    style: TextStyle(fontSize: 18)),
                content: Text(
                    context.l10n
                        .updateversionAvailable(serverVersion.versionCode),
                    style: TextStyle(fontSize: 16)),
                actions: [
                  TextButton(
                    child:
                        Text(context.l10n.courseButtonTextCancelCourseConfirm),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(context.l10n.btnUpdate),
                    onPressed: () {
                      Navigator.pop(context);
                      // final androidPackageName = await getAndroidPackageName();
                      final androidPackageName = 'com.misfit.mtp';
                      OpenStore.instance.open(
                        appStoreId: iosAppStoreId,
                        androidAppBundleId: androidPackageName,
                      );
                    },
                  ),
                ],
              ),
            );
          }
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer,
        appBar: buildMtpPrimaryAppBar(
          context,
          scaffoldKey,
          actions: [
            NotificationActionButton(
              onClicked: onNotiClick,
            ),
          ],
        ),
        body: BodyContainer(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: Grid.two),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Grid.two),
                  child: CourseSearchBar(onTap: () => onExploreCourseClick()),
                ),
                const SizedBox(height: Grid.two),
                const SliderSection(),
                const SizedBox(height: Grid.two),
                OfflineSection(
                  onOfflineCoursesClick: onOfflineCoursesClick,
                ),
                const SizedBox(height: Grid.two),
                CourseCategoriesSection(
                  onCourseCategoryClick: onCourseCategoryClick,
                ),
                const SizedBox(height: Grid.two),
                CoursesSection(
                  onExploreCourseClick: onExploreCourseClick,
                  onCourseClick: onCourseClick,
                ),
                const SizedBox(height: Grid.two),
                const UserGuideComponent(),
                const SizedBox(height: Grid.two),
                BlocProvider(
                  create: (context) => CommunityVideoBloc()
                    ..add(
                      GetCommunityVideoListEvent(),
                    ),
                  child: CommunityVideoSection(
                    onCommunityVideoListClick: onCommunityVideoListClick,
                    onCommunityVideoDetailClick: (value) =>
                        onCommunityVideoDetailClick(value),
                  ),
                ),
              ],
            ),
          ),
        ),
        endDrawer: debugDrawer,
      ),
    );
  }

  Future<bool> _needsUpdate(Version serverVersion) async {
    final currentVersion = await getAppVersion();
    return serverVersion.versionCode.compareTo(currentVersion) > 0;
  }
}

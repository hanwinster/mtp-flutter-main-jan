import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_detail/pages/pages.dart';
import 'package:ui/ui.dart';

import '../../../course_discussions/course_discussions.dart';
import '../../../course_reviews/course_reviews.dart';

class BodySection extends StatefulWidget {
  const BodySection({
    super.key,
    required this.course,
    required this.isOfflineMode,
    required this.isLoggedIn,
    required this.onLoginEvent,
  });

  final Course course;
  final bool isOfflineMode;
  final bool isLoggedIn;
  final LoginEventEventHandler onLoginEvent;

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final int _tabCount = 4;
  final int _overviewTabIndex = 0;
  final int _lectureTabIndex = 1;
  final int _discussionTabIndex = 2;
  final int _reviewTabIndex = 3;
  final int _relatedResourcesTabIndex = 4;

  String _getTabName(BuildContext context, int index) {
    if (index == _overviewTabIndex) {
      return context.l10n.courseDetailsTabTitleOverview;
    } else if (index == _lectureTabIndex) {
      return context.l10n.courseDetailsTabTitleLectures;
    } else if (index == _discussionTabIndex) {
      return context.l10n.courseDetailsTabTitleDiscussion;
    } else if (index == _reviewTabIndex) {
      return context.l10n.courseDetailsTabTitleReview;
    } else if (index == _relatedResourcesTabIndex) {
      return context.l10n.courseDetailsTabTitleRelatedResources;
    } else {
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabCount, vsync: this);
  }

  List<Widget> _buildTabPages() {
    return List.generate(_tabCount, (e) => e).mapIndexed((index, tab) {
      return Builder(
        builder: (context) {
          if (index == _overviewTabIndex) {
            return CourseOverviewPage(
              course: widget.course,
              isOfflineMode: widget.isOfflineMode,
            );
          } else if (index == _lectureTabIndex) {
            return CourseSyllabusPage(course: widget.course);
          } else if (index == _discussionTabIndex) {
            final discussion = widget.course.discussion;
            if (!widget.course.isAllowDiscussion || discussion == null) {
              return const SizedBox.shrink();
            }

            return CourseDiscussionsScreenEntry(
              courseId: widget.course.id,
              discussionId: discussion.id,
              hasEnrolled: widget.course.hasUserTakenCourse,
              isLoggedIn: widget.isLoggedIn,
              onLoginEvent: widget.onLoginEvent,
            );
          } else if (index == _reviewTabIndex) {
            return CourseReviewsScreenEntry(
              courseId: widget.course.id,
              hasEnrolled: widget.course.hasUserTakenCourse,
              isLoggedIn: widget.isLoggedIn,
              onLoginEvent: widget.onLoginEvent,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: const EdgeInsets.only(left: Grid.two),
          controller: _tabController,
          tabs: List.generate(_tabCount, (e) => e)
              .mapIndexed(
                  (index, tab) => Tab(text: _getTabName(context, index)))
              .toList(),
          labelColor: context.colorScheme.onSurface,
          isScrollable: true,
        ),
        Expanded(
          child: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: _buildTabPages(),
            ),
          ),
        ),
      ],
    );
  }
}

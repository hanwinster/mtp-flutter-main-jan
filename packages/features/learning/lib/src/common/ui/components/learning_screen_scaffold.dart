import 'package:flutter/material.dart';
import 'package:learning/src/common/common.dart';
import 'package:learning/src/common/ui/components/learning_app_bar_back_button.dart';
import 'package:ui/ui.dart';

class LearningScreenScaffold extends StatelessWidget {
  const LearningScreenScaffold({
    super.key,
    this.title = '',
    required this.slivers,
    required this.navigationEventHandler,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
  });

  final String title;
  final List<Widget> slivers;
  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return LearningQuitPopScope(
      navigationEventHandler: navigationEventHandler,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: title.isNotEmpty ? Text(title) : null,
              floating: true,
              snap: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: const [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: Grid.one),
                    child: CircularLearningProgress(),
                  ),
                ),
              ],
              leading: const LearningAppBarBackButton(),
            ),
            if (isOfflineMode) ...[
              SliverToBoxAdapter(
                child: OfflineLearningModeIndicator(
                  onSwitchToOnline: onSwitchToOnline,
                ),
              ),
              const SliverSizedBox(height: Grid.two),
            ],
            ...slivers,
          ],
        ),
      ),
    );
  }
}

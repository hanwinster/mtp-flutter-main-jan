part of 'app_shell_routes.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
///
/// https://github.com/flutter/packages/blob/main/packages/go_router_builder/example/lib/stateful_shell_route_example.dart
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in a custom container
  /// ([AnimatedBranchContainer]).
  final List<Widget> children;

  List<BottomNavigationBarItem> _bottomNavItems(
      BuildContext context, int currentIndex) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: MtpAssets.icons.navHome.image(
            width: _iconSize(context, currentIndex, homeIndex),
            height: _iconSize(context, currentIndex, homeIndex),
            color: _navItemColor(context, currentIndex, homeIndex)),
        label: context.l10n.navTitleHome,
      ),
      BottomNavigationBarItem(
        icon: MtpAssets.icons.navMyCourses.image(
            width: _iconSize(context, currentIndex, myCoursesIndex),
            height: _iconSize(context, currentIndex, myCoursesIndex),
            color: _navItemColor(context, currentIndex, myCoursesIndex)),
        label: context.l10n.navTitleMyCourses,
      ),
      BottomNavigationBarItem(
        icon: MtpAssets.icons.navGroup.image(
            width: _iconSize(context, currentIndex, groupIndex),
            height: _iconSize(context, currentIndex, groupIndex),
            color: _navItemColor(context, currentIndex, groupIndex)),
        label: context.l10n.navTitleGroup,
      ),
      BottomNavigationBarItem(
        icon: MtpAssets.icons.navBlog.image(
            width: _iconSize(context, currentIndex, blogIndex),
            height: _iconSize(context, currentIndex, blogIndex),
            color: _navItemColor(context, currentIndex, blogIndex)),
        label: context.l10n.navTitleBlog,
      ),
      BottomNavigationBarItem(
        icon: MtpAssets.icons.navLibrary.image(
            width: _iconSize(context, currentIndex, libraryIndex),
            height: _iconSize(context, currentIndex, libraryIndex),
            color: _navItemColor(context, currentIndex, libraryIndex)),
        label: context.l10n.navTitleLibrary,
      ),
    ];
  }

  Color _navItemColor(BuildContext context, int currentIndex, int itemIndex) {
    return currentIndex == itemIndex
        ? context.colorScheme.primary
        : context.colorScheme.onSurface.withOpacity(0.5);
  }

  double _iconSize(BuildContext context, int currentIndex, int itemIndex) {
    return currentIndex == itemIndex ? 24 : 20;
  }

  int _currentIndex(BuildContext context) {
    return navigationShell.currentIndex;
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final int selectedIndex = _currentIndex(context);
    return BottomNavigationBar(
      selectedFontSize: 9,
      unselectedFontSize: 9,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: context.colorScheme.onSurface.withOpacity(0.87),
      selectedItemColor: context.colorScheme.primary,
      items: _bottomNavItems(context, selectedIndex),
      currentIndex: selectedIndex,
      onTap: (int index) => _onTap(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: _currentIndex(context),
        children: children,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

/// Custom branch Navigator container that provides animated transitions
/// when switching branches.
class AnimatedBranchContainer extends StatelessWidget {
  /// Creates a AnimatedBranchContainer
  const AnimatedBranchContainer(
      {super.key, required this.currentIndex, required this.children});

  /// The index (in [children]) of the branch Navigator to display.
  final int currentIndex;

  /// The children (branch Navigators) to display in this container.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        return AnimatedOpacity(
          opacity: index == currentIndex ? 1 : 0,
          duration: const Duration(milliseconds: 400),
          child: _branchNavigatorWrapper(index, navigator),
        );
      },
    ).toList());
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}

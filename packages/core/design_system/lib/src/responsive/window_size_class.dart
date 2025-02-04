enum WindowSizeClass {
  compact._('compact', 0, 600),
  medium._('medium', 600, 840),
  expanded._('expanded', 840, 1200),
  large._('large', 1200, 1600),
  xlarge._('xlarge', 1600, double.infinity);

  const WindowSizeClass._(
    this.name,
    this.minWidth,
    this.maxWidth,
  );

  final String name;
  final double minWidth;
  final double maxWidth;

  factory WindowSizeClass.fromWidth(double width) {
    if (width < 600) {
      return WindowSizeClass.compact;
    } else if (width >= 600 && width < 840) {
      return WindowSizeClass.medium;
    } else if (width >= 840 && width < 1200) {
      return WindowSizeClass.expanded;
    } else if (width >= 1200 && width < 1600) {
      return WindowSizeClass.large;
    } else {
      return WindowSizeClass.xlarge;
    }
  }

  bool largerThan(WindowSizeClass other) {
    return minWidth > other.maxWidth;
  }

  bool largerOrEqualTo(WindowSizeClass other) {
    return minWidth >= other.minWidth;
  }

  bool smallerThan(WindowSizeClass other) {
    return maxWidth < other.minWidth;
  }

  bool smallerOrEqualTo(WindowSizeClass other) {
    return maxWidth <= other.maxWidth;
  }
}

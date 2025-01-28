import 'package:flutter/material.dart';

class InheritedLocale extends InheritedWidget {
  static const englishLocale = Locale('en');
  static const thaiLocale = Locale('th');
  static const burmeseLocale = Locale('my');
  static const khmarLocale = Locale('km');
  static const vietnameseLocale = Locale('vi');
  static const laoLocale = Locale('lo');
  final ValueNotifier<Locale> locale;

  const InheritedLocale({
    super.key,
    required super.child,
    required this.locale,
  });

  static InheritedLocale of(BuildContext context) {
    final ref = context.dependOnInheritedWidgetOfExactType<InheritedLocale>();
    assert(ref != null, "No 'InheritedLocale' found above in the tree.");
    return ref!;
  }

  @override
  bool updateShouldNotify(covariant InheritedLocale oldWidget) {
    return locale != oldWidget.locale;
  }
}

extension InheritedLocaleExt on BuildContext {
  // ValueNotifier<Locale> get locale => InheritedLocale.of(this).locale;
}

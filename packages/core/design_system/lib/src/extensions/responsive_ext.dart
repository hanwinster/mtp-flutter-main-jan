import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveExt on BuildContext {
  ResponsiveBreakpointsData get breakpoints => ResponsiveBreakpoints.of(this);
}
import 'package:flutter/material.dart';

import 'course_guest_user_screen.dart';

typedef LoginClickCallback = void Function();

class CourseGuestUserScreenEntry extends StatelessWidget {
  const CourseGuestUserScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onLoginClicked,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final LoginClickCallback onLoginClicked;

  @override
  Widget build(BuildContext context) {
    return CourseGuestUserScreen(
      drawer: drawer,
      scaffoldKey: scaffoldKey,
      onLoginClicked: onLoginClicked,
    );
  }
}

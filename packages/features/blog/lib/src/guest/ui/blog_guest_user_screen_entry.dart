import 'package:flutter/material.dart';

import 'blog_guest_user_screen.dart';

typedef LoginClickCallback = void Function();

class BlogGuestUserScreenEntry extends StatelessWidget {
  const BlogGuestUserScreenEntry({
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
    return BlogGuestUserScreen(
      drawer: drawer,
      scaffoldKey: scaffoldKey,
      onLoginClicked: onLoginClicked,
    );
  }
}

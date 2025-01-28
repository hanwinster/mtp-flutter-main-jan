import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class XApiScreenContent extends StatelessWidget {
  const XApiScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XApiCourseBloc, XApiCourseState>(
      buildWhen: (previous, current) =>
          previous.launchLink != current.launchLink,
      builder: (context, state) {
        final launchLink = state.launchLink;
        if (state.launchLink.isEmpty) {
          return const SizedBox.shrink();
        }

        return MtpWebView(url: launchLink);
      },
    );
  }
}

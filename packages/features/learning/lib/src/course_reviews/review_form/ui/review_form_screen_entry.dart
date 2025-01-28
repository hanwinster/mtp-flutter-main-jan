import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'review_form_screen.dart';

class ReviewFormScreenEntry extends StatelessWidget {
  const ReviewFormScreenEntry({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewFormBloc(
        courseId: courseId,
      ),
      child: const ReviewFormScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/common.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/evaluation_bloc.dart';
import 'evaluation_screen.dart';

class EvaluationScreenEntry extends StatelessWidget {
  const EvaluationScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.onCompleteEvent,
  });

  final String courseId;
  final String learnerId;
  final CompleteEventHandler onCompleteEvent;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EvaluationBloc(
            courseId: courseId,
          )..add(const EvaluationQuestionsFetched()),
        ),
        BlocProvider(
          create: (context) => CourseLearnerBloc(
            learnerId: learnerId,
          )..add(const CourseLearnerFetched()),
        ),
      ],
      child: EvaluationScreen(
        onCompleteEvent: onCompleteEvent,
      ),
    );
  }
}

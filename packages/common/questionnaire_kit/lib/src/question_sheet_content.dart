import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

import 'bloc/question_sheet_bloc.dart';

class QuestionSheetContent extends StatefulWidget {
  const QuestionSheetContent({
    super.key,
    this.title = '',
    this.appBar,
    this.withScaffold = true,
    this.submitButton,
    this.decoration = const QuestionSheetDecoration(),
    this.onSubmit,
    required this.controller,
    this.isEvaluable = true,
    this.onEvaluationCompleted,
    this.onValidationCompleted,
  });

  final String title;
  final AppBar? appBar;
  final bool withScaffold;
  final QuestionSheetDecoration decoration;
  final Widget? submitButton;
  final QuestionSheetController controller;
  final bool isEvaluable;
  final Function(EvaluationResult)? onEvaluationCompleted;
  final Function()? onValidationCompleted;

  final Function(Map<String, UserAnswer> answers)? onSubmit;

  @override
  State<QuestionSheetContent> createState() => _QuestionSheetContentState();
}

class _QuestionSheetContentState extends State<QuestionSheetContent>
    with QuestionComponentBuilder {
  AppBar get _appBar => widget.appBar ?? AppBar(title: Text(widget.title));

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionSheetBloc, QuestionSheetState>(
      listenWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult;
      },
      listener: (context, state) {
        print('Evaluation result: ${state.evaluationResult}');
        if (widget.onEvaluationCompleted != null &&
            state.evaluationResult != null) {
          widget.onEvaluationCompleted!(state.evaluationResult!);
        }
        if (widget.onValidationCompleted != null &&
            state.evaluationResult?.isCorrect == true) {
          widget.onValidationCompleted!();
        }
      },
      child: BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
        buildWhen: (previous, current) {
          return previous.questions != current.questions;
        },
        builder: (context, state) {
          final questions = state.questions;
          if (questions.isEmpty) {
            Widget emptyWidget = Center(
              child: Text(context.l10n.noQuestions),
            );
            return widget.withScaffold
                ? Scaffold(
                    appBar: _appBar,
                    body: emptyWidget,
                  )
                : emptyWidget;
          }

          final content = SingleChildScrollView(
            child: Padding(
              padding: widget.decoration.contentPadding,
              child: Column(
                crossAxisAlignment: widget.decoration.crossAxisAlignment,
                children: [
                  for (final (index, question) in questions.indexed) ...[
                    if (index > 0) widget.decoration.separator,
                    buildQuestionComponent(
                      context,
                      question: question,
                      onAnswered: (id, value) {
                        widget.controller.updateAnswer(id, value);
                      },
                      decoration: widget.decoration,
                    ),
                  ],
                  if (widget.submitButton != null) ...[
                    const SizedBox(height: 16),
                    widget.submitButton!,
                  ],
                ],
              ),
            ),
          );

          return widget.withScaffold
              ? Scaffold(
                  appBar: _appBar,
                  body: content,
                )
              : content;
        },
      ),
    );
  }
}

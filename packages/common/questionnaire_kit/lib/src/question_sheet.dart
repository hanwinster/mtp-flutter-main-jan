import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/question_sheet_content.dart';

class QuestionSheet extends StatefulWidget {
  const QuestionSheet({
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
  State<QuestionSheet> createState() => _QuestionSheetState();
}

class _QuestionSheetState extends State<QuestionSheet> {
  late QuestionSheetController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _controller.bloc,
      child: QuestionSheetContent(
        title: widget.title,
        appBar: widget.appBar,
        withScaffold: widget.withScaffold,
        submitButton: widget.submitButton,
        decoration: widget.decoration,
        onSubmit: widget.onSubmit,
        controller: widget.controller,
        isEvaluable: widget.isEvaluable,
        onEvaluationCompleted: widget.onEvaluationCompleted,
        onValidationCompleted: widget.onValidationCompleted,
      ),
    );
  }
}
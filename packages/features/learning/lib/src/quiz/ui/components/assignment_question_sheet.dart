import 'dart:io';

import 'package:domain/domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class AssignmentQuestionSheet extends StatefulWidget {
  const AssignmentQuestionSheet({
    super.key,
    required this.quiz,
  });

  final LearningQuiz quiz;

  @override
  State<AssignmentQuestionSheet> createState() =>
      _AssignmentQuestionSheetState();
}

class _AssignmentQuestionSheetState extends State<AssignmentQuestionSheet> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    final question =
        widget.quiz.questions.firstOrNull as LearningQuizAssignmentQuestion?;
    if (question == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MtpHtml(
          widget.quiz.title,
          textStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: Grid.one),
        if (question.attachedFileMedia != null) ...[
          MtpMediaView(
            media: question.attachedFileMedia!,
          ),
          const SizedBox(height: Grid.one),
        ],
        if (question.userAnswer != null) ...[
          const SizedBox(height: Grid.one),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  context.l10n.courseAssignmentLabelFeedbackFromInstructor,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                if (question.userAnswer!.comment.isEmpty)
                  Text(
                    context.l10n.courseAssignmentLabelNoFeedback,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.textMediumEmphasis,
                    ),
                  ),
                if (question.userAnswer!.comment.isNotEmpty)
                  Text(
                    question.userAnswer!.comment,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: Grid.one),
        ],
        Text(
          context.l10n.courseAssignmentLableSubmission,
          style: context.textTheme.titleSmall,
        ),
        if (_file != null) ...[
          Row(
            children: [
              Expanded(child: Text(basename(_file!.path))),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _file = null;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: Grid.one),
        ],
        if (_file == null) ...[
          const SizedBox(height: Grid.one),
          SizedBox(
            width: double.infinity,
            child: MtpOutlinedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles(allowMultiple: false, type: FileType.any);

                if (result != null) {
                  setState(() {
                    File file = File(result.files.single.path!);
                    _file = file;
                  });
                }
              },
              labelText: context.l10n.courseAssignmentButtonTextChooseFile,
            ),
          ),
        ],
        if (question.explanation.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          MtpHtml(
            question.explanation,
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
        if (_file != null) ...[
          const SizedBox(height: Grid.two),
          BlocBuilder<QuizBloc, QuizState>(
            buildWhen: (previous, current) =>
                previous.answerSubmissionUiState !=
                    current.answerSubmissionUiState ||
                previous.hasAnswered != current.hasAnswered,
            builder: (context, state) {
              final isInProgress = state.answerSubmissionUiState.isInProgress;
              return SizedBox(
                width: double.infinity,
                child: MtpPrimaryButton(
                  label: isInProgress ? const MtpLoading() : null,
                  labelText: state.hasAnswered
                      ? context.l10n.courseAssignmentLabelSubmitted
                      : context.l10n.courseAssignmentButtonTextSubmit,
                  onPressed: isInProgress
                      ? null
                      : () {
                          context.read<QuizBloc>().add(
                                QuizAssignmentSubmitted(
                                  question.assignment.id,
                                  _file!,
                                ),
                              );
                        },
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:domain/domain.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SortingActivityListView extends StatefulWidget {
  const SortingActivityListView({
    super.key,
    required this.items,
  });

  final List<InteractiveSortingActivity> items;

  @override
  State<SortingActivityListView> createState() =>
      _SortingActivityListViewState();
}

class _SortingActivityListViewState extends State<SortingActivityListView> {
  final List<InteractiveSortingActivity> _items = [];
  int _currentIndex = 0;
  final questions = <String>[];
  bool _showResult = false;

  final Set<int> _attemptedQuestions = {};
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.items);
    _currentIndex = _items.length;
    questions.addAll(_items.map((e) => e.description));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!_showResult)
          _SortingQuestions(
            questions: questions.sublist(0, _currentIndex),
          ),
        if (_showResult)
          Column(
            children: [
              Text(
                context.l10n.interactiveSortingLabelFormattedScore(
                  _score,
                  _items.length,
                ),
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Grid.one),
              _ReplayButton(
                onTap: () {
                  setState(() {
                    _currentIndex = _items.length;
                    _showResult = false;
                    _attemptedQuestions.clear();
                    _score = 0;
                  });
                },
              ),
            ],
          ),
        const SizedBox(height: Grid.one),
        if (_currentIndex > 0) ...[
          _SortingOptions(
            options: _items[_currentIndex - 1].options,
            correctAnswerKey: _items[_currentIndex - 1].correctAnswerKey,
            onResult: (correct) {
              if (correct) {
                if (correct && !_attemptedQuestions.contains(_currentIndex)) {
                  _score++;
                }
                _attemptedQuestions.add(_currentIndex);
                setState(() {
                  if (_currentIndex > 0) {
                    _currentIndex--;
                  }
                  if (_currentIndex == 0) {
                    _showResult = true;
                  }
                });
              } else {
                _attemptedQuestions.add(_currentIndex);
              }
            },
          ),
        ],
      ],
    );
  }
}

class _SortingQuestions extends StatefulWidget {
  const _SortingQuestions({
    required this.questions,
  });

  final List<String> questions;

  @override
  State<_SortingQuestions> createState() => _SortingQuestionsState();
}

class _SortingQuestionsState extends State<_SortingQuestions> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final question in widget.questions)
          _DraggableSortingQuestion(
            question: question,
          )
      ],
    );
  }
}

class _DraggableSortingQuestion extends StatefulWidget {
  const _DraggableSortingQuestion({
    required this.question,
  });

  final String question;

  @override
  State<_DraggableSortingQuestion> createState() =>
      _DraggableSortingQuestionState();
}

class _DraggableSortingQuestionState extends State<_DraggableSortingQuestion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerShake() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: widget.question,
      onDraggableCanceled: (_, __) {
        _triggerShake();
      },
      feedback: _SortingQuestion(question: widget.question),
      childWhenDragging: Opacity(
        opacity: 0.01,
        child: _SortingQuestion(
          question: widget.question,
        ),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double offset = sin(_controller.value * pi * 10) * 2;
          return Transform.translate(
            offset: Offset(offset, 0),
            child: child,
          );
        },
        child: _SortingQuestion(question: widget.question),
      ),
    );
  }
}

class _SortingQuestion extends StatelessWidget {
  const _SortingQuestion({
    required this.question,
    this.isCorrect,
  });

  final String question;
  final bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Card(
      color: isCorrect == null
          ? context.colorScheme.primary
          : (isCorrect!
              ? context.colorScheme.success
              : context.colorScheme.error),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: context.colorScheme.outline.withOpacity(0.36),
          width: 1,
        ),
      ),
      child: Container(
        color: context.colorScheme.surface,
        margin: const EdgeInsets.only(top: Grid.half),
        child: SizedBox(
          width: screenWidth / 2,
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Grid.two),
                  child: Text(
                    question,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (isCorrect != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Icon(
                      isCorrect! ? Icons.check : Icons.close,
                      color: isCorrect!
                          ? context.colorScheme.success
                          : context.colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SortingOptions extends StatelessWidget {
  const _SortingOptions({
    required this.options,
    required this.correctAnswerKey,
    required this.onResult,
  });

  final List<InteractiveSortingAnswerOption> options;
  final int correctAnswerKey;
  final Function(bool) onResult;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: Grid.one,
        runSpacing: Grid.one,
        children: options
            .map(
              (option) => _DroppableSortingOption(
                option: option,
                isCorrectOption: option.key == correctAnswerKey,
                onResult: (correct) {
                  onResult(correct);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DroppableSortingOption extends StatefulWidget {
  const _DroppableSortingOption({
    required this.option,
    required this.isCorrectOption,
    required this.onResult,
  });

  final InteractiveSortingAnswerOption option;
  final bool isCorrectOption;
  final Function(bool) onResult;

  @override
  State<_DroppableSortingOption> createState() =>
      _DroppableSortingOptionState();
}

class _DroppableSortingOptionState extends State<_DroppableSortingOption>
    with SingleTickerProviderStateMixin {
  String _details = '';

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isVisible = false;
        });
        widget.onResult(widget.isCorrectOption);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return _DottedBorder(
          child: SizedBox(
            width: screenWidth / 2.5,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: candidateData.isEmpty
                        ? context.colorScheme.surfaceContainerLow
                        : context.colorScheme.surfaceContainer,
                    child: Center(
                      child: Text(
                        widget.option.answer,
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (_details.isNotEmpty)
                    if (_isVisible)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isVisible ? 1.0 : 0.0,
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: _SortingQuestion(
                            question: _details,
                            isCorrect: widget.isCorrectOption,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        );
      },
      onWillAcceptWithDetails: (details) {
        return true;
      },
      onAcceptWithDetails: (details) {
        setState(() {
          _details = details.data;
        });
        _animateAndHide();
      },
    );
  }

  void _animateAndHide() {
    setState(() {
      _isVisible = true;
    });
    _animationController.reset();
    Timer(const Duration(milliseconds: 400), () {
      if (mounted) {
        _animationController.forward(); // Start the animation
      }
    });
  }
}

class _DottedBorder extends StatelessWidget {
  const _DottedBorder({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: context.colorScheme.outline.withOpacity(0.36),
      radius: const Radius.circular(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: child,
      ),
    );
  }
}

class _ReplayButton extends StatelessWidget {
  const _ReplayButton({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            context.l10n.interactiveSortingButtonTextReplay,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          Icon(
            Icons.restart_alt,
            size: 24,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ProcessListView extends StatefulWidget {
  const ProcessListView({super.key, required this.items});

  final List<InteractiveProcess> items;

  @override
  State<ProcessListView> createState() => _ProcessListViewState();
}

class _ProcessListViewState extends State<ProcessListView> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isFirstPage => _currentIndex == 0;

  bool get _isLastPage => _currentIndex == widget.items.length - 1;

  int get _totalPages => widget.items.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.quarter),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Grid.one),
            child: Row(
              children: [
                Opacity(
                  opacity: !_isFirstPage ? 1 : 0,
                  child: _LeftArrow(
                    onTap: () {
                      setState(() {
                        _currentIndex--;
                      });
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Grid.half),
                      side: BorderSide(
                        color: context.colorScheme.onSurface.withOpacity(0.1),
                      ),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Grid.two,
                        right: Grid.two,
                        top: Grid.two,
                        bottom: Grid.two,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandablePageView.builder(
                            itemCount: widget.items.length,
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return _ProcessPage(
                                index: index,
                                item: widget.items[index],
                              );
                            },
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          if (_totalPages > 2 && _isLastPage) ...[
                            const SizedBox(height: Grid.one),
                            Align(
                              alignment: Alignment.center,
                              child: _StartAgain(
                                onTap: () {
                                  setState(() {
                                    _currentIndex = 0;
                                  });
                                  _pageController.jumpToPage(0);
                                },
                              ),
                            ),
                          ],
                          Align(
                            alignment: Alignment.center,
                            child: _PageNumberIndicator(
                              totalCount: _totalPages,
                              currentIndex: _currentIndex,
                              onChanged: (index) {
                                setState(() {
                                  _currentIndex = index;
                                });
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: !_isLastPage ? 1 : 0,
                  child: _RightArrow(
                    onTap: () {
                      setState(() {
                        _currentIndex++;
                      });
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (!_isFirstPage && !_isLastPage)
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Grid.two,
                    vertical: Grid.one,
                  ),
                  child: Text(
                    context.l10n
                        .interactiveProcessLabelFormattedStep(_currentIndex),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ProcessPage extends StatelessWidget {
  const _ProcessPage({
    required this.index,
    required this.item,
  });

  final int index;
  final InteractiveProcess item;

  @override
  Widget build(BuildContext context) {
    final hasImage = item.imageUrl.isNotEmpty;
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.title.isNotEmpty)
              Align(
                alignment: hasImage ? Alignment.topLeft : Alignment.center,
                child: Text(
                  item.title,
                  style: context.textTheme.titleLarge,
                ),
              ),
            if (item.imageUrl.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              AspectRatio(
                aspectRatio: defaultImageAspectRatio,
                child: MtpImage(
                  item.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            if (item.description.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              Text(
                item.description,
                style: context.textTheme.bodyLarge,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(120, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: () => onPressed(),
      icon: const Icon(Icons.chevron_right),
      label: Text(context.l10n.interactiveProcessButtonTextStart),
      iconAlignment: IconAlignment.end,
    );
  }
}

class _PageNumberIndicator extends StatelessWidget {
  const _PageNumberIndicator({
    required this.totalCount,
    required this.currentIndex,
    required this.onChanged,
  });

  final int totalCount;
  final int currentIndex;
  final Function(int index) onChanged;

  bool _isLastIndicator(int index) => index == totalCount - 1;

  bool _isCurrentIndicator(int index) => index == currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0 && totalCount > 1) {
      return _StartButton(
        onPressed: () => onChanged(1),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 1; i < totalCount; i++)
          InkWell(
            customBorder: const CircleBorder(),
            onTap: () => onChanged(i),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isCurrentIndicator(i)
                    ? Border.all(
                        color: context.colorScheme.primary,
                        width: 1,
                      )
                    : null,
              ),
              child: Center(
                child: Text(
                  _isLastIndicator(i) ? '✓' : i.format(context.locale),
                  style: context.textTheme.labelMedium,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _StartAgain extends StatelessWidget {
  const _StartAgain({
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
            context.l10n.interactiveProcessButtonTextStartAgain,
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

class _LeftArrow extends StatelessWidget {
  const _LeftArrow({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: context.colorScheme.onSurface,
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: context.colorScheme.primary,
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: Icon(
              Icons.chevron_left,
              size: 16,
              color: context.colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}

class _RightArrow extends StatelessWidget {
  const _RightArrow({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: context.colorScheme.onSurface,
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: context.colorScheme.primary,
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: Icon(
              Icons.chevron_right,
              size: 16,
              color: context.colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class OfflineFeatureDialog extends StatefulWidget {
  final List<StepModel> steps;

  const OfflineFeatureDialog({super.key, required this.steps});

  @override
  State<OfflineFeatureDialog> createState() => _OfflineFeatureDialogState();
}

class _OfflineFeatureDialogState extends State<OfflineFeatureDialog> {
  late PageController _pageController;
  int _currentPage = 0;

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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.homeLabelOfflineExplanation,
                style: context.textTheme.bodyMedium),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.steps.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: Grid.two),
                        getImageWidget(index),
                        const SizedBox(height: Grid.four),
                        Text(
                          "Step ${widget.steps[index].step}",
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: Grid.three),
                        Text(
                          context.locale == 'en'
                              ? widget.steps[index].stepContent
                              : widget.steps[index].stepContentMM,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _currentPage > 0 ? _goToPreviousPage : null,
                  child: Text(context.l10n.registerButtonTextPrev),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.steps.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: Grid.half),
                      width: _currentPage == index ? 10 : 8,
                      height: _currentPage == index ? 10 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? context.colorScheme.primary
                            : context.colorScheme.outline,
                      ),
                    ),
                  ),
                ),
                _currentPage == widget.steps.length - 1
                    ? TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(context.l10n.registerButtonTextOK),
                      )
                    : TextButton(
                        onPressed: _goToNextPage,
                        child: Text(context.l10n.registerButtonTextNext),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageWidget(int index) {
    switch (index) {
      case 0:
        return MtpAssets.images.offlineIllus1.image(
          width: 80,
          height: 80,
        );
      case 1:
        return MtpAssets.images.offlineIllus2.image(
          width: 80,
          height: 80,
        );
      case 2:
        return MtpAssets.images.offlineIllus3.image(
          width: 80,
          height: 80,
        );
      default:
        return MtpAssets.images.offlineIllusIcon.image(
          width: 80,
          height: 80,
        );
    }
  }

  void _goToNextPage() {
    if (_currentPage < widget.steps.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}

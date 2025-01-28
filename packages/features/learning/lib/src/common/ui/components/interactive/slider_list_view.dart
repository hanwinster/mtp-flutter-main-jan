import 'package:base/base.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SliderListView extends StatefulWidget {
  const SliderListView({
    super.key,
    required this.items,
  });

  final List<InteractiveSlider> items;

  @override
  State<SliderListView> createState() => _SliderListViewState();
}

class _SliderListViewState extends State<SliderListView> {
  late CarouselSliderController _carouselController;
  int _currentIndex = 0;

  @override
  void initState() {
    _carouselController = CarouselSliderController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.items.length;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                viewportFraction: 0.9,
                initialPage: 0,
                aspectRatio: defaultImageAspectRatio,
                enableInfiniteScroll: itemCount == 1 ? false : true,
                reverse: false,
                autoPlay: itemCount == 1 ? false : true,
                autoPlayInterval: const Duration(seconds: 7),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final item = widget.items[index];
                return Builder(
                  builder: (BuildContext context) {
                    return _CarouselTile(
                      imageUrl: item.imageUrl,
                    );
                  },
                );
              },
            ),
            _ForegroundSection(
              title: widget.items[_currentIndex].title,
              description: widget.items[_currentIndex].description,
              onPrevious: () {
                _carouselController.previousPage(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                );
              },
              onNext: () {
                _carouselController.nextPage(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: Grid.two),
        _Indicator(
          totalCount: itemCount,
          currentIndex: _currentIndex,
          onChange: (index) {
            _carouselController.animateToPage(
              index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
      ],
    );
  }
}

class _CarouselTile extends StatelessWidget {
  const _CarouselTile({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.half),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Grid.two),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(Grid.two),
      child: MtpImage(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class _ForegroundSection extends StatelessWidget {
  const _ForegroundSection({
    required this.title,
    required this.description,
    required this.onPrevious,
    required this.onNext,
  });

  final String title;
  final String description;
  final Function() onPrevious;
  final Function() onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onPrevious(),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.inverseSurface.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(left: Grid.one),
            child: RotatedBox(
              quarterTurns: 2,
              child: MtpAssets.images.sliderRightArrow.image(
                width: 36,
                height: 36,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.one),
            child: Container(
              padding: const EdgeInsets.all(Grid.one),
              decoration: BoxDecoration(
                color: context.colorScheme.inverseSurface.withOpacity(0.7),
                borderRadius: BorderRadius.circular(Grid.two),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.onInverseSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: Grid.one),
                  ],
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: Grid.one),
                    Text(
                      description,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onInverseSurface,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => onNext(),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.inverseSurface.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: Grid.one),
            child: Center(
              child: MtpAssets.images.sliderRightArrow.image(
                width: 36,
                height: 36,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.totalCount,
    required this.currentIndex,
    required this.onChange,
  });

  final int totalCount;
  final int currentIndex;
  final Function(int index) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalCount,
        (index) {
          return GestureDetector(
            onTap: () => onChange(index),
            child: Container(
              width: index == currentIndex ? Grid.three : Grid.one,
              height: Grid.half,
              margin: const EdgeInsets.symmetric(horizontal: Grid.half),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Grid.half),
                  color: context.colorScheme.primary
                      .withOpacity(index == currentIndex ? 0.9 : 0.4)),
            ),
          );
        },
      ).toList(),
    );
  }
}

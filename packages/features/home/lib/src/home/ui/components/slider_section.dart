import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/home/bloc/change_slide_cubit.dart';
import 'package:home/src/home/bloc/slide_data_bloc/slide_data_bloc.dart';
import 'package:ui/ui.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SlideDataBloc()
            ..add(
              SlideDataFetch(),
            ),
        ),
        BlocProvider(
          create: (context) => ChangeSlideCubit(),
        ),
      ],
      child: BlocBuilder<SlideDataBloc, SlideDataState>(
        builder: (context, state) {
          if (state is SlideDataLoaded) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.slides.length,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    height: 180,
                    enableInfiniteScroll:
                        state.slides.length == 1 ? false : true,
                    reverse: false,
                    autoPlay: state.slides.length == 1 ? false : true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      context.read<ChangeSlideCubit>().changeSlide(index);
                    },
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) =>
                          Builder(
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: MtpImage(
                          state.slides[index].slide.large,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<ChangeSlideCubit, int>(
                  builder: (context, slideIndexState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.slides.length, // Total number of slides you have
                        (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: Grid.half),
                            width: slideIndexState == index ? 8 : 6,
                            height: slideIndexState == index ? 8 : 6,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (slideIndexState == index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.outline)),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is SlideDataError) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                state.error.messageOrEmpty(context),
                style: context.textTheme.bodySmall,
              ),
            );
          }
          return const Center(
            child: MtpLoading(),
          );
        },
      ),
    );
  }
}

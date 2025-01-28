import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video/bloc/community_video_bloc.dart';
import 'package:home/src/home/ui/components/community_video_item.dart';
import 'package:ui/ui.dart';

class CommunityVideoSection extends StatelessWidget {
  const CommunityVideoSection(
      {super.key,
      required this.onCommunityVideoListClick,
      required this.onCommunityVideoDetailClick});
  final Function() onCommunityVideoListClick;
  final Function(String videoId) onCommunityVideoDetailClick;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 393 / 80,
              child: MtpAssets.images.communityVideoImageBg.image(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill
              ),
            ),
            Positioned.fill(
              left: Grid.two,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.communityVideoInspiredTitle,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: Grid.half,),
                    Text(
                      context.l10n.communityVideoDiscoveryExtraordinary,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<CommunityVideoBloc, CommunityVideoState>(
          buildWhen: (previous, current) => current is ChangedVideoTypeState,
          builder: (context, state) {
            if (state is ChangedVideoTypeState) {
              return Row(
                children: [
                  Expanded(
                      child: CustomCommunityVideoButton(
                    title: context.l10n.communityVideoLocal,
                    isActive: state.type == 'local',
                    onTap: () => context.read<CommunityVideoBloc>().add(
                          const ChangeCommunityVideoListTypeEvent(
                              type: 'local'),
                        ),
                  )),
                  Expanded(
                      child: CustomCommunityVideoButton(
                    title: context.l10n.communityVideoInternational,
                    isActive: state.type == 'international',
                    onTap: () => context.read<CommunityVideoBloc>().add(
                          const ChangeCommunityVideoListTypeEvent(
                              type: 'international'),
                        ),
                  )),
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: CustomCommunityVideoButton(
                      title: context.l10n.communityVideoLocal,
                      isActive: true,
                      onTap: () => context.read<CommunityVideoBloc>().add(
                            const ChangeCommunityVideoListTypeEvent(
                                type: 'local'),
                          ),
                    ),
                  ),
                  Expanded(
                      child: CustomCommunityVideoButton(
                    title: context.l10n.communityVideoInternational,
                    isActive: false,
                    onTap: () => context.read<CommunityVideoBloc>().add(
                          const ChangeCommunityVideoListTypeEvent(
                              type: 'international'),
                        ),
                  )),
                ],
              );
            }
          },
        ),
        const SizedBox(height: Grid.two),
        BlocBuilder<CommunityVideoBloc, CommunityVideoState>(
          builder: (context, state) {
            if (state is CommunityVideoLoaded) {
              if (state.communityVideos.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Grid.one),
                  child: Column(
                    children: [
                      SizedBox(
                          height: state.communityVideos.length >= 3 ? 370 : 200,
                          child: GridView.count(
                            padding: const EdgeInsets.all(0.0),
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: Grid.one,
                            mainAxisSpacing: Grid.one,
                            children: List.generate(
                                state.communityVideos.length > 4
                                    ? 4
                                    : state.communityVideos.length, (index) {
                              return InkWell(
                                onTap: () => onCommunityVideoDetailClick(
                                    state.communityVideos[index].id.toString()),
                                child: CommunityVideoItem(
                                  videoModel: state.communityVideos[index],
                                ),
                              );
                            }),
                          )),
                      const SizedBox(height: Grid.two),
                      InkWell(
                        onTap: onCommunityVideoListClick,
                        child: Container(
                          width: 161,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Grid.one),
                            color: context.colorScheme.primary,
                          ),
                          child: Center(
                              child: Text(
                                context.l10n.communityVideoSeeAll,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onPrimary,
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(context.l10n.communityVideoNoVideoFound, style: context.textTheme.labelSmall),
                );
              }
            } else {
              // loading
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: MtpLoading(),
              );
            }
          },
        ),
      ],
    );
  }
}

class CustomCommunityVideoButton extends StatelessWidget {
  const CustomCommunityVideoButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Grid.two),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  isActive ? context.colorScheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: context.textTheme.labelSmall?.copyWith(
              color: isActive
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface
            ),
          ),
        ),
      ),
    );
  }
}

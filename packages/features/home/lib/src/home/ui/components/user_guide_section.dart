import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/home/bloc/offline_content_bloc/offline_content_bloc.dart';
import 'package:home/src/home/bloc/video_cubit/video_cubit.dart';
import 'package:home/src/home/ui/components/application_usage_player_screen.dart';
import 'package:home/src/home/ui/components/offline_feature_dialog.dart';
import 'package:ui/ui.dart';

class UserGuideComponent extends StatelessWidget {
  const UserGuideComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.l10n.userGuide,
                style: context.textTheme.titleSmall,
              ),
              const Spacer(),
              MtpTextButton(
                onPressed: () {},
                labelText: context.l10n.learnMore,
              ),
            ],
          ),
          const SizedBox(height: Grid.two),
          SizedBox(
            height: 175,
            child: Row(
              children: [
                Expanded(
                  child: BlocProvider(
                    create: (context) => VideoCubit()..getVideoLink(),
                    child: BlocBuilder<VideoCubit, VideoState>(
                      builder: (context, state) {
                        if (state is VideoLoaded) {
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ApplicationUsagePlayerScreen(
                                  videoUrl: state.video.link,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 175 / 109,
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.blue,
                                    child: const Icon(
                                      Icons.play_circle,
                                      size: 48,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: Grid.two),
                                Text(
                                  context.l10n.howToUseMTPApplication,
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          );
                        } else if (state is VideoError) {
                          return Center(
                              child: Text(context.l10n.failloadVideo));
                        } else {
                          return const MtpLoading();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: Grid.one),
                Expanded(
                  child: BlocProvider(
                    create: (context) => OfflineContentBloc()
                      ..add(const OfflineContentFetched()),
                    child: BlocBuilder<OfflineContentBloc, OfflineContentState>(
                      builder: (context, state) {
                        if (state is OfflineContentLoaded) {
                          return InkWell(
                            onTap: () => showOfflineFeatureDialog(
                                context, state.offlineContent.steps),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 175 / 109,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: Grid.two),
                                    width: double.infinity,
                                    color: const Color(0xFFEDF7FE),
                                    child: MtpAssets.images.userGuide
                                        .image(width: double.infinity),
                                  ),
                                ),
                                const SizedBox(height: Grid.two),
                                Text(
                                  context.l10n.howOfflineFeatureWorks,
                                  style: context.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          );
                        } else if (state is OfflineContentError) {
                          return Center(
                              child: Text(context.l10n.failloadOfflinecontent));
                        } else {
                          return const MtpLoading();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // To show the dialog, you can call this in your main widget
  void showOfflineFeatureDialog(BuildContext context, List<StepModel> steps) {
    showDialog(
      context: context,
      builder: (context) => OfflineFeatureDialog(
        steps: steps,
      ),
    );
  }
}

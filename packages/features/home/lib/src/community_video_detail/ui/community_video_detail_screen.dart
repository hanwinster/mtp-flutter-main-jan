import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video_detail/bloc/community_video_detail_bloc/community_video_detail_bloc.dart';
import 'package:home/src/home/ui/components/community_video_item.dart';
import 'package:ui/ui.dart';
import 'community_video_detail_screen_entry.dart';

class CommunityVideoDetailScreen extends StatelessWidget {
  const CommunityVideoDetailScreen({super.key, required this.onCommunityVideoDetailClick});
  final VideoDetailClickCallback onCommunityVideoDetailClick;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      appBar: AppBar(
        title: Text(context.l10n.communityVideoVideoDetail),
      ),
      body: BlocBuilder<CommunityVideoDetailBloc, CommunityVideoDetailState>(
        builder: (context, state) {
          if (state is CommunityVideoDetailSuccess) {
            CommunityVideoModel videoModel = state.communityVideoModel;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: MtpVideoPlayer(videoUrl: videoModel.videoLink),
                          ),
                        ),
                        // buildVideoPlayerWidget(flickManager),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            videoModel.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              MtpAssets.images.unescoLogo.image(
                                width: 50,
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Unesco Myanmar',
                                    style: context.textTheme.labelMedium!.copyWith(
                                      color: context.colorScheme.outline,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Uploaded on ${videoModel.createdTimeAgo}',
                                        style: context.textTheme.labelMedium!.copyWith(
                                          color: context.colorScheme.outlineVariant,
                                        ),
                                      ),
                                      const Text(
                                        ' • ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF696974),
                                        ),
                                      ),
                                      Text(
                                        '${videoModel.viewCount} ${context.l10n.communityVideoViews}',
                                        style: context.textTheme.labelMedium!.copyWith(
                                          color: context.colorScheme.outlineVariant,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.communityVideoDescription,
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(height: Grid.one),
                        MtpHtml(videoModel.description, textStyle: context.textTheme.bodySmall,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.communityVideoRelatedVideos,
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(height: Grid.one),
                        state.relatedCommunityVideoList.isNotEmpty ? SizedBox(
                          height: state.relatedCommunityVideoList.length >= 2 ? 370 : 220,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            padding:
                            const EdgeInsets.symmetric(horizontal: Grid.two),
                            crossAxisCount: 2,
                            crossAxisSpacing: Grid.one,
                            mainAxisSpacing: Grid.one,
                            children: List.generate(
                                state.relatedCommunityVideoList.length, (index) {
                              return InkWell(
                                onTap: () => onCommunityVideoDetailClick(
                                    state.relatedCommunityVideoList[index].id.toString()),
                                child: CommunityVideoItem(
                                  videoModel: state.relatedCommunityVideoList[index],
                                ),
                              );
                            }),
                          ),
                        ) : Text(context.l10n.communityVideoNoVideoFound, style: context.textTheme.labelSmall,),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: MtpLoading(),);
          }
        },
      ),
    );
  }
}

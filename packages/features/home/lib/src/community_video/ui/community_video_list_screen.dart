import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/community_video/bloc/community_video_bloc.dart';
import 'package:home/src/home/ui/components/community_video_item.dart';
import 'package:home/src/home/ui/components/community_video_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';
import 'community_video_list_screen_entry.dart';

class CommunityVideoListScreen extends StatefulWidget {
  const CommunityVideoListScreen(
      {super.key, required this.onCommunityVideoDetailClick});

  final CLVideoDetailClickCallback onCommunityVideoDetailClick;

  @override
  State<CommunityVideoListScreen> createState() =>
      _CommunityVideoListScreenState();
}

class _CommunityVideoListScreenState extends State<CommunityVideoListScreen> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void getData() {
    context.read<CommunityVideoBloc>().add(
          GetCommunityVideoListEvent(),
        );
  }

  void onRefresh() async {
    getData();
  }

  void onLoading() async {
    context.read<CommunityVideoBloc>().add(
          GetCommunityVideoListLoadMoreEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.communityVideoInspiredVideos),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: MtpAssets.images.communityVideoImageBg.image(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.l10n.communityVideoInspiredTitle,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          context.l10n.communityVideoInspiredBody,
                          style: context.textTheme.labelSmall!.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: Grid.two),
                        padding:
                            const EdgeInsets.symmetric(horizontal: Grid.one),
                        decoration: BoxDecoration(
                          color: context.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                focusNode: _focusNode,
                                onChanged: (value) =>
                                    context.read<CommunityVideoBloc>().add(
                                          SearchCommunityVideoListEvent(
                                            search: value,
                                          ),
                                        ),
                                decoration: InputDecoration(
                                  hintText: context
                                      .l10n.communityVideoSearchForKeyword,
                                  hintStyle: context.textTheme.labelMedium,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                _focusNode.unfocus();
                                getData();
                              },
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius:
                                      BorderRadius.circular(Grid.half),
                                ),
                                child: Center(
                                  child: Text(
                                    context.l10n.communityVideoSearch,
                                    style:
                                        context.textTheme.labelSmall?.copyWith(
                                      color: context.colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Grid.one,
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
                      onTap: () {
                        _scrollController.jumpTo(0);
                        context.read<CommunityVideoBloc>().add(
                              const ChangeCommunityVideoListTypeEvent(
                                  type: 'local'),
                            );
                      },
                    )),
                    Expanded(
                        child: CustomCommunityVideoButton(
                      title: context.l10n.communityVideoInternational,
                      isActive: state.type == 'international',
                      onTap: () {
                        _scrollController.jumpTo(0);
                        context.read<CommunityVideoBloc>().add(
                            const ChangeCommunityVideoListTypeEvent(
                                type: 'international'));
                      },
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
                        onTap: () {
                          _scrollController.jumpTo(0);
                          context.read<CommunityVideoBloc>().add(
                                const ChangeCommunityVideoListTypeEvent(
                                    type: 'local'),
                              );
                        },
                      ),
                    ),
                    Expanded(
                        child: CustomCommunityVideoButton(
                      title: context.l10n.communityVideoInternational,
                      isActive: false,
                      onTap: () {
                        _scrollController.jumpTo(0);
                        context.read<CommunityVideoBloc>().add(
                              const ChangeCommunityVideoListTypeEvent(
                                  type: 'international'),
                            );
                      },
                    )),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: Grid.two),
          BlocConsumer<CommunityVideoBloc, CommunityVideoState>(
            listener: (context, state) {
              if (state is CommunityVideoLoaded) {
                if (state.isFirstTimeDataFetched) {
                  _refreshController.resetNoData();
                  _refreshController.refreshCompleted();
                } else {
                  _refreshController.loadComplete();
                }
              } else if (state is CommunityVideoNoMoreData) {
                _refreshController.loadNoData();
              }
            },
            buildWhen: (previous, current) => current is CommunityVideoLoaded,
            builder: (context, state) {
              if (state is CommunityVideoLoaded) {
                if (state.communityVideos.isNotEmpty) {
                  return Expanded(
                      child: SmartRefresher(
                          scrollController: _scrollController,
                          controller: _refreshController,
                          enablePullDown: true,
                          enablePullUp: state.communityVideos.length >= 10,
                          onRefresh: onRefresh,
                          onLoading: onLoading,
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Grid.two),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: Grid.one,
                              mainAxisSpacing: Grid.one,
                            ),
                            itemCount: state.communityVideos.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => widget.onCommunityVideoDetailClick(
                                    state.communityVideos[index].id.toString()),
                                child: CommunityVideoItem(
                                  videoModel: state.communityVideos[index],
                                ),
                              );
                            },
                          )));
                } else {
                  return Center(
                    child: Text(context.l10n.communityVideoNoVideoFound,
                        style: context.textTheme.labelSmall),
                  );
                }
              } else {
                // loading
                return const Center(
                  child: MtpLoading(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

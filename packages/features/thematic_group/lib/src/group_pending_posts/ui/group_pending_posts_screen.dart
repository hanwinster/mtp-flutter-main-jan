import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../bloc/group_pending_posts_bloc.dart';

class GroupPendingPostsScreen extends StatelessWidget {
  const GroupPendingPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.groupLabelPendingPosts,
          style: context.textTheme.titleMedium,
        ),
        elevation: 1,
        scrolledUnderElevation: 2,
      ),
      body: BlocBuilder<GroupPendingPostsBloc, GroupPendingPostsState>(
        buildWhen: (previous, current) {
          return previous.postsUiState != current.postsUiState;
        },
        builder: (context, state) {
          return state.postsUiState.toView(
            context,
            successViewBuilder: (items) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage(item.coverImages.thumbnail),
                              ),
                              const SizedBox(width: Grid.one),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.user.fullName,
                                     style: context.textTheme.labelLarge,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    timeago.format(
                                      item.createdAt,
                                      locale: context.locale,
                                    ),
                                     style: context.textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: Grid.two),
                          Text(item.description,
                              style: context.textTheme.labelSmall),
                          const SizedBox(height: Grid.two),
                          Row(
                            children: [
                              Row(
                                children: [
                                  MtpAssets.icons.star.svg(width: 20, height: 20),
                                  const SizedBox(width: 4),
                                  Text(
                                    context.l10n.groupLabelPendingForApproval,
                                    style: context.textTheme.labelSmall
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  // Add cancel action here
                                },
                                child: Text(
                                  'Cancel',
                                  style: context.textTheme.labelSmall?.copyWith(
                                      color: context.colorScheme.error,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            emptyViewBuilder: (data) {
              return MtpEmpty(
                message: context.l10n.groupLabelEmptyPost,
              );
            },
          );
        },
      ),
    );
  }
}

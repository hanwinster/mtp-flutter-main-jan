import 'dart:async';
import 'dart:core';

import 'package:domain/domain.dart';
import 'package:e_library/e_library.dart';
import 'package:e_library/src/e_library_home/bloc/e_library_bloc.dart';
import 'package:e_library/src/e_library_home/bloc/get_drop_down_data_bloc/get_drop_down_data_bloc.dart';
import 'package:e_library/src/e_library_home/cubit/e_library_resource_format_change_cubit.dart';
import 'package:e_library/src/e_library_home/cubit/e_library_subject_change_cubit.dart';
import 'package:e_library/src/e_library_home/ui/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui/ui.dart';

import 'e_library_home_screen_entry.dart';

class ELibraryHomeScreen extends StatefulWidget {
  const ELibraryHomeScreen({
    super.key,
    required this.scaffoldKey,
    required this.drawer,
    required this.onResourceTapped,
    required this.onNotiClick,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget drawer;
  final OnResourceTapped onResourceTapped;
  final NotificationActionClickCallback onNotiClick;

  @override
  State<ELibraryHomeScreen> createState() => _ELibraryHomeScreenState();
}

class _ELibraryHomeScreenState extends State<ELibraryHomeScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final TextEditingController _searchController = TextEditingController();
  String query = '';
  String subject = '';
  String resourceFormat = '';

  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(seconds: 1), () {
      context.read<ELibraryBloc>().add(GetELibraryBooks(
          query: query, subject: subject, resourceFormat: resourceFormat));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      drawer: widget.drawer,
      appBar: buildMtpPrimaryAppBar(context, widget.scaffoldKey, actions: [
        NotificationActionButton(
          onClicked: widget.onNotiClick,
        ),
        GestureDetector(
          onTap: () {
            query = '';
            _searchController.clear();
            subject = '';
            context.read<ELibrarySubjectChangeCubit>().changeSubject(null);

            resourceFormat = '';
            context
                .read<ELibraryResourceFormatChangeCubit>()
                .changeResourceFormat(null);

            context.read<ELibraryBloc>().add(GetELibraryBooks(
                query: query,
                subject: subject,
                resourceFormat: resourceFormat));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: Grid.two),
            child: Center(
              child: Text(
                context.l10n.eLibraryClearAll,
                style: context.textTheme.labelLarge
                    ?.copyWith(color: context.colorScheme.onPrimary),
              ),
            ),
          ),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(Grid.two),
        child: Column(
          children: [
            MtpTextField(
              controller: _searchController,
              hintText: context.l10n.eLibraryHintSearch,
              prefixIcon: const Icon(Icons.search_rounded),
              onChanged: (value) {
                query = value;
                _onSearchChanged(value);
              },
            ),
            const SizedBox(height: Grid.two),
            Row(
              children: [
                BlocBuilder<GetDropDownDataBloc, GetDropDownDataState>(
                  buildWhen: (previous, current) =>
                      current is GetSubjectListLoaded ||
                      current is GetSubjectListLoading ||
                      current is GetSubjectListError,
                  builder: (context, state) {
                    if (state is GetSubjectListLoaded) {
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Grid.one),
                              border: Border.all(
                                  color: context.colorScheme.outline)),
                          child:
                              BlocBuilder<ELibrarySubjectChangeCubit, Subject?>(
                            builder: (context, value) {
                              return DropdownButton<Subject>(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Grid.half, horizontal: Grid.one),
                                value: value,
                                underline: Container(),
                                onChanged: (value) {
                                  if (value != null) {
                                    if (value.id == '') {
                                      subject = '';
                                    } else {
                                      subject = value.id;
                                    }
                                    context
                                        .read<ELibrarySubjectChangeCubit>()
                                        .changeSubject(value);
                                    context.read<ELibraryBloc>().add(
                                        GetELibraryBooks(
                                            query: query,
                                            subject: subject,
                                            resourceFormat: resourceFormat));
                                  }
                                },
                                isExpanded: true,
                                hint: Text(context.l10n.eLibraryChooseSubject),
                                style: context.textTheme.labelMedium,
                                items: state.subjectList.map((value) {
                                  return DropdownMenuItem<Subject>(
                                    value: value,
                                    child: Text(
                                      value.title,
                                      style: context.textTheme.labelMedium,
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          period: const Duration(milliseconds: 500),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(Grid.one),
                            ),
                            margin: const EdgeInsets.only(left: Grid.two),
                          ),
                        ),
                      );
                    }
                  },
                ),
                BlocBuilder<GetDropDownDataBloc, GetDropDownDataState>(
                  buildWhen: (previous, current) =>
                      current is GetResourceFormatListLoaded ||
                      current is GetResourceFormatListLoading ||
                      current is GetResourceFormatListError,
                  builder: (context, state) {
                    if (state is GetResourceFormatListLoaded) {
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Grid.one),
                              border: Border.all(
                                  color: context.colorScheme.outline)),
                          margin: const EdgeInsets.only(left: Grid.two),
                          child: BlocBuilder<ELibraryResourceFormatChangeCubit,
                              ResourceFormat?>(
                            builder: (context, value) {
                              return DropdownButton<ResourceFormat>(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                value: value,
                                underline: Container(),
                                onChanged: (value) {
                                  if (value != null) {
                                    resourceFormat = value.id;
                                    context
                                        .read<
                                            ELibraryResourceFormatChangeCubit>()
                                        .changeResourceFormat(value);
                                    context.read<ELibraryBloc>().add(
                                        GetELibraryBooks(
                                            query: query,
                                            subject: subject,
                                            resourceFormat: resourceFormat));
                                  }
                                },
                                isExpanded: true,
                                hint: Text(
                                    context.l10n.eLibraryChooseResourceFormat),
                                style: context.textTheme.labelMedium,
                                items: state.resourceFormatList.map((value) {
                                  return DropdownMenuItem<ResourceFormat>(
                                    value: value,
                                    child: Text(
                                      value.title,
                                      style: context.textTheme.labelMedium,
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          period: const Duration(milliseconds: 500),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(Grid.one),
                            ),
                            margin: const EdgeInsets.only(left: Grid.two),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: Grid.two),
            Expanded(
              child: BlocConsumer<ELibraryBloc, ELibraryState>(
                listener: (context, state) {
                  if (state is ELibraryLoaded) {
                    if (state.isFirstLoadRunning) {
                      _refreshController.refreshCompleted();
                      _refreshController.resetNoData();
                    } else {
                      _refreshController.loadComplete();
                    }
                  } else if (state is ELibraryNoMoreData) {
                    _refreshController.loadNoData();
                  }
                },
                buildWhen: (previous, current) =>
                    current is ELibraryLoaded || current is ELibraryLoading,
                builder: (context, state) {
                  if (state is ELibraryLoaded) {
                    if (state.resources.isNotEmpty) {
                      return SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: state.resources.length > 9,
                        onRefresh: () {
                          context.read<ELibraryBloc>().add(
                                GetELibraryBooks(
                                  query: query,
                                  subject: subject,
                                  resourceFormat: resourceFormat,
                                ),
                              );
                          _refreshController.refreshCompleted();
                        },
                        onLoading: () {
                          context.read<ELibraryBloc>().add(
                                GetELibraryBooksLoadMore(
                                  query: query,
                                  subject: subject,
                                  resourceFormat: resourceFormat,
                                ),
                              );
                        },
                        child: ListView.builder(
                          itemCount: state.resources.length,
                          itemBuilder: (context, index) {
                            return ResourceCard(
                              resource: state.resources[index],
                              onTap: () => widget
                                  .onResourceTapped(state.resources[index]),
                              //     Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) {
                              //       return ELibraryDetailsScreen(
                              //           resource: state.resources[index]);
                              //     },
                              //   ),
                              // ),
                              // widget.onResourceTapped(state.resources[index]),
                              // onTap: () {
                              //   return MaterialPageRoute(builder: (context) => ELibraryDetailsScreen(resource: state.resources[index],));
                              // }
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(context.l10n.eLibraryNoResourceFound),
                      );
                    }
                  } else {
                    return const Column(
                      children: [
                        ResourceCardShimmer(),
                        SizedBox(
                          height: Grid.one,
                        ),
                        ResourceCardShimmer(),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:domain/domain.dart';
import 'package:e_library/src/e_library_details/ui/resource_download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:intl/intl.dart';
import 'package:ui/ui.dart';

class ELibraryDetailsScreen extends StatelessWidget {
  final Resource resource;

  const ELibraryDetailsScreen({super.key, required this.resource});

  void _showPreviewDialog(BuildContext context, String url) async {
    if (Platform.isAndroid) {
      if (url.endsWith(".pdf")) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: const PDF(
                  swipeHorizontal: false,
                ).cachedFromUrl(url),
              ),
            );
          },
        );
      } else {
        openWebView(url, context);
      }
    } else {
      openWebView(url, context);
    }
  }

  void openWebView(url, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: MtpWebView(url: url),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResourceHeaderWidget(resource: resource),
                  Container(
                    padding: const EdgeInsets.only(
                        left: Grid.two, right: Grid.two, top: Grid.two),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Overview
                        Text(
                          context.l10n.eLibraryOverview,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Grid.two),
                        MtpHtmlPlainText(
                          resource.description,
                          textStyle: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: Grid.two),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryAuthor,
                          value: resource.author,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryPublisher,
                          value: resource.publisher,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryStrand,
                          value: resource.strand,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibrarySubStrand,
                          value: resource.subStrand,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryLesson,
                          value: resource.lesson,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryRating,
                          value: resource.averageRating,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryPublisher,
                          value: resource.publisher,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryPublishingYear,
                          value: resource.publishingYear,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryUrl,
                          value: resource.url,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryAdditionalInformation,
                          value: resource.additionalInformation,
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryTotalPageViews,
                          value: resource.totalPageViews.toString(),
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryTotalDownloads,
                          value: resource.totalDownloads.toString(),
                        ),
                        ResourceDetailsLabelAndValueWidget(
                          title: context.l10n.eLibraryLastUpdated,
                          value: DateFormat('yyyy-MMM-d')
                              .format(DateTime.parse(resource.updatedAt)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Buttons (Preview and Download) always at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Grid.two, vertical: Grid.one),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: MtpPrimaryButton(
                    onPressed: resource.preview.isNotEmpty
                        ? () {
                            String url = resource.preview;
                            _showPreviewDialog(context, url);
                          }
                        : null,
                    labelText: context.l10n.eLibraryPreview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(width: Grid.two),
                Expanded(
                  child: ResourceDownload(
                    url: resource.fullVersionFile,
                    media: resource.downloadFile,
                  ),
                  // child: BlocProvider(
                  //   create: (context) => FileDownloadBloc(),
                  //   child: BlocConsumer<FileDownloadBloc, FileDownloadState>(
                  //     listener: (context, state) {
                  //       if (state is DownloadCompleted) {
                  //         showSnackBar(context,
                  //             'Download Success, File Path: ${state.filePath}');
                  //       } else if (state is DownloadError) {
                  //         showSnackBar(
                  //             context, 'Download Failed: ${state.message}');
                  //       }
                  //     },
                  //     builder: (context, state) {
                  //       if (state is DownloadInProgress) {
                  //         return MtpPrimaryButton(
                  //           onPressed: () async {},
                  //           labelText:
                  //               '${context.l10n.eLibraryDownload} ${(state.progress * 100).toStringAsFixed(0)}%',
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor:
                  //                 Theme.of(context).colorScheme.primary,
                  //           ),
                  //         );
                  //       } else {
                  //         return MtpPrimaryButton(
                  //           onPressed: resource.fullVersionFile.isNotEmpty
                  //               ? () async {
                  //                   BlocProvider.of<FileDownloadBloc>(context)
                  //                       .add(
                  //                     StartDownloadEvent(
                  //                       resource.fullVersionFile,
                  //                       resource.downloadFile
                  //                     ),
                  //                   );
                  //                 }
                  //               : null,
                  //           labelText:
                  //               '${context.l10n.eLibraryDownload} ${resource.downloadFile.humanReadableSize}',
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor:
                  //                 Theme.of(context).colorScheme.primary,
                  //           ),
                  //         );
                  //       }
                  //     },
                  //   ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceDetailsLabelAndValueWidget extends StatelessWidget {
  const ResourceDetailsLabelAndValueWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16), // Add padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceHeaderWidget extends StatelessWidget {
  const ResourceHeaderWidget({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(Grid.one),
            child: SizedBox(
              width: 160,
              child: AspectRatio(
                aspectRatio: 1 / 1.5,
                child: MtpImage(
                  resource.coverImage.medium,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: Grid.two),
          // Title
          Text(
            resource.title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium
                ?.copyWith(color: context.colorScheme.onPrimary),
          ),
          const SizedBox(height: Grid.two),

          // Author
          Text(
            '${resource.resourceFormat} By ${resource.author}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(height: 15),

          // Downloads, Rating, Total Pages
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    context.l10n.eLibraryDownloads,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    resource.totalDownloads.toString(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    context.l10n.eLibraryRating,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        resource.averageRating,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: context.colorScheme.onPrimary,
                                ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      MtpAssets.icons.star.svg(
                        width: 12,
                        height: 12,
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    context.l10n.eLibraryTotalPages,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    resource.totalPageViews.toString(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

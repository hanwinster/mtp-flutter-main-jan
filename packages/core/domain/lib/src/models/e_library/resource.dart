import 'package:base/base.dart';
import 'package:domain/domain.dart';

class Resource extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String resourceFormat;
  final String strand;
  final String subStrand;
  final String author;
  final String rating;
  final String publisher;
  final String publishingYear;
  final String published;
  final String approved;
  final int userId;
  final int licenseId;
  final int isFeatured;
  final String suitableForECYear;
  final String url;
  final String additionalInformation;
  final int totalPageViews;
  final int totalDownloads;
  final int allowFeedback;
  final int allowDownload;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final String approvedAt;
  final String publishingMonth;
  final int approvalStatus;
  final String originalResourceId;
  final String approvedBy;
  final String lesson;
  final int allowEdit;
  final int isLocked;
  final String deletedBy;
  final String preview;
  final String fullVersionFile;
  final ImageUrl coverImage;
  final Media previewFile;
  final Media downloadFile;
  final int reviewCount;
  final String averageRating;


  const Resource({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.resourceFormat,
    required this.strand,
    required this.subStrand,
    required this.author,
    required this.rating,
    required this.publisher,
    required this.publishingYear,
    required this.published,
    required this.approved,
    required this.userId,
    required this.licenseId,
    required this.isFeatured,
    required this.suitableForECYear,
    required this.url,
    required this.additionalInformation,
    required this.totalPageViews,
    required this.totalDownloads,
    required this.allowFeedback,
    required this.allowDownload,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.approvedAt,
    required this.publishingMonth,
    required this.approvalStatus,
    required this.originalResourceId,
    required this.approvedBy,
    required this.lesson,
    required this.allowEdit,
    required this.isLocked,
    required this.deletedBy,
    required this.preview,
    required this.fullVersionFile,
    required this.coverImage,
    required this.downloadFile,
    required this.previewFile,
    required this.reviewCount,
    required this.averageRating
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        slug,
        description,
        resourceFormat,
        strand,
        subStrand,
        author,
        rating,
        publisher,
        publishingYear,
        published,
        approved,
        userId,
        licenseId,
        isFeatured,
        suitableForECYear,
        url,
        additionalInformation,
        totalPageViews,
        totalDownloads,
        allowFeedback,
        allowDownload,
        deletedAt,
        createdAt,
        updatedAt,
        approvedAt,
        publishingMonth,
        approvalStatus,
        originalResourceId,
        approvedBy,
        lesson,
        allowEdit,
        isLocked,
        deletedBy,
        preview,
        fullVersionFile,
        coverImage,
        previewFile,
        downloadFile,
        reviewCount,
        averageRating
      ];
}
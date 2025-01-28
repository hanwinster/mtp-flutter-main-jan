import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_rm.g.dart';

@JsonSerializable(createToJson: false)
class ResourceRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'resource_format')
  final String? resourceFormat;

  @JsonKey(name: 'strand')
  final String? strand;

  @JsonKey(name: 'sub_strand')
  final String? subStrand;

  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'rating')
  final dynamic rating;

  @JsonKey(name: 'publisher')
  final String? publisher;

  @JsonKey(name: 'publishing_year')
  final String? publishingYear;

  @JsonKey(name: 'published')
  final int? published;

  @JsonKey(name: 'approved')
  final int? approved;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'license_id')
  final int? licenseId;

  @JsonKey(name: 'is_featured')
  final int? isFeatured;

  @JsonKey(name: 'suitable_for_ec_year')
  final String? suitableForECYear;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'additional_information')
  final String? additionalInformation;

  @JsonKey(name: 'total_page_views')
  final int? totalPageViews;

  @JsonKey(name: 'total_downloads')
  final int? totalDownloads;

  @JsonKey(name: 'allow_feedback')
  final int? allowFeedback;

  @JsonKey(name: 'allow_download')
  final int? allowDownload;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'approved_at')
  final String? approvedAt;

  @JsonKey(name: 'publishing_month')
  final int? publishingMonth;

  @JsonKey(name: 'approval_status')
  final int? approvalStatus;

  @JsonKey(name: 'original_resource_id')
  final dynamic originalResourceId;

  @JsonKey(name: 'approved_by')
  final String? approvedBy;

  @JsonKey(name: 'lesson')
  final String? lesson;

  @JsonKey(name: 'allow_edit')
  final int? allowEdit;

  @JsonKey(name: 'is_locked')
  final int? isLocked;

  @JsonKey(name: 'deleted_by')
  final String? deletedBy;

  @JsonKey(name: 'preview')
  final String? preview;

  @JsonKey(name: 'full_version_file')
  final String? fullVersionFile;

  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImage;

  @JsonKey(name: 'preview_file')
  final MediaRM? previewFile;

  @JsonKey(name: 'download_file')
  final MediaRM? downloadFile;

  @JsonKey(name: 'review_count')
  final int? reviewCount;

  @JsonKey(name: 'average_rating')
  final String? averageRating;

  const ResourceRM(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.resourceFormat,
      this.strand,
      this.subStrand,
      this.author,
      this.rating,
      this.publisher,
      this.publishingYear,
      this.published,
      this.approved,
      this.userId,
      this.licenseId,
      this.isFeatured,
      this.suitableForECYear,
      this.url,
      this.additionalInformation,
      this.totalPageViews,
      this.totalDownloads,
      this.allowFeedback,
      this.allowDownload,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.approvedAt,
      this.publishingMonth,
      this.approvalStatus,
      this.originalResourceId,
      this.approvedBy,
      this.lesson,
      this.allowEdit,
      this.isLocked,
      this.deletedBy,
      this.preview,
      this.fullVersionFile,
      this.coverImage,
      this.previewFile,
      this.downloadFile,
      this.reviewCount,
      this.averageRating});

  @override
  List<Object?> get props => [
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

  factory ResourceRM.fromJson(Map<String, dynamic> json) =>
      _$ResourceRMFromJson(json);

  Resource toDomainModel() {
    return Resource(
        id: id?.toString() ?? (throw Exception('Resource id is null')),
        title: title ?? '',
        slug: slug ?? '',
        description: description ?? '',
        resourceFormat: resourceFormat ?? '',
        strand: strand ?? '',
        subStrand: subStrand ?? '',
        lesson: lesson ?? '',
        author: author ?? '',
        rating: rating != null ? rating.toString() : 'N/A',
        publisher: publisher ?? '',
        publishingYear: publishingYear != null ? publishingYear.toString() : '',
        publishingMonth:
            publishingMonth != null ? publishingMonth.toString() : '',
        totalPageViews: totalPageViews ?? 0,
        totalDownloads: totalDownloads ?? 0,
        coverImage: coverImage != null
            ? coverImage!.toDomainModel()
            : const ImageUrlRM().toDomainModel(),
        url: url ?? '',
        additionalInformation: additionalInformation ?? '',
        published: published != null ? published.toString() : '',
        approved: approved != null ? approved.toString() : '',
        userId: userId ?? 0,
        licenseId: licenseId ?? 0,
        isFeatured: isFeatured ?? 0,
        suitableForECYear: suitableForECYear ?? '',
        allowFeedback: allowFeedback ?? 0,
        allowDownload: allowDownload ?? 0,
        deletedAt: deletedAt ?? '',
        createdAt: createdAt ?? '',
        updatedAt: updatedAt ?? '',
        approvedAt: approvedAt ?? '',
        approvalStatus: approvalStatus ?? 0,
        originalResourceId: originalResourceId?.toString() ?? '',
        approvedBy: approvedBy ?? '',
        allowEdit: allowEdit ?? 0,
        isLocked: isLocked ?? 0,
        deletedBy: deletedBy ?? '',
        preview: preview ?? '',
        fullVersionFile: fullVersionFile ?? '',
        previewFile: previewFile != null
            ? previewFile!.toDomainModel()
            : const MediaRM().toDomainModel(),
        downloadFile: downloadFile != null
            ? downloadFile!.toDomainModel()
            : const MediaRM().toDomainModel(),
        reviewCount: reviewCount ?? 0,
        averageRating: averageRating ?? 'N/A')
    ;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceRM _$ResourceRMFromJson(Map<String, dynamic> json) => ResourceRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      resourceFormat: json['resource_format'] as String?,
      strand: json['strand'] as String?,
      subStrand: json['sub_strand'] as String?,
      author: json['author'] as String?,
      rating: json['rating'],
      publisher: json['publisher'] as String?,
      publishingYear: json['publishing_year'] as String?,
      published: (json['published'] as num?)?.toInt(),
      approved: (json['approved'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      licenseId: (json['license_id'] as num?)?.toInt(),
      isFeatured: (json['is_featured'] as num?)?.toInt(),
      suitableForECYear: json['suitable_for_ec_year'] as String?,
      url: json['url'] as String?,
      additionalInformation: json['additional_information'] as String?,
      totalPageViews: (json['total_page_views'] as num?)?.toInt(),
      totalDownloads: (json['total_downloads'] as num?)?.toInt(),
      allowFeedback: (json['allow_feedback'] as num?)?.toInt(),
      allowDownload: (json['allow_download'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      approvedAt: json['approved_at'] as String?,
      publishingMonth: (json['publishing_month'] as num?)?.toInt(),
      approvalStatus: (json['approval_status'] as num?)?.toInt(),
      originalResourceId: json['original_resource_id'],
      approvedBy: json['approved_by'] as String?,
      lesson: json['lesson'] as String?,
      allowEdit: (json['allow_edit'] as num?)?.toInt(),
      isLocked: (json['is_locked'] as num?)?.toInt(),
      deletedBy: json['deleted_by'] as String?,
      preview: json['preview'] as String?,
      fullVersionFile: json['full_version_file'] as String?,
      coverImage: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
      previewFile: json['preview_file'] == null
          ? null
          : MediaRM.fromJson(json['preview_file'] as Map<String, dynamic>),
      downloadFile: json['download_file'] == null
          ? null
          : MediaRM.fromJson(json['download_file'] as Map<String, dynamic>),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      averageRating: json['average_rating'] as String?,
    );

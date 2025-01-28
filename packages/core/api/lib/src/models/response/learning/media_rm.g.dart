// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaRM _$MediaRMFromJson(Map<String, dynamic> json) => MediaRM(
      id: (json['id'] as num?)?.toInt(),
      modelType: json['model_type'] as String?,
      modelId: (json['model_id'] as num?)?.toInt(),
      collectionName: json['collection_name'] as String?,
      name: json['name'] as String?,
      fileName: json['file_name'] as String?,
      fileUrl: json['file_url'] as String?,
      originalUrl: json['original_url'] as String?,
      mimeType: json['mime_type'] as String?,
      disk: json['disk'] as String?,
      size: (json['size'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      url: json['url'] as String?,
      humanReadableSize: json['human_readable_size'] as String?,
      extension: json['extension'] as String?,
    );

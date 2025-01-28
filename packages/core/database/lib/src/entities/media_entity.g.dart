// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      id: json['id'] as String,
      fileName: json['file_name'] as String,
      type: MediaTypeEntity.fromJson(json['type'] as String),
      fileUrl: json['file_url'] as String,
      url: json['url'] as String,
      size: (json['size'] as num).toInt(),
      humanReadableSize: json['human_readable_size'] as String,
      extension: json['extension'] as String,
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'type': instance.type.toJson(),
      'file_url': instance.fileUrl,
      'url': instance.url,
      'size': instance.size,
      'human_readable_size': instance.humanReadableSize,
      'extension': instance.extension,
    };

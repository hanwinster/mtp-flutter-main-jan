// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_url_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUrlEntity _$ImageUrlEntityFromJson(Map<String, dynamic> json) =>
    ImageUrlEntity(
      original: json['original'] as String,
      thumbnail: json['thumb'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$ImageUrlEntityToJson(ImageUrlEntity instance) =>
    <String, dynamic>{
      'original': instance.original,
      'thumb': instance.thumbnail,
      'medium': instance.medium,
      'large': instance.large,
    };

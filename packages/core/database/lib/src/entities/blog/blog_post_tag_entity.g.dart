// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_tag_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostTagEntity _$BlogPostTagEntityFromJson(Map<String, dynamic> json) =>
    BlogPostTagEntity(
      id: json['id'] as String,
      name: json['tag'] as String,
    );

Map<String, dynamic> _$BlogPostTagEntityToJson(BlogPostTagEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.name,
    };

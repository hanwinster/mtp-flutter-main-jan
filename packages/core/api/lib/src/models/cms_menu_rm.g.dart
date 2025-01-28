// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_menu_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmsMenuRM _$CmsMenuRMFromJson(Map<String, dynamic> json) => CmsMenuRM(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      showWeb: (json['show_web'] as num?)?.toInt(),
      showMobile: (json['show_mobile'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      url: json['url'] as String?,
    );

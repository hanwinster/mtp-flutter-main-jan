// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_category_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupCategoryRM _$ThematicGroupCategoryRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupCategoryRM(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      numberOfGroups: (json['number_of_groups'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

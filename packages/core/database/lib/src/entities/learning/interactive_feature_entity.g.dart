// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interactive_feature_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractiveFeatureEntity _$InteractiveFeatureEntityFromJson(
        Map<String, dynamic> json) =>
    InteractiveFeatureEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      courseId: json['course_id'] as String,
      attachedTo: json['attached_to'] as String,
      attachedToId: json['attached_to_id'] as String,
      type: InteractiveFeatureTypeEntity.fromJson(json['type'] as String),
      position: (json['position'] as num).toInt(),
      placement: InteractiveFeaturePlacementEntity.fromJson(
          json['placement'] as String),
      description: json['description'] as String,
      backTitle: json['back_title'] as String,
      backDescription: json['back_description'] as String,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => InteractiveSortingAnswerOptionEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      correctAnswer: (json['correct_answer'] as num).toInt(),
      image: json['image'] as String,
      backImage: json['back_image'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$InteractiveFeatureEntityToJson(
        InteractiveFeatureEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course_id': instance.courseId,
      'attached_to': instance.attachedTo,
      'attached_to_id': instance.attachedToId,
      'type': instance.type.toJson(),
      'position': instance.position,
      'placement': instance.placement.toJson(),
      'description': instance.description,
      'back_title': instance.backTitle,
      'back_description': instance.backDescription,
      'options': instance.options?.map((e) => e.toJson()).toList(),
      'correct_answer': instance.correctAnswer,
      'image': instance.image,
      'back_image': instance.backImage,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

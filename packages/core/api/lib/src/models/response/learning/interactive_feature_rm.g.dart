// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interactive_feature_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractiveFeatureRM _$InteractiveFeatureRMFromJson(
        Map<String, dynamic> json) =>
    InteractiveFeatureRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      courseId: (json['course_id'] as num?)?.toInt(),
      attachedTo: json['attached_to'] as String?,
      attachedToId: (json['attached_to_id'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : InteractiveFeatureTypeRM.fromJson(json['type'] as String),
      position: (json['position'] as num?)?.toInt(),
      placement: json['order'] == null
          ? null
          : InteractiveFeaturePlacementRM.fromJson(json['order'] as String),
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
      backTitle: json['back_title'] as String?,
      backDescription: json['back_description'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => InteractiveSortingAnswerOptionRM.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      rightAnswer: (json['right_answer'] as num?)?.toInt(),
      image: json['image'] as String?,
      backImage: json['back_image'] as String?,
    );

Map<String, dynamic> _$InteractiveFeatureRMToJson(
        InteractiveFeatureRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course_id': instance.courseId,
      'attached_to': instance.attachedTo,
      'attached_to_id': instance.attachedToId,
      'type': instance.type,
      'position': instance.position,
      'order': instance.placement,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'back_title': instance.backTitle,
      'back_description': instance.backDescription,
      'answers': instance.answers,
      'right_answer': instance.rightAnswer,
      'image': instance.image,
      'back_image': instance.backImage,
    };

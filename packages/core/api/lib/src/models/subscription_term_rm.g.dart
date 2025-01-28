// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_term_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionTermRM _$SubscriptionTermRMFromJson(Map<String, dynamic> json) =>
    SubscriptionTermRM(
      id: (json['id'] as num?)?.toInt(),
      en: json['en'] == null
          ? null
          : SubscriptionTermContentRM.fromJson(
              json['en'] as Map<String, dynamic>),
      mm: json['mm'] == null
          ? null
          : SubscriptionTermContentRM.fromJson(
              json['mm'] as Map<String, dynamic>),
    );

SubscriptionTermContentRM _$SubscriptionTermContentRMFromJson(
        Map<String, dynamic> json) =>
    SubscriptionTermContentRM(
      title: json['title'] as String?,
      intro: json['intro'] as String?,
      useOfMaterials: json['use_of_materials'] as String?,
      generalDisclaimer: json['general_disclaimer'] as String?,
    );

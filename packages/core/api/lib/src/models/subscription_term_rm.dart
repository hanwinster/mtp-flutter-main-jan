import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_term_rm.g.dart';

@JsonSerializable(createToJson: false)
class SubscriptionTermRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'en')
  final SubscriptionTermContentRM? en;
  @JsonKey(name: 'mm')
  final SubscriptionTermContentRM? mm;

  const SubscriptionTermRM({
    this.id,
    this.en,
    this.mm,
  });

  @override
  List<Object?> get props => [id, en, mm];

  factory SubscriptionTermRM.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionTermRMFromJson(json);

  SubscriptionTerm toDomainModel({
    required Language language,
  }) {
    final bool isBurmese = language == Language.my;
    return SubscriptionTerm(
      title: isBurmese ? mm?.title ?? '' : en?.title ?? '',
      intro: isBurmese ? mm?.intro ?? '' : en?.intro ?? '',
      useOfMaterials: isBurmese ? mm?.useOfMaterials ?? '' : en?.useOfMaterials ?? '',
      generalDisclaimer: isBurmese ? mm?.generalDisclaimer ?? '' : en?.generalDisclaimer ?? '',
    );
  }
}

@JsonSerializable(createToJson: false)
class SubscriptionTermContentRM extends Equatable {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'intro')
  final String? intro;
  @JsonKey(name: 'use_of_materials')
  final String? useOfMaterials;
  @JsonKey(name: 'general_disclaimer')
  final String? generalDisclaimer;

  const SubscriptionTermContentRM({
    this.title,
    this.intro,
    this.useOfMaterials,
    this.generalDisclaimer,
  });

  @override
  List<Object?> get props => [
        title,
        intro,
        useOfMaterials,
        generalDisclaimer,
      ];

  factory SubscriptionTermContentRM.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionTermContentRMFromJson(json);
}

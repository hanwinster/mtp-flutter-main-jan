// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqRM _$FaqRMFromJson(Map<String, dynamic> json) => FaqRM(
      id: (json['id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

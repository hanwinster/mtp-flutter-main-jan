import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class FaqRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const FaqRM({
    this.id,
    this.categoryId,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  factory FaqRM.fromJson(Map<String, dynamic> json) {
    return _$FaqRMFromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        categoryId,
        question,
        answer,
        createdAt,
        updatedAt,
      ];

  Faq toDomainModel() {
    return Faq(
      id: id?.toString() ?? '',
      categoryId: categoryId.toString(),
      question: question ?? '',
      answer: answer ?? '',
    );
  }
}

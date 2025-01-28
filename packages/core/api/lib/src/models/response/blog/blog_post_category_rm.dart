import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_category_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogPostCategoryRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  const BlogPostCategoryRM({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory BlogPostCategoryRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostCategoryRMFromJson(json);

  BlogPostCategory toDomainModel() => BlogPostCategory(
        id: id?.toString() ?? (throw Exception("id must not be null")),
        name: name ?? '',
      );
}

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_category_entity.g.dart';

@JsonSerializable()
class BlogPostCategoryEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  const BlogPostCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  factory BlogPostCategoryEntity.fromJson(Map<String, dynamic> json) => _$BlogPostCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostCategoryEntityToJson(this);

  BlogPostCategory toDomainModel() {
    return BlogPostCategory(
      id: id,
      name: name,
    );
  }
}
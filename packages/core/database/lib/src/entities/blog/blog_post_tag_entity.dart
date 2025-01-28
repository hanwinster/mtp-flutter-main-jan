import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_tag_entity.g.dart';

@JsonSerializable()
class BlogPostTagEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "tag")
  final String name;

  const BlogPostTagEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory BlogPostTagEntity.fromJson(Map<String, dynamic> json) =>
      _$BlogPostTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostTagEntityToJson(this);

  BlogPostTag toDomainModel() => BlogPostTag(
        id: id,
        name: name,
      );
}

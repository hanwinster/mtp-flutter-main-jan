import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_tag_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogPostTagRM extends Equatable {

  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "tag")
  final String? name;

  const BlogPostTagRM({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory BlogPostTagRM.fromJson(Map<String, dynamic> json) => _$BlogPostTagRMFromJson(json);

  BlogPostTag toDomain() => BlogPostTag(
    id: id?.toString() ?? (throw Exception('id is required')),
    name: name ?? '',
  );
}
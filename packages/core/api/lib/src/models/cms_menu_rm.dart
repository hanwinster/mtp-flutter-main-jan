import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cms_menu_rm.g.dart';

@JsonSerializable(createToJson: false)
class CmsMenuRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "show_web")
  final int? showWeb;
  @JsonKey(name: "show_mobile")
  final int? showMobile;
  @JsonKey(name: "order")
  final int? order;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "url")
  final String? url;

  CmsMenuRM ({
    this.id,
    this.slug,
    this.title,
    this.showWeb,
    this.showMobile,
    this.order,
    this.icon,
    this.url,
  });

  factory CmsMenuRM.fromJson(Map<String, dynamic> json) {
    return _$CmsMenuRMFromJson(json);
  }

  CmsMenu toDomainModel() {
    return CmsMenu(
      id: id?.toString() ?? '',
      title: title ?? '',
      order: order ?? 0,
      icon: icon ?? '',
      url: url ?? '',
    );
  }
}



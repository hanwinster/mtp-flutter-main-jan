import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_manual_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserManualRM {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "type", unknownEnumValue: MediaTypeRM.unknown)
  final MediaTypeRM? type;

  UserManualRM({
    this.title,
    this.link,
    this.id,
    this.type,
  });

  factory UserManualRM.fromJson(Map<String, dynamic> json) {
    return _$UserManualRMFromJson(json);
  }

  MediaType _mapMediaType() {
    final domainMediaType = type?.toDomainModel() ?? MediaType.unknown;
    if (domainMediaType == MediaType.unknown) {
      return MediaType.fromUrl(link ?? '');
    } else {
      return domainMediaType;
    }
  }

  UserManual toDomainModel() {
    return UserManual(
      title: title ?? '',
      url: link ?? '',
      id: id?.toString() ?? '',
      mediaType: _mapMediaType(),
    );
  }
}

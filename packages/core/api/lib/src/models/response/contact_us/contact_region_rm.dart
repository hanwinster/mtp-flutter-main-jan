import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_region_rm.g.dart';

@JsonSerializable(createToJson: false)
class ContactRegionRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  ContactRegionRM({
    this.id,
    this.name,
  });

  factory ContactRegionRM.fromJson(Map<String, dynamic> json) {
    return _$ContactRegionRMFromJson(json);
  }

  ContactRegion toDomainModel() {
    return ContactRegion(
      id: id?.toString() ?? (throw Exception("id is required")),
      name: name ?? '',
    );
  }
}

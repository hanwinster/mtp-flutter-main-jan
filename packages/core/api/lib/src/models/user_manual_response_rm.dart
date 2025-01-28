import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'user_manual_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserManualResponseRM extends Equatable {
  @JsonKey(name: 'web')
  final List<UserManualRM>? webUserManuals;
  @JsonKey(name: 'mobile')
  final List<UserManualRM>? mobileUserManuals;

  const UserManualResponseRM({
    this.webUserManuals,
    this.mobileUserManuals,
  });

  @override
  List<Object?> get props => [webUserManuals, mobileUserManuals];

  factory UserManualResponseRM.fromJson(Map<String, dynamic> json) =>
      _$UserManualResponseRMFromJson(json);
}

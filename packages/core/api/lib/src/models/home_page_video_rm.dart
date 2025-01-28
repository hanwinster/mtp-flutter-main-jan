import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_video_rm.g.dart';

@JsonSerializable(createToJson: false)
class HomePageVideoRM extends Equatable {
  @JsonKey(name: 'link')
  final String? link;

  const HomePageVideoRM({
    this.link,
  });

  @override
  List<Object?> get props => [link];

  factory HomePageVideoRM.fromJson(Map<String, dynamic> json) =>
      _$HomePageVideoRMFromJson(json);

  HomePageVideoModel toDomainModel() {
    return HomePageVideoModel(
      link: link ?? '',
    );
  }
}

import 'package:base/base.dart';

class HomePageVideoModel extends Equatable {
  final String link;

  const HomePageVideoModel({
    required this.link,
  });

  @override
  List<Object> get props => [link];
}

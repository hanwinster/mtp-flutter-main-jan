import 'package:base/base.dart';

class CmsMenu extends Equatable {
  final String id;
  final String title;
  final int order;
  final String icon;
  final String url;

  const CmsMenu({
    required this.id,
    required this.title,
    required this.order,
    required this.icon,
    required this.url,
  });

  @override
  List<Object> get props => [id, title, order, icon, url];
}

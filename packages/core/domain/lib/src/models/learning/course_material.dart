import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseMaterial extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final String key;
  final CourseMaterialType type;
  final List<CourseMaterial> submodules;

  const CourseMaterial({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.key,
    required this.type,
    required this.submodules,
  });

  @override
  List<Object> get props => [id, title, isCompleted, key, type, submodules,];

  bool get hasSubmodules => submodules.isNotEmpty;

  bool get isAllSubModulesCompleted => submodules.every((element) => element.isCompleted);

  CourseMaterial copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    String? key,
    CourseMaterialType? type,
    List<CourseMaterial>? submodules,
  }) {
    return CourseMaterial(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      key: key ?? this.key,
      type: type ?? this.type,
      submodules: submodules ?? this.submodules,
    );
  }
}
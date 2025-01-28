import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseMaterialCompletion extends Equatable {
  final String key;
  final bool isCompleted;

  const CourseMaterialCompletion({
    required this.isCompleted,
    required this.key,
  });

  @override
  List<Object> get props => [key, isCompleted];

  CourseMaterialCompletion copyWith({
    String? key,
    bool? isCompleted,
  }) {
    return CourseMaterialCompletion(
      key: key ?? this.key,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  CourseMaterialType get type {
    final prefix = key.split('_').first;
    return CourseMaterialType.fromPrefix(prefix);
  }

  String get id {
    return key.split('_').last;
  }

  CourseMaterial toCourseMaterial() {
    return CourseMaterial(
      id: id,
      title: '',
      key: key,
      isCompleted: isCompleted,
      type: type,
      submodules: const [],
    );
  }
}
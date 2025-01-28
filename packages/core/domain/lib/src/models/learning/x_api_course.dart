import 'package:base/base.dart';
import 'package:domain/domain.dart';

class XApiCourse extends Equatable {
  final String launchLink;
  final XApiCompletionStatus completionStatus;

  const XApiCourse({
    required this.launchLink,
    required this.completionStatus,
  });

  @override
  List<Object> get props => [
        launchLink,
        completionStatus,
      ];
}

import 'package:base/base.dart';
import 'package:domain/domain.dart';


class UiLecture extends Equatable {
  final String id;
  final String title;
  final String resourceUrl;
  final String description;
  final LectureResourceType resourceType;
  final String videoUrl;
  final String attachedFileUrl;
  final String courseId;
  final List<InteractiveFeatureGroup> upperInteractiveFeatureGroups;
  final List<InteractiveFeatureGroup> lowerInteractiveFeatureGroups;
  final Media? media;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UiLecture({
    required this.id,
    required this.title,
    required this.resourceUrl,
    required this.description,
    required this.resourceType,
    required this.videoUrl,
    required this.attachedFileUrl,
    required this.courseId,
    required this.upperInteractiveFeatureGroups,
    required this.lowerInteractiveFeatureGroups,
    required this.media,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    resourceUrl,
    description,
    resourceType,
    videoUrl,
    courseId,
    upperInteractiveFeatureGroups,
    lowerInteractiveFeatureGroups,
    createdAt,
    updatedAt,
  ];

  factory UiLecture.fromDomainModel(Lecture lecture) {return UiLecture(
      id: lecture.id,
      title: lecture.title,
      resourceUrl: lecture.resourceUrl,
      description: lecture.description,
      resourceType: lecture.resourceType,
      videoUrl: lecture.videoUrl,
      attachedFileUrl: lecture.attachedFileUrl,
      courseId: lecture.courseId,
      upperInteractiveFeatureGroups: InteractiveFeatureGroup.groupUpperInteractiveFeatures(lecture.interactiveFeatures),
      lowerInteractiveFeatureGroups: InteractiveFeatureGroup.groupLowerInteractiveFeatures(lecture.interactiveFeatures),
      media: lecture.media,
      createdAt: lecture.createdAt,
      updatedAt: lecture.updatedAt,
    );
  }

  UiLecture copyWith({
    String? id,
    String? title,
    String? resourceUrl,
    String? description,
    LectureResourceType? resourceType,
    String? videoUrl,
    String? attachedFileUrl,
    String? courseId,
    List<InteractiveFeatureGroup>? upperInteractiveFeatureGroups,
    List<InteractiveFeatureGroup>? lowerInteractiveFeatureGroups,
    Media? media,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UiLecture(
      id: id ?? this.id,
      title: title ?? this.title,
      resourceUrl: resourceUrl ?? this.resourceUrl,
      description: description ?? this.description,
      resourceType: resourceType ?? this.resourceType,
      videoUrl: videoUrl ?? this.videoUrl,
      attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
      courseId: courseId ?? this.courseId,
      upperInteractiveFeatureGroups:
          upperInteractiveFeatureGroups ?? this.upperInteractiveFeatureGroups,
      lowerInteractiveFeatureGroups:
          lowerInteractiveFeatureGroups ?? this.lowerInteractiveFeatureGroups,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

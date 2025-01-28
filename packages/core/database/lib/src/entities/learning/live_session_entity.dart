import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LiveSessionEntity extends Equatable {
  final String id;
  final String courseId;
  final String lectureId;
  final String topic;
  final String meetingId;
  final DateTime startDateTime;
  final String agenda;
  final bool isHostVideoEnabled;
  final bool isParticipantVideoEnabled;
  final Duration duration;
  final String description;
  final String passcode;
  final String status;
  final String startUrl;
  final String joinUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const LiveSessionEntity({
    required this.id,
    required this.courseId,
    required this.lectureId,
    required this.topic,
    required this.meetingId,
    required this.startDateTime,
    required this.agenda,
    required this.isHostVideoEnabled,
    required this.isParticipantVideoEnabled,
    required this.duration,
    required this.description,
    required this.passcode,
    required this.status,
    required this.startUrl,
    required this.joinUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        courseId,
        lectureId,
        topic,
        meetingId,
        startDateTime,
        agenda,
        isHostVideoEnabled,
        isParticipantVideoEnabled,
        duration,
        description,
        passcode,
        status,
        startUrl,
        joinUrl,
        createdAt,
        updatedAt,
      ];

  LiveSession toDomainModel() {
    return LiveSession(
      id: id,
      lectureId: lectureId,
      topic: topic,
      meetingId: meetingId,
      startDateTime: startDateTime,
      agenda: agenda,
      isHostVideoEnabled: isHostVideoEnabled,
      isParticipantVideoEnabled: isParticipantVideoEnabled,
      duration: duration,
      description: description,
      passcode: passcode,
      status: status,
      startUrl: startUrl,
      joinUrl: joinUrl,
    );
  }
}

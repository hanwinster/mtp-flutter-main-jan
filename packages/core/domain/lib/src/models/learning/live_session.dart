import 'package:base/base.dart';

class LiveSession extends Equatable {
  final String id;
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

  const LiveSession({
    required this.id,
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
  });

  @override
  List<Object> get props =>
      [
        id,
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
      ];

  bool get isStarted => startDateTime.isBefore(DateTime.now());
}
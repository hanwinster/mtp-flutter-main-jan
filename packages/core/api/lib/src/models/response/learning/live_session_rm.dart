import 'package:api/src/json/converters/converters.dart';
import 'package:api/src/utils/myanmar_date_time_parser.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_session_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class LiveSessionRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "lecture_id")
  final int? lectureId;
  @JsonKey(name: "topic")
  final String? topic;
  @JsonKey(name: "meeting_id")
  final String? meetingId;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "start_time")
  final String? startTime;
  @JsonKey(name: "agenda")
  final String? agenda;
  @JsonKey(name: "host_video")
  final int? hostVideo;
  @JsonKey(name: "participant_video")
  final int? participantVideo;
  @JsonKey(name: "duration")
  final num? duration;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "passcode")
  final String? passcode;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "start_url")
  final String? startUrl;
  @JsonKey(name: "join_url")
  final String? joinUrl;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LiveSessionRM({
    this.id,
    this.courseId,
    this.userId,
    this.lectureId,
    this.topic,
    this.meetingId,
    this.startDate,
    this.startTime,
    this.agenda,
    this.hostVideo,
    this.participantVideo,
    this.duration,
    this.description,
    this.passcode,
    this.status,
    this.startUrl,
    this.joinUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        courseId,
        userId,
        lectureId,
        topic,
        meetingId,
        startDate,
        startTime,
        agenda,
        hostVideo,
        participantVideo,
        duration,
        description,
        passcode,
        status,
        startUrl,
        joinUrl,
        createdAt,
        updatedAt,
      ];

  factory LiveSessionRM.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionRMFromJson(json);

  DateTime startDateTimeInUtc() {
    if (startDate == null || startTime == null) {
      return DateTime.now();
    }

    return MyanmarDateTimeParser.parseToUtc('$startDate $startTime');
  }

  LiveSession toDomainModel() {
    return LiveSession(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      lectureId: lectureId?.toString() ?? '',
      topic: topic ?? '',
      meetingId: meetingId ?? '',
      startDateTime: startDateTimeInUtc(),
      agenda: agenda ?? '',
      isHostVideoEnabled: hostVideo == 1,
      isParticipantVideoEnabled: participantVideo == 1,
      duration: _mapDuration(duration),
      description: description ?? '',
      passcode: passcode ?? '',
      status: status ?? '',
      startUrl: startUrl ?? '',
      joinUrl: joinUrl ?? '',
    );
  }

  Duration _mapDuration(num? duration) {
    return Duration(minutes: duration?.toInt() ?? 0);
  }
}

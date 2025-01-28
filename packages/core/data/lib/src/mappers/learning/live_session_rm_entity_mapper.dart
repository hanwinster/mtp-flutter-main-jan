import 'package:api/api.dart';
import 'package:database/database.dart';

extension LiveSessionRMEntityMapper on LiveSessionRM {
  LiveSessionEntity toEntity() {
    return LiveSessionEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      courseId: courseId?.toString() ?? '',
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
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }

  Duration _mapDuration(num? duration) {
    return Duration(minutes: duration?.toInt() ?? 0);
  }
}

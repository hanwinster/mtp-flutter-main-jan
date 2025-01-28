import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LiveSessionEntryEntityMapper on LiveSessionEntry {
  LiveSessionEntity toEntity() {
    return LiveSessionEntity(
      id: id,
      courseId: courseId,
      lectureId: lectureId,
      topic: topic,
      meetingId: meetingId,
      startDateTime: startDateTime,
      agenda: agenda,
      isHostVideoEnabled: isHostVideoEnabled,
      isParticipantVideoEnabled: isParticipantVideoEnabled,
      duration: Duration(minutes: durationInMinutes),
      description: description,
      passcode: passcode,
      status: status,
      startUrl: startUrl,
      joinUrl: joinUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

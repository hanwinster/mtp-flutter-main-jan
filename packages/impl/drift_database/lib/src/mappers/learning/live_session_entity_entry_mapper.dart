import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LiveSessionEntityEntryMapper on LiveSessionEntity {
  LiveSessionEntry toEntry() {
    return LiveSessionEntry(
      id: id,
      courseId: courseId,
      lectureId: lectureId,
      topic: topic,
      meetingId: meetingId,
      startDateTime: startDateTime,
      agenda: agenda,
      isHostVideoEnabled: isHostVideoEnabled,
      isParticipantVideoEnabled: isParticipantVideoEnabled,
      durationInMinutes: duration.inMinutes,
      description: description,
      passcode: passcode,
      status: status,
      startUrl: startUrl,
      joinUrl: joinUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: null,
    );
  }
}

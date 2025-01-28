import 'package:drift/drift.dart';

@DataClassName('LiveSessionEntry')
class LiveSessionTable extends Table {
  @override
  String? get tableName => 'live_sessions';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get courseId => text()();

  TextColumn get lectureId => text()();

  TextColumn get topic => text()();

  TextColumn get meetingId => text()();

  DateTimeColumn get startDateTime => dateTime()();

  TextColumn get agenda => text()();

  BoolColumn get isHostVideoEnabled => boolean()();

  BoolColumn get isParticipantVideoEnabled => boolean()();

  IntColumn get durationInMinutes => integer()();

  TextColumn get description => text()();

  TextColumn get passcode => text()();

  TextColumn get status => text()();

  TextColumn get startUrl => text()();

  TextColumn get joinUrl => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}

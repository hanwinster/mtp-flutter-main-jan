// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_session_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveSessionRM _$LiveSessionRMFromJson(Map<String, dynamic> json) =>
    LiveSessionRM(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      lectureId: (json['lecture_id'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      meetingId: json['meeting_id'] as String?,
      startDate: json['start_date'] as String?,
      startTime: json['start_time'] as String?,
      agenda: json['agenda'] as String?,
      hostVideo: (json['host_video'] as num?)?.toInt(),
      participantVideo: (json['participant_video'] as num?)?.toInt(),
      duration: json['duration'] as num?,
      description: json['description'] as String?,
      passcode: json['passcode'] as String?,
      status: json['status'] as String?,
      startUrl: json['start_url'] as String?,
      joinUrl: json['join_url'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

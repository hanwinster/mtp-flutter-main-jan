// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_channel_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OtpChannelPreferenceAdapter extends TypeAdapter<OtpChannelPreference> {
  @override
  final int typeId = 6;

  @override
  OtpChannelPreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OtpChannelPreference.email;
      case 1:
        return OtpChannelPreference.sms;
      case 2:
        return OtpChannelPreference.unknown;
      default:
        return OtpChannelPreference.email;
    }
  }

  @override
  void write(BinaryWriter writer, OtpChannelPreference obj) {
    switch (obj) {
      case OtpChannelPreference.email:
        writer.writeByte(0);
        break;
      case OtpChannelPreference.sms:
        writer.writeByte(1);
        break;
      case OtpChannelPreference.unknown:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtpChannelPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

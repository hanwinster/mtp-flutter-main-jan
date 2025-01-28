// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_type_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTypePreferenceAdapter extends TypeAdapter<UserTypePreference> {
  @override
  final int typeId = 5;

  @override
  UserTypePreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserTypePreference.independentLearner;
      case 1:
        return UserTypePreference.journalist;
      case 2:
        return UserTypePreference.studentTeacher;
      case 3:
        return UserTypePreference.independentTeacher;
      case 4:
        return UserTypePreference.unknown;
      default:
        return UserTypePreference.independentLearner;
    }
  }

  @override
  void write(BinaryWriter writer, UserTypePreference obj) {
    switch (obj) {
      case UserTypePreference.independentLearner:
        writer.writeByte(0);
        break;
      case UserTypePreference.journalist:
        writer.writeByte(1);
        break;
      case UserTypePreference.studentTeacher:
        writer.writeByte(2);
        break;
      case UserTypePreference.independentTeacher:
        writer.writeByte(3);
        break;
      case UserTypePreference.unknown:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTypePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

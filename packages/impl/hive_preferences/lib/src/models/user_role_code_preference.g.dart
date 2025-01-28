// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_code_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleCodePreferenceAdapter
    extends TypeAdapter<UserRoleCodePreference> {
  @override
  final int typeId = 9;

  @override
  UserRoleCodePreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRoleCodePreference.admin;
      case 1:
        return UserRoleCodePreference.manager;
      case 2:
        return UserRoleCodePreference.teacherEducator;
      case 3:
        return UserRoleCodePreference.studentTeacher;
      case 4:
        return UserRoleCodePreference.journalist;
      case 5:
        return UserRoleCodePreference.independentLearner;
      case 6:
        return UserRoleCodePreference.independentTeacher;
      case 7:
        return UserRoleCodePreference.guest;
      case 8:
        return UserRoleCodePreference.unknown;
      default:
        return UserRoleCodePreference.admin;
    }
  }

  @override
  void write(BinaryWriter writer, UserRoleCodePreference obj) {
    switch (obj) {
      case UserRoleCodePreference.admin:
        writer.writeByte(0);
        break;
      case UserRoleCodePreference.manager:
        writer.writeByte(1);
        break;
      case UserRoleCodePreference.teacherEducator:
        writer.writeByte(2);
        break;
      case UserRoleCodePreference.studentTeacher:
        writer.writeByte(3);
        break;
      case UserRoleCodePreference.journalist:
        writer.writeByte(4);
        break;
      case UserRoleCodePreference.independentLearner:
        writer.writeByte(5);
        break;
      case UserRoleCodePreference.independentTeacher:
        writer.writeByte(6);
        break;
      case UserRoleCodePreference.guest:
        writer.writeByte(7);
        break;
      case UserRoleCodePreference.unknown:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleCodePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

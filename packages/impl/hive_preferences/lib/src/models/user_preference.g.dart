// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPreferenceAdapter extends TypeAdapter<UserPreference> {
  @override
  final int typeId = 2;

  @override
  UserPreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPreference(
      id: fields[0] as String,
      username: fields[1] as String,
      fullName: fields[2] as String,
      email: fields[3] as String,
      phoneCode: fields[4] as String,
      phoneNumber: fields[5] as String,
      otpChannel: fields[6] as OtpChannelPreference,
      gender: fields[7] as GenderPreference,
      userType: fields[8] as UserTypePreference,
      organization: fields[9] as String,
      affiliation: fields[10] as String,
      position: fields[11] as String,
      college: fields[12] as CollegePreference?,
      educationYears: (fields[13] as List).cast<EducationYearPreference>(),
      profileImageUrl: fields[14] as ImageUrlPreference?,
      isEligibleToSubscribe: fields[15] as bool,
      isAlreadySubscribed: fields[16] as bool,
      userRoleCode: fields[17] as UserRoleCodePreference?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPreference obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneCode)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.otpChannel)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.userType)
      ..writeByte(9)
      ..write(obj.organization)
      ..writeByte(10)
      ..write(obj.affiliation)
      ..writeByte(11)
      ..write(obj.position)
      ..writeByte(12)
      ..write(obj.college)
      ..writeByte(13)
      ..write(obj.educationYears)
      ..writeByte(14)
      ..write(obj.profileImageUrl)
      ..writeByte(15)
      ..write(obj.isEligibleToSubscribe)
      ..writeByte(16)
      ..write(obj.isAlreadySubscribed)
      ..writeByte(17)
      ..write(obj.userRoleCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

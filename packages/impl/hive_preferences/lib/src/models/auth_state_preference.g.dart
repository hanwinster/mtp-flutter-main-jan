// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthStatePreferenceAdapter extends TypeAdapter<AuthStatePreference> {
  @override
  final int typeId = 0;

  @override
  AuthStatePreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AuthStatePreference.loggedIn;
      case 1:
        return AuthStatePreference.loggedOut;
      default:
        return AuthStatePreference.loggedIn;
    }
  }

  @override
  void write(BinaryWriter writer, AuthStatePreference obj) {
    switch (obj) {
      case AuthStatePreference.loggedIn:
        writer.writeByte(0);
        break;
      case AuthStatePreference.loggedOut:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthStatePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

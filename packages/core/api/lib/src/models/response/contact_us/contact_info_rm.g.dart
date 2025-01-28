// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfoRM _$ContactInfoRMFromJson(Map<String, dynamic> json) =>
    ContactInfoRM(
      phone: json['phone'] == null
          ? null
          : ContactInfoPhoneRM.fromJson(json['phone'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : ContactInfoAddressRM.fromJson(
              json['address'] as Map<String, dynamic>),
      email: json['email'] == null
          ? null
          : ContactInfoEmailRM.fromJson(json['email'] as Map<String, dynamic>),
    );

ContactInfoPhoneRM _$ContactInfoPhoneRMFromJson(Map<String, dynamic> json) =>
    ContactInfoPhoneRM(
      title: json['title'] as String?,
      description: json['description'] as String?,
      value: json['value'] as String?,
    );

ContactInfoAddressRM _$ContactInfoAddressRMFromJson(
        Map<String, dynamic> json) =>
    ContactInfoAddressRM(
      title: json['title'] as String?,
      description: json['description'] as String?,
      value: json['value'] as String?,
      latLng: json['data'] == null
          ? null
          : ContactInfoAddressLatLongRM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

ContactInfoAddressLatLongRM _$ContactInfoAddressLatLongRMFromJson(
        Map<String, dynamic> json) =>
    ContactInfoAddressLatLongRM(
      long: json['long'] as String?,
      lat: json['lat'] as String?,
    );

ContactInfoEmailRM _$ContactInfoEmailRMFromJson(Map<String, dynamic> json) =>
    ContactInfoEmailRM(
      title: json['title'] as String?,
      description: json['description'] as String?,
      value: json['value'] as String?,
    );

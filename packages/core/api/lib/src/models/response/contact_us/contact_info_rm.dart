import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_info_rm.g.dart';

@JsonSerializable(createToJson: false)
class ContactInfoRM {
  @JsonKey(name: "phone")
  final ContactInfoPhoneRM? phone;
  @JsonKey(name: "address")
  final ContactInfoAddressRM? address;
  @JsonKey(name: "email")
  final ContactInfoEmailRM? email;

  ContactInfoRM ({
    this.phone,
    this.address,
    this.email,
  });

  factory ContactInfoRM.fromJson(Map<String, dynamic> json) {
    return _$ContactInfoRMFromJson(json);
  }

  ContactInfo toDomainModel() {
    return ContactInfo(
      phone: phone?.toDomainModel(),
      address: address?.toDomainModel(),
      email: email?.toDomainModel(),
    );
  }
}

@JsonSerializable(createToJson: false)
class ContactInfoPhoneRM {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "value")
  final String? value;

  ContactInfoPhoneRM ({
    this.title,
    this.description,
    this.value,
  });

  factory ContactInfoPhoneRM.fromJson(Map<String, dynamic> json) {
    return _$ContactInfoPhoneRMFromJson(json);
  }

  ContactInfoPhone toDomainModel() {
    return ContactInfoPhone(
      title: title ?? '',
      message: description ?? '',
      phone: value ?? '',
    );
  }
}

@JsonSerializable(createToJson: false)
class ContactInfoAddressRM {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "value")
  final String? value;
  @JsonKey(name: "data")
  final ContactInfoAddressLatLongRM? latLng;

  ContactInfoAddressRM ({
    this.title,
    this.description,
    this.value,
    this.latLng,
  });

  factory ContactInfoAddressRM.fromJson(Map<String, dynamic> json) {
    return _$ContactInfoAddressRMFromJson(json);
  }

  ContactInfoAddress toDomainModel() {
    return ContactInfoAddress(
      title: title ?? '',
      message: description ?? '',
      address: value ?? '',
      latLng: latLng?.toDomainModel(),
    );
  }
}

@JsonSerializable(createToJson: false)
class ContactInfoAddressLatLongRM {
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "lat")
  final String? lat;

  ContactInfoAddressLatLongRM ({
    this.long,
    this.lat,
  });

  factory ContactInfoAddressLatLongRM.fromJson(Map<String, dynamic> json) {
    return _$ContactInfoAddressLatLongRMFromJson(json);
  }

  ContactInfoLatLng? toDomainModel() {
    if (long == null || lat == null) {
      return null;
    }
    return ContactInfoLatLng(
      lng: double.tryParse(long ?? '') ?? (throw Exception('Invalid longitude')),
      lat: double.tryParse(lat ?? '') ?? (throw Exception('Invalid latitude')),
    );
  }
}

@JsonSerializable(createToJson: false)
class ContactInfoEmailRM {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "value")
  final String? value;

  ContactInfoEmailRM({
    this.title,
    this.description,
    this.value,
  });

  factory ContactInfoEmailRM.fromJson(Map<String, dynamic> json) {
    return _$ContactInfoEmailRMFromJson(json);
  }

  ContactInfoEmail toDomainModel() {
    return ContactInfoEmail(
      title: title ?? '',
      message: description ?? '',
      email: value ?? '',
    );
  }
}



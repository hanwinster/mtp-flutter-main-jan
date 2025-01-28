import 'package:base/base.dart';

class ContactInfo extends Equatable {
  final ContactInfoPhone? phone;
  final ContactInfoAddress? address;
  final ContactInfoEmail? email;

  const ContactInfo({
    required this.phone,
    required this.address,
    required this.email,
  });

  @override
  List<Object?> get props => [phone, address, email];
}

class ContactInfoPhone extends Equatable {
  final String title;
  final String message;
  final String phone;

  const ContactInfoPhone({
    required this.title,
    required this.message,
    required this.phone,
  });

  @override
  List<Object> get props => [title, message, phone];
}

class ContactInfoAddress extends Equatable {
  final String title;
  final String message;
  final String address;
  final ContactInfoLatLng? latLng;

  const ContactInfoAddress({
    required this.title,
    required this.message,
    required this.address,
    required this.latLng,
  });

  @override
  List<Object?> get props => [title, message, address, latLng];
}

class ContactInfoLatLng extends Equatable {
  final double lat;
  final double lng;

  const ContactInfoLatLng({required this.lat, required this.lng});

  @override
  List<Object> get props => [lat, lng];
}

class ContactInfoEmail extends Equatable {
  final String title;
  final String message;
  final String email;

  const ContactInfoEmail({
    required this.title,
    required this.message,
    required this.email,
  });

  @override
  List<Object> get props => [title, message, email];
}

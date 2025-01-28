import 'package:domain/domain.dart';

abstract class ContactInfoRepository {
  Future<ContactInfo> getContactInfo();
  Future<List<ContactRegion>> getContactRegions();
  Future<String> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String phoneNo,
    required String organization,
    required ContactRegion? regionState,
  });
}

import 'package:api/api.dart';

abstract class ContactUsApi {

  Future<ContactInfoRM> getContactInfo();

  Future<List<ContactRegionRM>> getContactRegions();

  Future<String> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String phone,
    required String organization,
    required int? regionId,
  });
}

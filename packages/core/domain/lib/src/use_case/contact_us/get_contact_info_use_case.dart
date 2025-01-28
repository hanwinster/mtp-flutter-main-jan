import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetContactInfoUseCase {
  GetContactInfoUseCase({
    ContactInfoRepository? contact_infoRepository,
  }) : _contact_infoRepository = contact_infoRepository ?? getIt();

  final ContactInfoRepository _contact_infoRepository;

  Future<ContactInfo> call() {
    return _contact_infoRepository.getContactInfo();
  }
}

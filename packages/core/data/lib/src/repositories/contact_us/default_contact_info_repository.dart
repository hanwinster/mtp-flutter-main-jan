import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultContactInfoRepository extends ContactInfoRepository {
  DefaultContactInfoRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<ContactInfo> getContactInfo() async {
    final response = await remoteDataSourceCall(
      () => _api.getContactInfo(),
    );
    return response.toDomainModel();
  }

  @override
  Future<List<ContactRegion>> getContactRegions() async {
    final response = await remoteDataSourceCall(
      () => _api.getContactRegions(),
    );
    return response.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<String> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String phoneNo,
    required String organization,
    required ContactRegion? regionState,
  }) async {
    final response = await remoteDataSourceCall(() => _api.sendContactMessage(
          name: name,
          email: email,
          subject: subject,
          message: message,
          phone: phoneNo,
          organization: organization,
          regionId: regionState?.id.toIntOrNull(),
        ));
    return response;
  }
}

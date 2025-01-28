import 'package:api/api.dart';
import 'package:retrofit/http.dart';

mixin ContactUsRestClientMixin {
  @GET('/contact-info')
  Future<ApiDataResponse<ContactInfoRM>> getContactInfo() ;

  @GET('/region-list')
  Future<ApiDataResponse<dynamic>> getContactRegions() ;

  @POST('/contact-us')
  Future<ApiMessageDataResponse<dynamic>> sendContactMessage({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('subject') required String subject,
    @Field('message') required String message,
    @Field('phone_no') required String phone,
    @Field('organization') required String organization,
    @Field('region_state') required int? regionId,
  });
}
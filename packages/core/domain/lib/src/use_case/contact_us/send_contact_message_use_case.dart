import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SendContactMessageUseCaseRequest extends Equatable {
  const SendContactMessageUseCaseRequest({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.phoneNo,
    required this.organization,
    required this.region,
  });

  final String name;
  final String email;
  final String subject;
  final String message;
  final String phoneNo;
  final String organization;
  final ContactRegion? region;

  @override
  List<Object?> get props => [
        name,
        email,
        subject,
        message,
        phoneNo,
        organization,
        region,
      ];
}

class SendContactMessageUseCase {
  SendContactMessageUseCase({
    ContactInfoRepository? contact_InfoRepository,
  }) : _contactInfoRepository = contact_InfoRepository ?? getIt();

  final ContactInfoRepository _contactInfoRepository;

  Future<String> call(SendContactMessageUseCaseRequest request) {
    return _contactInfoRepository.sendMessage(
      name: request.name,
      email: request.email,
      subject: request.subject,
      message: request.message,
      phoneNo: request.phoneNo,
      organization: request.organization,
      regionState: request.region,
    );
  }
}

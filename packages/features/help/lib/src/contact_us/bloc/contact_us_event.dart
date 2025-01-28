part of 'contact_us_bloc.dart';

sealed class ContactUsEvent extends Equatable {
  const ContactUsEvent();
}

class ContactUsContactInfoFetched extends ContactUsEvent {
  const ContactUsContactInfoFetched();

  @override
  List<Object> get props => [];
}

class ContactUsContactRegionsFetched extends ContactUsEvent {
  const ContactUsContactRegionsFetched();

  @override
  List<Object> get props => [];
}

class ContactUsNameChanged extends ContactUsEvent {
  const ContactUsNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class ContactUsEmailChanged extends ContactUsEvent {
  const ContactUsEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ContactUsPhoneChanged extends ContactUsEvent {
  const ContactUsPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class ContactUsSubjectChanged extends ContactUsEvent {
  const ContactUsSubjectChanged(this.subject);

  final String subject;

  @override
  List<Object> get props => [subject];
}

class ContactUsOrganizationChanged extends ContactUsEvent {
  const ContactUsOrganizationChanged(this.organization);

  final String organization;

  @override
  List<Object> get props => [organization];
}

class ContactUsRegionChanged extends ContactUsEvent {
  const ContactUsRegionChanged(this.region);

  final ContactRegion region;

  @override
  List<Object> get props => [region];
}

class ContactUsMessageChanged extends ContactUsEvent {
  const ContactUsMessageChanged(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ContactUsSubmitted extends ContactUsEvent {
  const ContactUsSubmitted();

  @override
  List<Object> get props => [];
}

class ContactUsReset extends ContactUsEvent {
  const ContactUsReset();

  @override
  List<Object> get props => [];
}

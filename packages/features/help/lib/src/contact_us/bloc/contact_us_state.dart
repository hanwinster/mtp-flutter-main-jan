part of 'contact_us_bloc.dart';

final class ContactUsState extends Equatable with FormzMixin {
  const ContactUsState({
    this.contactInfoUiState = const UiStateInitial(),
    this.contactRegionsUiState = const UiStateInitial(),
    this.nameState = const NameState.unvalidated(),
    this.nameError,
    this.emailState = const EmailState.unvalidated(),
    this.emailError,
    this.phoneState = const PhoneState.unvalidated(),
    this.phoneError,
    this.subjectState = const SubjectState.unvalidated(),
    this.subjectError,
    this.organizationState = const OrganizationState.unvalidated(),
    this.organizationError,
    this.regionState = const RegionState.unvalidated(),
    this.regionError,
    this.messageState = const MessageState.unvalidated(),
    this.messageError,
    this.formSubmissionUiState = const UiStateInitial(),
  });

  final UiState<ContactInfo> contactInfoUiState;
  final UiState<List<ContactRegion>> contactRegionsUiState;

  final NameState nameState;
  final FormFieldValidationError? nameError;
  final EmailState emailState;
  final FormFieldValidationError? emailError;
  final PhoneState phoneState;
  final FormFieldValidationError? phoneError;
  final SubjectState subjectState;
  final FormFieldValidationError? subjectError;
  final OrganizationState organizationState;
  final FormFieldValidationError? organizationError;
  final RegionState regionState;
  final FormFieldValidationError? regionError;
  final MessageState messageState;
  final FormFieldValidationError? messageError;

  final UiState<String> formSubmissionUiState;

  factory ContactUsState.create() {
    return const ContactUsState();
  }

  @override
  List<FormzInput> get inputs => [
        nameState,
        emailState,
        phoneState,
        subjectState,
        organizationState,
        regionState,
        messageState,
      ];

  @override
  List<Object?> get props => [
        contactInfoUiState,
        contactRegionsUiState,
        nameState,
        nameError,
        emailState,
        emailError,
        phoneState,
        phoneError,
        subjectState,
        subjectError,
        organizationState,
        organizationError,
        regionState,
        regionError,
        messageState,
        messageError,
        formSubmissionUiState,
      ];

  ContactUsState copyWith({
    UiState<ContactInfo>? contactInfoUiState,
    UiState<List<ContactRegion>>? contactRegionsUiState,
    NameState? nameState,
    ValueGetter<FormFieldValidationError?>? nameError,
    EmailState? emailState,
    ValueGetter<FormFieldValidationError?>? emailError,
    PhoneState? phoneState,
    ValueGetter<FormFieldValidationError?>? phoneError,
    SubjectState? subjectState,
    ValueGetter<FormFieldValidationError?>? subjectError,
    OrganizationState? organizationState,
    ValueGetter<FormFieldValidationError?>? organizationError,
    RegionState? regionState,
    ValueGetter<FormFieldValidationError?>? regionError,
    MessageState? messageState,
    ValueGetter<FormFieldValidationError?>? messageError,
    UiState<String>? formSubmissionUiState,
  }) {
    return ContactUsState(
      contactInfoUiState: contactInfoUiState ?? this.contactInfoUiState,
      contactRegionsUiState:
          contactRegionsUiState ?? this.contactRegionsUiState,
      nameState: nameState ?? this.nameState,
      nameError: nameError != null ? nameError() : this.nameError,
      emailState: emailState ?? this.emailState,
      emailError: emailError != null ? emailError() : this.emailError,
      phoneState: phoneState ?? this.phoneState,
      phoneError: phoneError != null ? phoneError() : this.phoneError,
      subjectState: subjectState ?? this.subjectState,
      subjectError: subjectError != null ? subjectError() : this.subjectError,
      organizationState: organizationState ?? this.organizationState,
      organizationError: organizationError != null
          ? organizationError()
          : this.organizationError,
      regionState: regionState ?? this.regionState,
      regionError: regionError != null ? regionError() : this.regionError,
      messageState: messageState ?? this.messageState,
      messageError: messageError != null ? messageError() : this.messageError,
      formSubmissionUiState:
          formSubmissionUiState ?? this.formSubmissionUiState,
    );
  }
}

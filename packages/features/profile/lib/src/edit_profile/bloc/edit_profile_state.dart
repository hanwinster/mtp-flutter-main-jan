part of 'edit_profile_bloc.dart';

final class EditProfileState extends Equatable {
  const EditProfileState({
    required this.userTypeState,
    this.userTypeError,
    required this.organizationState,
    this.organizationError,
    required this.affiliationState,
    this.affiliationError,
    required this.positionState,
    this.positionError,
    required this.collegeState,
    this.collegeError,
    required this.educationYearState,
    this.educationYearError,
    required this.genderState,
    this.genderError,
    required this.usernameState,
    this.usernameError,
    required this.fullNameState,
    this.fullNameError,
    required this.emailState,
    this.emailError,
    required this.phoneCodeState,
    this.phoneCodeError,
    required this.phoneNumberState,
    this.phoneNumberError,
    required this.otpChannelState,
    this.otpChannelError,
    required this.profileImageState,
    this.profileImageError,
    this.userTypesUiState = const UiStateInitial(),
    this.collegesUiState = const UiStateInitial(),
    this.userUiState = const UiStateInitial(),
    this.educationYearsUiState = const UiStateInitial(),
    this.formSubmissionStatus = const UiStateInitial(),
  });

  final UserTypeState userTypeState;
  final FormFieldValidationError? userTypeError;
  final OrganizationState organizationState;
  final FormFieldValidationError? organizationError;
  final AffiliationState affiliationState;
  final FormFieldValidationError? affiliationError;
  final PositionState positionState;
  final FormFieldValidationError? positionError;
  final CollegeState collegeState;
  final FormFieldValidationError? collegeError;
  final EducationYearState educationYearState;
  final FormFieldValidationError? educationYearError;
  final GenderState genderState;
  final FormFieldValidationError? genderError;
  final UsernameState usernameState;
  final FormFieldValidationError? usernameError;
  final FullNameState fullNameState;
  final FormFieldValidationError? fullNameError;
  final EmailState emailState;
  final FormFieldValidationError? emailError;
  final PhoneCodeState phoneCodeState;
  final FormFieldValidationError? phoneCodeError;
  final PhoneNumberState phoneNumberState;
  final FormFieldValidationError? phoneNumberError;
  final OtpChannelState otpChannelState;
  final FormFieldValidationError? otpChannelError;
  final ProfileImageState profileImageState;
  final FormFieldValidationError? profileImageError;
  final UiState<List<UserType>> userTypesUiState;
  final UiState<List<College>> collegesUiState;
  final UiState<User> userUiState;
  final UiState<List<EducationYear>> educationYearsUiState;
  final UiState<UpdateUserResult> formSubmissionStatus;

  factory EditProfileState.create() {
    return const EditProfileState(
      userTypeState: UserTypeState.unvalidated(),
      organizationState: OrganizationState.unvalidated(),
      affiliationState: AffiliationState.unvalidated(),
      positionState: PositionState.unvalidated(),
      collegeState: CollegeState.unvalidated(),
      educationYearState: EducationYearState.unvalidated(),
      genderState: GenderState.unvalidated(),
      usernameState: UsernameState.unvalidated(),
      fullNameState: FullNameState.unvalidated(),
      emailState: EmailState.unvalidated(),
      phoneCodeState: PhoneCodeState.unvalidated(''),
      phoneNumberState: PhoneNumberState.unvalidated(),
      otpChannelState: OtpChannelState.unvalidated(
        OtpChannel.email,
      ),
      profileImageState: ProfileImageState.unvalidated(),
    );
  }

  @override
  List<Object?> get props => [
        userTypeState,
        userTypeError,
        organizationState,
        organizationError,
        affiliationState,
        affiliationError,
        positionState,
        positionError,
        collegeState,
        collegeError,
        educationYearState,
        educationYearError,
        genderState,
        genderError,
        usernameState,
        usernameError,
        fullNameState,
        fullNameError,
        emailState,
        emailError,
        phoneCodeState,
        phoneCodeError,
        phoneNumberState,
        phoneNumberError,
        otpChannelState,
        otpChannelError,
        profileImageState,
        profileImageError,
        userTypesUiState,
        collegesUiState,
        educationYearsUiState,
        formSubmissionStatus,
      ];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  bool get isFormSubmissionSuccess => formSubmissionStatus is UiStateSuccess;

  bool get isFormSubmissionFailure => formSubmissionStatus is UiStateFailure;

  bool get showCollegeInput => userTypeState.value == UserType.studentTeacher;

  bool get showEducationYear => userTypeState.value == UserType.studentTeacher;

  bool get showOrganizationInput =>
      userTypeState.value == UserType.independentLearner ||
      userTypeState.value == UserType.independentTeacher;

  bool get showAffiliationInput => userTypeState.value == UserType.journalist;

  bool get showPositionInput => userTypeState.value == UserType.journalist;

  bool get isForm1Valid {
    final userType = userTypeState.value;
    if (userType == UserType.studentTeacher) {
      return Formz.validate([
        collegeState,
        educationYearState,
        genderState,
      ]);
    } else if (userType == UserType.independentLearner ||
        userType == UserType.independentTeacher) {
      return Formz.validate([
        organizationState,
        genderState,
      ]);
    } else if (userType == UserType.journalist) {
      return Formz.validate([
        affiliationState,
        positionState,
      ]);
    }
    return false;
  }

  bool get isFormValid {
    final inputs = <FormzInput<dynamic, dynamic>>[];

    final userType = userTypeState.value;
    if (userType == UserType.studentTeacher) {
      inputs.addAll([
        collegeState,
        educationYearState,
        genderState,
      ]);
    } else if (userType == UserType.independentLearner ||
        userType == UserType.independentTeacher) {
      inputs.addAll([
        organizationState,
        genderState,
      ]);
    } else if (userType == UserType.journalist) {
      inputs.addAll([
        affiliationState,
        positionState,
      ]);
    }

    inputs.addAll([
      usernameState,
      fullNameState,
      emailState,
      phoneCodeState,
      phoneNumberState,
      otpChannelState,
    ]);

    return Formz.validate(inputs);
  }

  EditProfileState copyWith({
    UserTypeState? userTypeState,
    ValueGetter<FormFieldValidationError?>? userTypeError,
    OrganizationState? organizationState,
    ValueGetter<FormFieldValidationError?>? organizationError,
    AffiliationState? affiliationState,
    ValueGetter<FormFieldValidationError?>? affiliationError,
    PositionState? positionState,
    ValueGetter<FormFieldValidationError?>? positionError,
    CollegeState? collegeState,
    ValueGetter<FormFieldValidationError?>? collegeError,
    EducationYearState? educationYearState,
    ValueGetter<FormFieldValidationError?>? educationYearError,
    GenderState? genderState,
    ValueGetter<FormFieldValidationError?>? genderError,
    UsernameState? usernameState,
    ValueGetter<FormFieldValidationError?>? usernameError,
    FullNameState? fullNameState,
    ValueGetter<FormFieldValidationError?>? fullNameError,
    EmailState? emailState,
    ValueGetter<FormFieldValidationError?>? emailError,
    PhoneCodeState? phoneCodeState,
    ValueGetter<FormFieldValidationError?>? phoneCodeError,
    PhoneNumberState? phoneNumberState,
    ValueGetter<FormFieldValidationError?>? phoneNumberError,
    OtpChannelState? otpChannelState,
    ValueGetter<FormFieldValidationError?>? otpChannelError,
    ProfileImageState? profileImageState,
    ValueGetter<FormFieldValidationError?>? profileImageError,
    UiState<List<UserType>>? userTypesUiState,
    UiState<List<College>>? collegesUiState,
    UiState<User>? userUiState,
    UiState<List<EducationYear>>? educationYearsUiState,
    UiState<UpdateUserResult>? formSubmissionStatus,
  }) {
    return EditProfileState(
      userTypeState: userTypeState ?? this.userTypeState,
      userTypeError:
          userTypeError != null ? userTypeError() : this.userTypeError,
      organizationState: organizationState ?? this.organizationState,
      organizationError: organizationError != null
          ? organizationError()
          : this.organizationError,
      affiliationState: affiliationState ?? this.affiliationState,
      affiliationError:
          affiliationError != null ? affiliationError() : this.affiliationError,
      positionState: positionState ?? this.positionState,
      positionError:
          positionError != null ? positionError() : this.positionError,
      collegeState: collegeState ?? this.collegeState,
      collegeError: collegeError != null ? collegeError() : this.collegeError,
      educationYearState: educationYearState ?? this.educationYearState,
      educationYearError: educationYearError != null
          ? educationYearError()
          : this.educationYearError,
      genderState: genderState ?? this.genderState,
      genderError: genderError != null ? genderError() : this.genderError,
      usernameState: usernameState ?? this.usernameState,
      usernameError:
          usernameError != null ? usernameError() : this.usernameError,
      fullNameState: fullNameState ?? this.fullNameState,
      fullNameError:
          fullNameError != null ? fullNameError() : this.fullNameError,
      emailState: emailState ?? this.emailState,
      emailError: emailError != null ? emailError() : this.emailError,
      phoneCodeState: phoneCodeState ?? this.phoneCodeState,
      phoneCodeError:
          phoneCodeError != null ? phoneCodeError() : this.phoneCodeError,
      phoneNumberState: phoneNumberState ?? this.phoneNumberState,
      phoneNumberError:
          phoneNumberError != null ? phoneNumberError() : this.phoneNumberError,
      otpChannelState: otpChannelState ?? this.otpChannelState,
      otpChannelError:
          otpChannelError != null ? otpChannelError() : this.otpChannelError,
      profileImageState: profileImageState ?? this.profileImageState,
      profileImageError:
          profileImageError != null ? profileImageError() : this.profileImageError,
      userTypesUiState: userTypesUiState ?? this.userTypesUiState,
      collegesUiState: collegesUiState ?? this.collegesUiState,
      educationYearsUiState:
          educationYearsUiState ?? this.educationYearsUiState,
      userUiState: userUiState ?? this.userUiState,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}

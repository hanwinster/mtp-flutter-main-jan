part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    required this.currentPageIndex,
    required this.accountTypeState,
    this.accountTypeError,
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
    required this.passwordState,
    this.passwordError,
    required this.confirmPasswordState,
    this.confirmPasswordError,
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
    this.accountTypesUiState = const UiStateInitial(),
    this.userTypesUiState = const UiStateInitial(),
    this.collegesUiState = const UiStateInitial(),
    this.educationYearsUiState = const UiStateInitial(),
    this.formSubmissionStatus = const UiStateInitial(),
  });

  static const int pageIndexStep1 = 0;
  static const int pageIndexStep2 = 1;

  final int currentPageIndex;
  final AccountTypeState accountTypeState;
  final FormFieldValidationError? accountTypeError;
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
  final PasswordState passwordState;
  final FormFieldValidationError? passwordError;
  final PasswordState confirmPasswordState;
  final FormFieldValidationError? confirmPasswordError;
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
  final UiState<List<AccountType>> accountTypesUiState;
  final UiState<List<UserType>> userTypesUiState;
  final UiState<List<College>> collegesUiState;
  final UiState<List<EducationYear>> educationYearsUiState;
  final UiState<RegisterNewUserResult> formSubmissionStatus;

  factory RegisterState.create({
    required String? deviceCountryCode,
  }) {
    return RegisterState(
      currentPageIndex: pageIndexStep1,
      accountTypeState: const AccountTypeState.unvalidated(),
      userTypeState: const UserTypeState.unvalidated(),
      organizationState: const OrganizationState.unvalidated(),
      affiliationState: const AffiliationState.unvalidated(),
      positionState: const PositionState.unvalidated(),
      collegeState: const CollegeState.unvalidated(),
      educationYearState: const EducationYearState.unvalidated(),
      genderState: const GenderState.unvalidated(),
      usernameState: const UsernameState.unvalidated(),
      fullNameState: const FullNameState.unvalidated(),
      passwordState: const PasswordState.unvalidated(),
      confirmPasswordState: const PasswordState.unvalidated(),
      emailState: const EmailState.unvalidated(),
      phoneCodeState: PhoneCodeState.unvalidated(deviceCountryCode ?? ''),
      phoneNumberState: const PhoneNumberState.unvalidated(),
      otpChannelState: const OtpChannelState.unvalidated(
        {
          OtpChannel.email: true,
          OtpChannel.sms: false,
        },
      ),
      profileImageState: const ProfileImageState.unvalidated(),
    );
  }

  @override
  List<Object?> get props => [
        currentPageIndex,
        accountTypeState,
        accountTypeError,
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
        passwordState,
        passwordError,
        confirmPasswordState,
        confirmPasswordError,
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

  bool get isErrorFromForm1 =>
      fullNameError != null ||
      usernameError != null ||
      emailError != null ||
      passwordError != null ||
      confirmPasswordError != null ||
      genderError != null;

  bool get isForm1Valid {
    return Formz.validate([
      fullNameState,
      usernameState,
      emailState,
      passwordState,
      confirmPasswordState,
      genderState,
    ]);
  }

  bool get isForm2Valid {
    final List<FormzInput<dynamic, dynamic>> form2Inputs = [
      phoneCodeState,
      phoneNumberState,
      otpChannelState,
      accountTypeState,
      userTypeState,
    ];
    final userType = userTypeState.value;
    if (userType == UserType.studentTeacher) {
      form2Inputs.addAll([
        collegeState,
        educationYearState,
      ]);
    } else if (userType == UserType.independentLearner ||
        userType == UserType.independentTeacher) {
      form2Inputs.addAll([
        organizationState,
      ]);
    } else if (userType == UserType.journalist) {
      form2Inputs.addAll([
        affiliationState,
        positionState,
      ]);
    }

    return Formz.validate(form2Inputs);
  }

  RegisterState copyWith({
    int? currentPageIndex,
    AccountTypeState? accountTypeState,
    ValueGetter<FormFieldValidationError?>? accountTypeError,
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
    PasswordState? passwordState,
    ValueGetter<FormFieldValidationError?>? passwordError,
    PasswordState? confirmPasswordState,
    ValueGetter<FormFieldValidationError?>? confirmPasswordError,
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
    UiState<List<AccountType>>? accountTypesUiState,
    UiState<List<UserType>>? userTypesUiState,
    UiState<List<College>>? collegesUiState,
    UiState<List<EducationYear>>? educationYearsUiState,
    UiState<RegisterNewUserResult>? formSubmissionStatus,
  }) {
    return RegisterState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      accountTypeState: accountTypeState ?? this.accountTypeState,
      accountTypeError:
          accountTypeError != null ? accountTypeError() : this.accountTypeError,
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
      passwordState: passwordState ?? this.passwordState,
      passwordError:
          passwordError != null ? passwordError() : this.passwordError,
      confirmPasswordState: confirmPasswordState ?? this.confirmPasswordState,
      confirmPasswordError: confirmPasswordError != null
          ? confirmPasswordError()
          : this.confirmPasswordError,
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
      accountTypesUiState: accountTypesUiState ?? this.accountTypesUiState,
      userTypesUiState: userTypesUiState ?? this.userTypesUiState,
      profileImageState: profileImageState ?? this.profileImageState,
      profileImageError:
          profileImageError != null ? profileImageError() : this.profileImageError,
      collegesUiState: collegesUiState ?? this.collegesUiState,
      educationYearsUiState:
          educationYearsUiState ?? this.educationYearsUiState,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}

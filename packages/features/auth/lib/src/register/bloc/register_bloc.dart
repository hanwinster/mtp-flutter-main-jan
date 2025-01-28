import 'dart:async';
import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart' hide PhoneCodeState, PhoneNumberState;

import '../models/models.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required String deviceCountryCode,
    ObserveCollegesUseCase? observeCollegesUseCase,
    RegisterNewUserUseCase? registerNewUserUseCase,
    ObserveEducationYearsUseCase? observeEducationYearsUseCase,
  })  : _observeCollegesUseCase = observeCollegesUseCase ?? getIt(),
        _observeEducationYearsUseCase = observeEducationYearsUseCase ?? getIt(),
        _registerNewUserUseCase = registerNewUserUseCase ?? getIt(),
        super(RegisterState.create(
          deviceCountryCode: deviceCountryCode,
        )) {
    on<RegisterPageChanged>(_handelPageChanged);
    on<RegisterAccountTypeChanged>(_handleAccountTypeChanged);
    on<RegisterAccountTypesFetched>(_handelAccountTypesFetched);
    on<RegisterUserTypesFetched>(_handelUserTypesFetched);
    on<RegisterCollegesFetched>(_handleCollegesFetched,
        transformer: restartable());
    on<RegisterEducationYearsFetched>(_handelEducationYearsFetched);
    on<RegisterUserTypeChanged>(_handleUserTypeChanged);
    on<RegisterOrganizationChanged>(_handleOrganizationChanged);
    on<RegisterAffiliationChanged>(_handleAffiliationChanged);
    on<RegisterPositionChanged>(_handlePositionChanged);
    on<RegisterCollegeChanged>(_handleCollegeChanged);
    on<RegisterEducationYearChanged>(_handleEducationYearChanged);
    on<RegisterGenderChanged>(_handleGenderChanged);
    on<RegisterUsernameChanged>(_handleUsernameChanged);
    on<RegisterFullNameChanged>(_handleFullNameChanged);
    on<RegisterPasswordChanged>(_handlePasswordChanged);
    on<RegisterConfirmPasswordChanged>(_handleConfirmPasswordChanged);
    on<RegisterEmailChanged>(_handleEmailChanged);
    on<RegisterPhoneCodeChanged>(_handlePhoneCodeChanged);
    on<RegisterPhoneNumberChanged>(_handlePhoneNumberChanged);
    on<RegisterOtpChannelChanged>(_handleOtpChannelChanged);
    on<RegisterProfileImageChanged>(_handleProfileChanged);
    on<RegisterForm1Submitted>(_handleForm1Submitted);
    on<RegisterForm2Submitted>(_handleForm2Submitted);
    on<RegisterErrorShown>(_handleErrorShown);
  }

  final RegisterNewUserUseCase _registerNewUserUseCase;
  final ObserveCollegesUseCase _observeCollegesUseCase;
  final ObserveEducationYearsUseCase _observeEducationYearsUseCase;

  FutureOr<void> _handelPageChanged(
    RegisterPageChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      currentPageIndex: event.pageIndex,
    ));
  }

  FutureOr<void> _handleForm1Submitted(
    RegisterForm1Submitted event,
    Emitter<RegisterState> emit,
  ) async {
    final validatedUsername =
        UsernameState.validated(state.usernameState.value);
    final validatedFullName =
        FullNameState.validated(state.fullNameState.value);
    final validatedPassword =
        PasswordState.validated(state.passwordState.value);
    final validatedConfirmPassword =
        PasswordState.validated(state.confirmPasswordState.value);
    final validatedEmail = EmailState.validated(state.emailState.value);
    final validatedGender = GenderState.validated(state.genderState.value);

    emit(
      state.copyWith(
        usernameState: validatedUsername,
        usernameError: () => validatedUsername.displayError,
        fullNameState: validatedFullName,
        fullNameError: () => validatedFullName.displayError,
        passwordState: validatedPassword,
        passwordError: () => validatedPassword.displayError,
        confirmPasswordState: validatedConfirmPassword,
        confirmPasswordError: () => validatedConfirmPassword.displayError,
        emailState: validatedEmail,
        emailError: () => validatedEmail.displayError,
        genderState: validatedGender,
        genderError: () => validatedGender.displayError,
      ),
    );

    final isValid = state.isForm1Valid;
    if (!isValid) {
      return;
    }

    if (validatedPassword.value != validatedConfirmPassword.value) {
      emit(
        state.copyWith(
          passwordError: () => const FormFieldValidationErrorMismatch(),
          confirmPasswordError: () => const FormFieldValidationErrorMismatch(),
        ),
      );
      return;
    }

    if (isValid) {
      emit(
        state.copyWith(
          currentPageIndex: RegisterState.pageIndexStep2,
        ),
      );
    }
  }

  FutureOr<void> _handleForm2Submitted(
    RegisterForm2Submitted event,
    Emitter<RegisterState> emit,
  ) async {
    final validatedUsername =
        UsernameState.validated(state.usernameState.value);
    final validatedFullName =
        FullNameState.validated(state.fullNameState.value);
    final validatedPassword =
        PasswordState.validated(state.passwordState.value);
    final validatedConfirmPassword =
        PasswordState.validated(state.confirmPasswordState.value);
    final validatedEmail = EmailState.validated(state.emailState.value);
    final validatedGender = GenderState.validated(state.genderState.value);

    final validatedAccountType =
        AccountTypeState.validated(state.accountTypeState.value);
    final validatedUserType =
        UserTypeState.validated(state.userTypeState.value);
    final validatedOrganization =
        OrganizationState.validated(state.organizationState.value);
    final validatedAffiliation =
        AffiliationState.validated(state.affiliationState.value);
    final validatedPosition =
        PositionState.validated(state.positionState.value);
    final validatedCollege = CollegeState.validated(state.collegeState.value);
    final validatedEducationYear =
        EducationYearState.validated(state.educationYearState.value);

    final validatedPhoneCode =
        PhoneCodeState.validated(state.phoneCodeState.value);
    final validatedPhoneNumber =
        PhoneNumberState.validated(state.phoneNumberState.value);
    final validatedOtpChannel =
        OtpChannelState.validated(state.otpChannelState.value);

    emit(
      state.copyWith(
        usernameState: validatedUsername,
        usernameError: () => validatedUsername.displayError,
        fullNameState: validatedFullName,
        fullNameError: () => validatedFullName.displayError,
        passwordState: validatedPassword,
        passwordError: () => validatedPassword.displayError,
        confirmPasswordState: validatedConfirmPassword,
        confirmPasswordError: () => validatedConfirmPassword.displayError,
        emailState: validatedEmail,
        emailError: () => validatedEmail.displayError,
        genderState: validatedGender,
        genderError: () => validatedGender.displayError,
        accountTypeState: validatedAccountType,
        accountTypeError: () => validatedAccountType.displayError,
        userTypeState: validatedUserType,
        userTypeError: () => validatedUserType.displayError,
        organizationState: validatedOrganization,
        organizationError: () => validatedOrganization.displayError,
        affiliationState: validatedAffiliation,
        affiliationError: () => validatedAffiliation.displayError,
        positionState: validatedPosition,
        positionError: () => validatedPosition.displayError,
        collegeState: validatedCollege,
        collegeError: () => validatedCollege.displayError,
        educationYearState: validatedEducationYear,
        educationYearError: () => validatedEducationYear.displayError,
        phoneCodeState: validatedPhoneCode,
        phoneCodeError: () => validatedPhoneCode.displayError,
        phoneNumberState: validatedPhoneNumber,
        phoneNumberError: () => validatedPhoneNumber.displayError,
        otpChannelState: validatedOtpChannel,
        otpChannelError: () => validatedOtpChannel.displayError,
      ),
    );

    if (!state.isForm2Valid) {
      return;
    }

    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    final request = RegisterNewUserRequest(
      accountType: validatedAccountType.value!,
      userType: validatedUserType.value!,
      organization: state.organizationState.value,
      affiliation: state.affiliationState.value,
      position: state.positionState.value,
      college: state.collegeState.value,
      educationYear: state.educationYearState.value,
      gender: state.genderState.value!,
      username: state.usernameState.value,
      fullName: state.fullNameState.value,
      email: state.emailState.value,
      password: state.passwordState.value,
      confirmPassword: state.confirmPasswordState.value,
      phoneCode: state.phoneCodeState.value,
      phoneNumber: state.phoneNumberState.value,
      otpChannels: state.otpChannelState.value.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList(),
      profileImage: state.profileImageState.value,
    );

    try {
      final result = await _registerNewUserUseCase(request);

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            formSubmissionStatus: UiStateSuccess(result),
          ),
        );
      } else {
        await _processRegisterErrorResult(
          emit: emit,
          result: result,
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          formSubmissionStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _processRegisterErrorResult({
    required Emitter<RegisterState> emit,
    required RegisterNewUserResult result,
  }) async {
    switch (result) {
      case RegisterNewUserResultSuccess():
        logger.e('Expected a failure result but got success.');
        break;
      case RegisterNewUserResultInvalidInput():
        emit(
          state.copyWith(
            usernameError: () =>
                result.usernameError?.toFormValidationErrorOrNull(),
            fullNameError: () =>
                result.fullNameError?.toFormValidationErrorOrNull(),
            emailError: () => result.emailError?.toFormValidationErrorOrNull(),
            passwordError: () =>
                result.passwordError?.toFormValidationErrorOrNull(),
            confirmPasswordError: () =>
                result.confirmPasswordError?.toFormValidationErrorOrNull(),
            phoneCodeError: () =>
                result.phoneCodeError?.toFormValidationErrorOrNull(),
            phoneNumberError: () =>
                result.phoneNumberError?.toFormValidationErrorOrNull(),
            formSubmissionStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
      case RegisterNewUserResultUnverified():
        emit(
          state.copyWith(
            formSubmissionStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
    }
  }

  FutureOr<void> _handelAccountTypesFetched(
    RegisterAccountTypesFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      accountTypesUiState: const UiStateSuccess([
        AccountType.learner,
        AccountType.teacher,
      ]),
    ));
  }

  FutureOr<void> _handelUserTypesFetched(
    RegisterUserTypesFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      userTypesUiState: UiStateSuccess(
        UserType.values
            .where((e) => e.accountType == event.accountType)
            .toList(),
      ),
    ));
  }

  FutureOr<void> _handleCollegesFetched(
    RegisterCollegesFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      collegesUiState: const UiStateInProgress(),
    ));

    await emit.forEach(
      _observeCollegesUseCase(),
      onData: (colleges) {
        return state.copyWith(
          collegesUiState: UiState.fromResult(colleges),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          collegesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handelEducationYearsFetched(
    RegisterEducationYearsFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      educationYearsUiState: const UiStateInProgress(),
    ));

    await emit.forEach(
      _observeEducationYearsUseCase(),
      onData: (years) {
        return state.copyWith(
          educationYearsUiState: UiState.fromResult(years),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          educationYearsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleAccountTypeChanged(
    RegisterAccountTypeChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        AccountTypeState.newValue(state.accountTypeState, event.accountType);
    emit(
      state.copyWith(
        accountTypeState: newValue,
        accountTypeError: () => newValue.displayError,
        userTypeState: const UserTypeState.unvalidated(),
      ),
    );

    add(RegisterUserTypesFetched(
      accountType: event.accountType,
    ));
  }

  FutureOr<void> _handleUserTypeChanged(
    RegisterUserTypeChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        UserTypeState.newValue(state.userTypeState, event.userType);
    emit(
      state.copyWith(
        userTypeState: newValue,
        userTypeError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleOrganizationChanged(
    RegisterOrganizationChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        OrganizationState.newValue(state.organizationState, event.organization);
    emit(
      state.copyWith(
        organizationState: newValue,
        organizationError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleAffiliationChanged(
    RegisterAffiliationChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        AffiliationState.newValue(state.affiliationState, event.affiliation);
    emit(
      state.copyWith(
        affiliationState: newValue,
        affiliationError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handlePositionChanged(
    RegisterPositionChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        PositionState.newValue(state.positionState, event.position);
    emit(
      state.copyWith(
        positionState: newValue,
        positionError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleCollegeChanged(
    RegisterCollegeChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue = CollegeState.newValue(state.collegeState, event.college);
    emit(
      state.copyWith(
        collegeState: newValue,
        collegeError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleEducationYearChanged(
    RegisterEducationYearChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue = EducationYearState.newValue(
        state.educationYearState, event.educationYear);
    emit(
      state.copyWith(
        educationYearState: newValue,
        educationYearError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleGenderChanged(
    RegisterGenderChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue = GenderState.newValue(state.genderState, event.gender);
    emit(
      state.copyWith(
        genderState: newValue,
        genderError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        UsernameState.newValue(state.usernameState, event.username);
    emit(
      state.copyWith(
        usernameState: newValue,
        usernameError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleFullNameChanged(
    RegisterFullNameChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        FullNameState.newValue(state.fullNameState, event.fullName);
    emit(
      state.copyWith(
        fullNameState: newValue,
        fullNameError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handlePasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        PasswordState.newValue(state.passwordState, event.password);
    emit(
      state.copyWith(
        passwordState: newValue,
        passwordError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleConfirmPasswordChanged(
    RegisterConfirmPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue = PasswordState.newValue(
        state.confirmPasswordState, event.confirmPassword);
    emit(
      state.copyWith(
        confirmPasswordState: newValue,
        confirmPasswordError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue = EmailState.newValue(state.emailState, event.email);
    emit(
      state.copyWith(
        emailState: newValue,
        emailError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handlePhoneCodeChanged(
    RegisterPhoneCodeChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        PhoneCodeState.newValue(state.phoneCodeState, event.phoneCode);
    emit(
      state.copyWith(
        phoneCodeState: newValue,
        phoneCodeError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handlePhoneNumberChanged(
    RegisterPhoneNumberChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final newValue =
        PhoneNumberState.newValue(state.phoneNumberState, event.phoneNumber);
    emit(
      state.copyWith(
        phoneNumberState: newValue,
        phoneNumberError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleOtpChannelChanged(
    RegisterOtpChannelChanged event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.otpChannel == OtpChannel.email && !event.isChecked) {
      // otp channel email is mandatory and
      // we don't allow to uncheck it
      return;
    }

    final channels = Map.of(state.otpChannelState.value);
    channels[event.otpChannel] = event.isChecked;
    final newValue = OtpChannelState.newValue(state.otpChannelState, channels);
    emit(
      state.copyWith(
        otpChannelState: newValue,
        otpChannelError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleProfileChanged(
      RegisterProfileImageChanged event,
      Emitter<RegisterState> emit,
      ) {
    final newValue = ProfileImageState.newValue(state.profileImageState, event.imageUrl);
    emit(
      state.copyWith(
        profileImageState: newValue,
        profileImageError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleErrorShown(
    RegisterErrorShown event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInitial(),
      ),
    );
  }
}

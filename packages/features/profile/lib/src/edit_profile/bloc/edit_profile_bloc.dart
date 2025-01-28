import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart' hide PhoneNumberState, PhoneCodeState;

import '../models/models.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    UpdateUserUseCase? updateUserUseCase,
    ObserveLoggedInUserUseCase? observeLoggedInUserUseCase,
    ObserveCollegesUseCase? observeCollegesUseCase,
    ObserveEducationYearsUseCase? observeEducationYearsUseCase,
  })  : _observeLoggedInUserUseCase = observeLoggedInUserUseCase ?? getIt(),
        _updateUserUseCase = updateUserUseCase ?? getIt(),
        _observeCollegesUseCase = observeCollegesUseCase ?? getIt(),
        _observeEducationYearsUseCase = observeEducationYearsUseCase ?? getIt(),
        super(EditProfileState.create()) {
    on<EditProfileUserFetched>(_handleUserFetched, transformer: restartable());
    on<EditProfileUserTypesFetched>(_handelUserTypesFetched);
    on<EditProfileCollegesFetched>(_handleCollegesFetched,
        transformer: restartable());
    on<EditProfileEducationYearsFetched>(_handelEducationYearsFetched);
    on<EditProfileUserTypeChanged>(_handleUserTypeChanged);
    on<EditProfileOrganizationChanged>(_handleOrganizationChanged);
    on<EditProfileAffiliationChanged>(_handleAffiliationChanged);
    on<EditProfilePositionChanged>(_handlePositionChanged);
    on<EditProfileCollegeChanged>(_handleCollegeChanged);
    on<EditProfileEducationYearChanged>(_handleEducationYearChanged);
    on<EditProfileGenderChanged>(_handleGenderChanged);
    on<EditProfileUsernameChanged>(_handleUsernameChanged);
    on<EditProfileFullNameChanged>(_handleFullNameChanged);
    on<EditProfileEmailChanged>(_handleEmailChanged);
    on<EditProfilePhoneCodeChanged>(_handlePhoneCodeChanged);
    on<EditProfilePhoneNumberChanged>(_handlePhoneNumberChanged);
    on<EditProfileOtpChannelChanged>(_handleOtpChannelChanged);
    on<EditProfileImageChanged>(_handleImageChanged);
    on<EditProfileSubmitted>(_handleSubmitted);
    on<EditProfileErrorShown>(_handleErrorShown);
  }

  final ObserveLoggedInUserUseCase _observeLoggedInUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final ObserveCollegesUseCase _observeCollegesUseCase;
  final ObserveEducationYearsUseCase _observeEducationYearsUseCase;

  FutureOr<void> _handleUserFetched(
    EditProfileUserFetched event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(
      userUiState: const UiStateInProgress(),
    ));


    await emit.forEach(
      _observeLoggedInUserUseCase(),
      onData: (result) {
        final user = result.dataOrNull;
        if (user == null) {
          return state.copyWith(
            userUiState: const UiStateEmpty(),
          );
        }

        final profileImage = user.profileImageUrl?.large ?? '';
        Uri? profileImageUri;
        if (profileImage.isNotEmpty) {
          profileImageUri = Uri.tryParse(profileImage);
        }

        return state.copyWith(
          userUiState: UiStateSuccess(user),
          userTypeState:
              UserTypeState.newValue(state.userTypeState, user.userType),
          organizationState: OrganizationState.newValue(
              state.organizationState, user.organization),
          affiliationState: AffiliationState.newValue(
              state.affiliationState, user.affiliation),
          positionState:
              PositionState.newValue(state.positionState, user.position),
          collegeState: CollegeState.newValue(state.collegeState, user.college),
          educationYearState: EducationYearState.newValue(
              state.educationYearState, user.educationYears.firstOrNull),
          genderState: GenderState.newValue(state.genderState, user.gender),
          usernameState:
              UsernameState.newValue(state.usernameState, user.username),
          fullNameState:
              FullNameState.newValue(state.fullNameState, user.fullName),
          emailState: EmailState.newValue(state.emailState, user.email),
          phoneCodeState:
              PhoneCodeState.newValue(state.phoneCodeState, user.phoneCode),
          phoneNumberState: PhoneNumberState.newValue(
              state.phoneNumberState, user.phoneNumber),
          otpChannelState:
              OtpChannelState.newValue(state.otpChannelState, user.otpChannel),
          profileImageState: ProfileImageState.newValue(state.profileImageState, profileImageUri),
        );
      },
    );
  }

  FutureOr<void> _handelUserTypesFetched(
    EditProfileUserTypesFetched event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(
      userTypesUiState: const UiStateSuccess([
        UserType.independentLearner,
        UserType.journalist,
        UserType.studentTeacher,
        UserType.independentTeacher,
      ]),
    ));
  }

  FutureOr<void> _handleCollegesFetched(
    EditProfileCollegesFetched event,
    Emitter<EditProfileState> emit,
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
    EditProfileEducationYearsFetched event,
    Emitter<EditProfileState> emit,
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

  FutureOr<void> _handleUserTypeChanged(
    EditProfileUserTypeChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileOrganizationChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileAffiliationChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfilePositionChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileCollegeChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileEducationYearChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileGenderChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileUsernameChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileFullNameChanged event,
    Emitter<EditProfileState> emit,
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

  FutureOr<void> _handleEmailChanged(
    EditProfileEmailChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfilePhoneCodeChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfilePhoneNumberChanged event,
    Emitter<EditProfileState> emit,
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
    EditProfileOtpChannelChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    final newValue =
        OtpChannelState.newValue(state.otpChannelState, event.otpChannel);
    emit(
      state.copyWith(
        otpChannelState: newValue,
        otpChannelError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleImageChanged(
      EditProfileImageChanged event,
      Emitter<EditProfileState> emit,
      ) async {
    final newValue = ProfileImageState.newValue(state.profileImageState, event.imageUrl);
    emit(
      state.copyWith(
        profileImageState: newValue,
        profileImageError: () => newValue.displayError,
      ),
    );
  }

  FutureOr<void> _handleSubmitted(
    EditProfileSubmitted event,
    Emitter<EditProfileState> emit,
  ) async {
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
    final validatedGender = GenderState.validated(state.genderState.value);
    final validatedUsername =
        UsernameState.validated(state.usernameState.value);
    final validatedFullName =
        FullNameState.validated(state.fullNameState.value);
    final validatedEmail = EmailState.validated(state.emailState.value);
    final validatedPhoneCode =
        PhoneCodeState.validated(state.phoneCodeState.value);
    final validatedPhoneNumber =
        PhoneNumberState.validated(state.phoneNumberState.value);
    final validatedOtpChannel =
        OtpChannelState.validated(state.otpChannelState.value);

    emit(
      state.copyWith(
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
        genderState: validatedGender,
        genderError: () => validatedGender.displayError,
        usernameState: validatedUsername,
        usernameError: () => validatedUsername.displayError,
        fullNameState: validatedFullName,
        fullNameError: () => validatedFullName.displayError,
        emailState: validatedEmail,
        emailError: () => validatedEmail.displayError,
        phoneCodeState: validatedPhoneCode,
        phoneCodeError: () => validatedPhoneCode.displayError,
        phoneNumberState: validatedPhoneNumber,
        phoneNumberError: () => validatedPhoneNumber.displayError,
        otpChannelState: validatedOtpChannel,
        otpChannelError: () => validatedOtpChannel.displayError,
      ),
    );

    if (!state.isFormValid) {
      return;
    }

    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    final profileImage = state.profileImageState.value;
    Uri? updatedProfileImageUri;
    if (profileImage != null) {
      if (profileImage.scheme != 'http' && profileImage.scheme != 'https') {
        updatedProfileImageUri = profileImage;
      } else {
        updatedProfileImageUri = null;
      }
    }

    final request = UpdateUserRequest(
      userType: state.userTypeState.value,
      organization: state.organizationState.value,
      affiliation: state.affiliationState.value,
      position: state.positionState.value,
      college: state.collegeState.value,
      educationYear: state.educationYearState.value,
      gender: state.genderState.value!,
      username: state.usernameState.value,
      fullName: state.fullNameState.value,
      email: state.emailState.value,
      phoneCode: state.phoneCodeState.value,
      phoneNumber: state.phoneNumberState.value,
      otpChannel: state.otpChannelState.value,
      profileImage: updatedProfileImageUri,
    );

    try {
      final result = await _updateUserUseCase(request);

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            formSubmissionStatus: UiStateSuccess(result),
          ),
        );
      } else {
        await _processUpdateUserErrorResult(
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

  Future<void> _processUpdateUserErrorResult({
    required Emitter<EditProfileState> emit,
    required UpdateUserResult result,
  }) async {
    switch (result) {
      case UpdateUserResultSuccess():
        logger.e('Expected a failure result but got success.');
        break;
      case UpdateUserResultInvalidInput():
        emit(
          state.copyWith(
            usernameError: () =>
                result.usernameError?.toFormValidationErrorOrNull(),
            fullNameError: () =>
                result.fullNameError?.toFormValidationErrorOrNull(),
            emailError: () => result.emailError?.toFormValidationErrorOrNull(),
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
    }
  }

  FutureOr<void> _handleErrorShown(
    EditProfileErrorShown event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        formSubmissionStatus: const UiStateInitial(),
      ),
    );
  }
}

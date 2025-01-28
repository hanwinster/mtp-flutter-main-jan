import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:help/src/contact_us/models/models.dart';
import 'package:ui/ui.dart';

part 'contact_us_event.dart';

part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc({
    GetContactInfoUseCase? getContactInfoUseCase,
    GetContactRegionsUseCase? getContactRegionsUseCase,
    SendContactMessageUseCase? sendContactMessageUseCase,
  })  : _getContactInfoUseCase = getContactInfoUseCase ?? getIt(),
        _getContactRegionsUseCase = getContactRegionsUseCase ?? getIt(),
        _sendContactMessageUseCase = sendContactMessageUseCase ?? getIt(),
        super(ContactUsState.create()) {
    on<ContactUsContactInfoFetched>(
      _handleContactInfoFetched,
      transformer: restartable(),
    );
    on<ContactUsContactRegionsFetched>(
      _handleContactRegionsFetched,
      transformer: restartable(),
    );
    on<ContactUsNameChanged>(_handleNameChanged);
    on<ContactUsEmailChanged>(_handleEmailChanged);
    on<ContactUsPhoneChanged>(_handlePhoneChanged);
    on<ContactUsSubjectChanged>(_handleSubjectChanged);
    on<ContactUsOrganizationChanged>(_handleOrganizationChanged);
    on<ContactUsRegionChanged>(_handleRegionChanged);
    on<ContactUsMessageChanged>(_handleMessageChanged);

    on<ContactUsSubmitted>(_handleSubmitted);
    on<ContactUsReset>(_handleReset);
  }

  final GetContactInfoUseCase _getContactInfoUseCase;
  final GetContactRegionsUseCase _getContactRegionsUseCase;
  final SendContactMessageUseCase _sendContactMessageUseCase;

  FutureOr<void> _handleContactInfoFetched(
    ContactUsContactInfoFetched event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactInfoUiState: const UiStateInProgress(),
      ),
    );

    try {
      final contactInfo = await _getContactInfoUseCase();
      emit(
        state.copyWith(
          contactInfoUiState: UiStateSuccess(contactInfo),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching contact info', e, s);
      emit(
        state.copyWith(
          contactInfoUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleContactRegionsFetched(
    ContactUsContactRegionsFetched event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactRegionsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final contactRegions = await _getContactRegionsUseCase();
      emit(
        state.copyWith(
          contactRegionsUiState: UiStateSuccess(contactRegions),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching contact regions', e, s);
      emit(
        state.copyWith(
          contactRegionsUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleNameChanged(
    ContactUsNameChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = NameState.newValue(state.nameState, event.name);
    emit(
      state.copyWith(
        nameState: newValue,
        nameError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleEmailChanged(
    ContactUsEmailChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = EmailState.newValue(state.emailState, event.email);
    emit(
      state.copyWith(
        emailState: newValue,
        emailError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handlePhoneChanged(
    ContactUsPhoneChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = PhoneState.newValue(state.phoneState, event.phone);
    emit(
      state.copyWith(
        phoneState: newValue,
        phoneError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleSubjectChanged(
    ContactUsSubjectChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = SubjectState.newValue(state.subjectState, event.subject);
    emit(
      state.copyWith(
        subjectState: newValue,
        subjectError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleOrganizationChanged(
    ContactUsOrganizationChanged event,
    Emitter<ContactUsState> emit,
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

  Future<void> _handleRegionChanged(
    ContactUsRegionChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = RegionState.newValue(state.regionState, event.region);
    emit(
      state.copyWith(
        regionState: newValue,
        regionError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleMessageChanged(
    ContactUsMessageChanged event,
    Emitter<ContactUsState> emit,
  ) async {
    final newValue = MessageState.newValue(state.messageState, event.message);
    emit(
      state.copyWith(
        messageState: newValue,
        messageError: () => newValue.displayError,
      ),
    );
  }

  Future<void> _handleSubmitted(
    ContactUsSubmitted event,
    Emitter<ContactUsState> emit,
  ) async {
    final validatedNameState = NameState.validated(state.nameState.value);
    final validatedEmailState = EmailState.validated(state.emailState.value);
    final validatedPhoneState = PhoneState.validated(state.phoneState.value);
    final validatedSubjectState =
        SubjectState.validated(state.subjectState.value);
    final validatedOrganizationState =
        OrganizationState.validated(state.organizationState.value);
    final validatedRegionState = RegionState.validated(state.regionState.value);
    final validatedMessageState =
        MessageState.validated(state.messageState.value);

    emit(
      state.copyWith(
        nameState: validatedNameState,
        nameError: () => validatedNameState.displayError,
        emailState: validatedEmailState,
        emailError: () => validatedEmailState.displayError,
        phoneState: validatedPhoneState,
        phoneError: () => validatedPhoneState.displayError,
        subjectState: validatedSubjectState,
        subjectError: () => validatedSubjectState.displayError,
        organizationState: validatedOrganizationState,
        organizationError: () => validatedOrganizationState.displayError,
        regionState: validatedRegionState,
        regionError: () => validatedRegionState.displayError,
        messageState: validatedMessageState,
        messageError: () => validatedMessageState.displayError,
      ),
    );

    if (!state.isValid) {
      return;
    }

    await sendMessage(
      emit: emit,
      name: validatedNameState.value,
      email: validatedEmailState.value,
      phone: validatedPhoneState.value,
      subject: validatedSubjectState.value,
      organization: validatedOrganizationState.value,
      region: validatedRegionState.value,
      message: validatedMessageState.value,
    );
  }

  Future<void> sendMessage({
    required Emitter<ContactUsState> emit,
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String organization,
    required ContactRegion? region,
    required String message,
  }) async {
    emit(
      state.copyWith(
        formSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _sendContactMessageUseCase(
        SendContactMessageUseCaseRequest(
          name: name,
          email: email,
          phoneNo: phone,
          subject: subject,
          organization: organization,
          region: region,
          message: message,
        ),
      );
      emit(
        state.copyWith(
          formSubmissionUiState: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          formSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleReset(
    ContactUsReset event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        nameState: const NameState.unvalidated(),
        emailState: const EmailState.unvalidated(),
        phoneState: const PhoneState.unvalidated(),
        subjectState: const SubjectState.unvalidated(),
        organizationState: const OrganizationState.unvalidated(),
        regionState: const RegionState.unvalidated(),
        messageState: const MessageState.unvalidated(),
        formSubmissionUiState: const UiStateInitial(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:ui/ui.dart';

import 'components/components.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late final FocusNode userTypeFocusNode;
  late final FocusNode organizationFocusNode;
  late final FocusNode affiliationFocusNode;
  late final FocusNode positionFocusNode;
  late final FocusNode collegeFocusNode;
  late final FocusNode educationYearFocusNode;

  late final FocusNode usernameFocusNode;
  late final FocusNode fullNameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode phoneFocusNode;

  @override
  void initState() {
    userTypeFocusNode = FocusNode();
    organizationFocusNode = FocusNode();
    affiliationFocusNode = FocusNode();
    positionFocusNode = FocusNode();
    collegeFocusNode = FocusNode();
    educationYearFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    fullNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    userTypeFocusNode.dispose();
    organizationFocusNode.dispose();
    affiliationFocusNode.dispose();
    positionFocusNode.dispose();
    collegeFocusNode.dispose();
    educationYearFocusNode.dispose();
    usernameFocusNode.dispose();
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
      previous.userTypeState != current.userTypeState ||
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return FormContainer(
          isInProgress: state.formSubmissionStatus.isInProgress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Grid.one),
                    UsernameInput(
                      focusNode: usernameFocusNode,
                      onFieldSubmitted: () {
                        fullNameFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    FullNameInput(
                      focusNode: fullNameFocusNode,
                      onFieldSubmitted: () {
                        emailFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    EmailInput(
                      focusNode: emailFocusNode,
                      onFieldSubmitted: () {
                        userTypeFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    PhoneInput(
                      focusNode: phoneFocusNode,
                      onFieldSubmitted: () {},
                    ),
                    const SizedBox(height: Grid.two),
                    UserTypeInput(
                      focusNode: userTypeFocusNode,
                      onFieldSubmitted: () {},
                    ),
                    if (state.showOrganizationInput) ...[
                      const SizedBox(height: Grid.two),
                      OrganizationInput(
                        focusNode: organizationFocusNode,
                        onFieldSubmitted: () {},
                      ),
                    ],
                    if (state.showAffiliationInput) ...[
                      const SizedBox(height: Grid.two),
                      AffiliationInput(
                        focusNode: affiliationFocusNode,
                        onFieldSubmitted: () {},
                      ),
                    ],
                    if (state.showPositionInput) ...[
                      const SizedBox(height: Grid.two),
                      PositionInput(
                        focusNode: positionFocusNode,
                        onFieldSubmitted: () {},
                      ),
                    ],
                    if (state.showCollegeInput) ...[
                      const SizedBox(height: Grid.two),
                      CollegeInput(
                        focusNode: collegeFocusNode,
                        onFieldSubmitted: () {},
                      ),
                    ],
                    if (state.showEducationYear) ...[
                      const SizedBox(height: Grid.two),
                      EducationYearInput(
                        focusNode: educationYearFocusNode,
                        onFieldSubmitted: () {},
                      ),
                    ],
                    const SizedBox(height: Grid.two),
                    const GenderInput(),
                    const SizedBox(height: Grid.two),
                    const OtpChannelInput(),
                    const SizedBox(height: Grid.two),
                    MtpInputFieldLabel(
                      labelText: context.l10n.registerLabelProfileImage,
                    ),
                    const SizedBox(height: Grid.half),
                    const ProfileImageInput(),
                    const SizedBox(height: Grid.four),
                    const SubmitButton(),
                    const SizedBox(height: Grid.two),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
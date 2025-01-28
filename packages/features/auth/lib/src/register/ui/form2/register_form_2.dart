import 'package:auth/src/register/ui/components/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import '../../bloc/register_bloc.dart';
import '../components/components.dart';

class RegisterForm2 extends StatefulWidget {
  const RegisterForm2({super.key});

  @override
  State<RegisterForm2> createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2>
    with AutomaticKeepAliveClientMixin<RegisterForm2> {
  late final FocusNode accountTypeFocusNode;
  late final FocusNode userTypeFocusNode;
  late final FocusNode organizationFocusNode;
  late final FocusNode affiliationFocusNode;
  late final FocusNode positionFocusNode;
  late final FocusNode collegeFocusNode;
  late final FocusNode educationYearFocusNode;
  late final FocusNode phoneFocusNode;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    accountTypeFocusNode = FocusNode();
    userTypeFocusNode = FocusNode();
    organizationFocusNode = FocusNode();
    affiliationFocusNode = FocusNode();
    positionFocusNode = FocusNode();
    collegeFocusNode = FocusNode();
    educationYearFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    accountTypeFocusNode.dispose();
    userTypeFocusNode.dispose();
    organizationFocusNode.dispose();
    affiliationFocusNode.dispose();
    positionFocusNode.dispose();
    collegeFocusNode.dispose();
    educationYearFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }

        if (context.read<RegisterBloc>().state.isFormSubmissionInProgress) {
          return;
        }

        context
            .read<RegisterBloc>()
            .add(const RegisterPageChanged(RegisterState.pageIndexStep1));
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) =>
            previous.isFormSubmissionInProgress !=
                current.isFormSubmissionInProgress ||
            previous.userTypeState != current.userTypeState,
        builder: (context, state) {
          return FormContainer(
            isInProgress: state.isFormSubmissionInProgress,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeader(
                  subtitle: context.l10n.registerLabelSubtitleRegister,
                  showMemberLogin: false,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MtpInputFieldLabel(
                        labelText: context.l10n.registerLabelAccountType,
                      ),
                      const SizedBox(height: Grid.half),
                      AccountTypeInput(
                        focusNode: accountTypeFocusNode,
                        onFieldSubmitted: () {},
                      ),
                      const SizedBox(height: Grid.two),
                      MtpInputFieldLabel(
                        labelText: context.l10n.registerLabelUserType,
                      ),
                      const SizedBox(height: Grid.half),
                      UserTypeInput(
                        focusNode: userTypeFocusNode,
                        onFieldSubmitted: () {},
                      ),
                      const SizedBox(height: Grid.two),
                      MtpInputFieldLabel(
                          labelText: context.l10n.registerLabelFillInformation),
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
                      PhoneInput(
                        focusNode: phoneFocusNode,
                        onFieldSubmitted: () {},
                      ),
                      const SizedBox(height: Grid.two),
                      const OtpChannelInput(),
                      const SizedBox(height: Grid.two),
                      MtpInputFieldLabel(
                        labelText: context.l10n.registerLabelProfileImage,
                      ),
                      const SizedBox(height: Grid.half),
                      const ProfileImageInput(),
                      const SizedBox(height: Grid.two),
                      const Form2SubmitButton(),
                      const SizedBox(height: Grid.two),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

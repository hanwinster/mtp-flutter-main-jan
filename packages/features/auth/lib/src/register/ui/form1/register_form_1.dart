import 'package:auth/src/common/common.dart';
import 'package:auth/src/register/bloc/register_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../components/components.dart';

class RegisterForm1 extends StatefulWidget {
  const RegisterForm1({super.key});

  @override
  State<RegisterForm1> createState() => _RegisterForm1State();
}

class _RegisterForm1State extends State<RegisterForm1>
    with AutomaticKeepAliveClientMixin<RegisterForm1> {
  late final FocusNode usernameFocusNode;
  late final FocusNode fullNameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode confirmPasswordFocusNode;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    usernameFocusNode = FocusNode();
    fullNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    usernameFocusNode.dispose();
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.userTypeState != current.userTypeState ||
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return FormContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormHeader(
                subtitle: context.l10n.registerLabelSubtitleFillUserDetails,
                showMemberLogin: true,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FullNameInput(
                      focusNode: fullNameFocusNode,
                      onFieldSubmitted: () {
                        usernameFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    UsernameInput(
                      focusNode: usernameFocusNode,
                      onFieldSubmitted: () {
                        emailFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.half),
                    const UsernameInputExample(),
                    const SizedBox(height: Grid.two),
                    EmailInput(
                      focusNode: emailFocusNode,
                      onFieldSubmitted: () {
                        passwordFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    PasswordInput(
                      focusNode: passwordFocusNode,
                      onFieldSubmitted: () {
                        confirmPasswordFocusNode.requestFocus();
                      },
                    ),
                    const SizedBox(height: Grid.two),
                    ConfirmPasswordInput(
                      focusNode: confirmPasswordFocusNode,
                      onFieldSubmitted: () {},
                    ),
                    const SizedBox(height: Grid.two),
                    const GenderInput(),
                    const SizedBox(height: Grid.four),
                    const Form1SubmitButton(),
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

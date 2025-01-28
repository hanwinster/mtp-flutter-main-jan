import 'package:auth/auth.dart';
import 'package:auth/src/register/ui/components/components.dart';
import 'package:auth/src/register/ui/form1/register_form_1.dart';
import 'package:auth/src/register/ui/form2/register_form_2.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    required this.onFormSubmitted,
    required this.onUnverifiedUser,
  });

  final FormSubmittedCallback onFormSubmitted;
  final UnverifiedUserCallback onUnverifiedUser;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous.currentPageIndex != current.currentPageIndex,
          listener: (context, state) {
            logger.d('currentPageIndex: ${state.currentPageIndex}');
            _pageController.animateToPage(
              state.currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous.formSubmissionStatus != current.formSubmissionStatus,
          listener: (context, state) {
            if (state.isFormSubmissionSuccess) {
              final email = state.emailState.value;
              if (email.isEmpty) {
                return;
              }

              widget.onFormSubmitted(
                email: state.emailState.value,
              );
              return;
            } else if (state.formSubmissionStatus is UiStateFailure) {
              final data = state.formSubmissionStatus.dataOrNull;
              if (data is RegisterNewUserResultUnverified) {
                final email = state.emailState.value;
                if (email.isEmpty) {
                  return;
                }

                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
                widget.onUnverifiedUser(credential: email);
              } else {
                if (state.isErrorFromForm1) {
                  context
                      .read<RegisterBloc>()
                      .add(const RegisterPageChanged(RegisterState.pageIndexStep1));
                }

                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
              }
              context.read<RegisterBloc>().add(const RegisterErrorShown());
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              final currentPageIndex = context.read<RegisterBloc>().state.currentPageIndex;
              if (currentPageIndex == RegisterState.pageIndexStep1) {
                Navigator.of(context).pop();
                return;
              } else {
                context.read<RegisterBloc>().add(RegisterPageChanged(currentPageIndex - 1));
              }
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            PageIndicator(pageController: _pageController),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  RegisterForm1(),
                  RegisterForm2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

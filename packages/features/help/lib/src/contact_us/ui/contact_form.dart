import 'package:flutter/material.dart';
import 'package:help/src/contact_us/ui/components/components.dart';
import 'package:ui/ui.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode subjectFocusNode;
  late FocusNode organizationFocusNode;
  late FocusNode messageFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    subjectFocusNode = FocusNode();
    organizationFocusNode = FocusNode();
    messageFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    subjectFocusNode.dispose();
    organizationFocusNode.dispose();
    messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.contactUsFormTitle,
          style: context.textTheme.titleMedium,
        ),
        SizedBox(height: Grid.two),
        NameInput(
          focusNode: nameFocusNode,
          onFieldSubmitted: () => emailFocusNode.requestFocus(),
        ),
        SizedBox(height: Grid.two),
        EmailInput(
          focusNode: emailFocusNode,
          onFieldSubmitted: () => phoneFocusNode.requestFocus(),
        ),
        SizedBox(height: Grid.two),
        PhoneInput(
          focusNode: phoneFocusNode,
          onFieldSubmitted: () => subjectFocusNode.requestFocus(),
        ),
        SizedBox(height: Grid.two),
        SubjectInput(
          focusNode: subjectFocusNode,
          onFieldSubmitted: () => organizationFocusNode.requestFocus(),
        ),
        SizedBox(height: Grid.two),
        OrganizationInput(
          focusNode: organizationFocusNode,
          onFieldSubmitted: () => messageFocusNode.requestFocus(),
        ),
        SizedBox(height: Grid.two),
        RegionInput(),
        SizedBox(height: Grid.two),
        MessageInput(
          focusNode: messageFocusNode,
          onFieldSubmitted: () => hideKeyboard(),
        ),
        SizedBox(height: Grid.two),
        SubmitButton(),
      ],
    );
  }
}

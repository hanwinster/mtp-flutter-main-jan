import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/ui/contact_form.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/contact_us_bloc.dart';
import 'components/components.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsBloc, ContactUsState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      listener: (context, state) {
        if (state.formSubmissionUiState is UiStateSuccess) {
          final message = state.formSubmissionUiState.dataOrNull ?? '';
          if (message.isNotEmpty) {
            showSnackBar(context, message);
          }
          context.read<ContactUsBloc>().add(const ContactUsReset());
        } else if (state.formSubmissionUiState is UiStateFailure) {
          showSnackBar(context, state.formSubmissionUiState.messageOrEmpty(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.helpLabelContactUs),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Grid.two,
              vertical: Grid.two,
            ),
            child: Column(
              children: [
                BlocBuilder<ContactUsBloc, ContactUsState>(
                  buildWhen: (previous, current) =>
                      previous.contactInfoUiState != current.contactInfoUiState,
                  builder: (context, state) {
                    return state.contactInfoUiState.toView(
                      context,
                      successViewBuilder: (contactInfo) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (contactInfo.phone != null) ...[
                              InfoCard(
                                icon: Icons.phone,
                                title: contactInfo.phone?.title ?? '',
                                message: contactInfo.phone?.message ?? '',
                                info: contactInfo.phone?.phone ?? '',
                                onTap: () async {
                                  final phone = contactInfo.phone?.phone;
                                  if (phone != null) {
                                    if (!await launchUrl(
                                        Uri.parse('tel:$phone'))) {
                                      logger.e('Could not launch tel:$phone');
                                    }
                                  }
                                },
                              ),
                            ],
                            if (contactInfo.email != null) ...[
                              InfoCard(
                                icon: Icons.email,
                                title: contactInfo.email?.title ?? '',
                                message: contactInfo.email?.message ?? '',
                                info: contactInfo.email?.email ?? '',
                                onTap: () async {
                                  final email = contactInfo.email?.email;
                                  if (email != null) {
                                    if (!await launchUrl(
                                        Uri.parse('mailto:$email'))) {
                                      logger
                                          .e('Could not launch mailto:$email');
                                    }
                                  }
                                },
                              ),
                            ],
                            if (contactInfo.address != null) ...[
                              InfoCard(
                                icon: Icons.location_on,
                                title: contactInfo.address?.title ?? '',
                                message: contactInfo.address?.message ?? '',
                                info: contactInfo.address?.address ?? '',
                                onTap: () async {
                                  final latLng = contactInfo.address?.latLng;
                                  if (latLng != null) {
                                    if (!await launchUrl(Uri.parse(
                                        'geo:${latLng.lat},${latLng.lng}'))) {
                                      logger.e(
                                          'Could not launch geo:${latLng.lat},${latLng.lng}');
                                    }
                                  }
                                },
                              ),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: Grid.two),
                ContactForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/profile_bloc.dart';
import '../profile.dart';
import 'components/components.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
    required this.onEditProfileClicked,
  });

  final EditProfileClickCallback onEditProfileClicked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return state.userUiState.toView(
        context,
        successViewBuilder: (data) {
          final user = data;
          if (user == null) {
            return const SizedBox();
          }

          return SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _ProfileImage(
                    imageUrl: user.profileImageUrl,
                  ),
                  const SizedBox(height: Grid.two),
                  _FullName(
                    fullName: user.fullName,
                  ),
                  const SizedBox(height: Grid.half),
                  _UserType(
                    userRoleCode: user.userRoleCode,
                  ),
                  const SizedBox(height: Grid.half),
                  _EditProfileButton(
                    onPressed: onEditProfileClicked,
                  ),
                  const SizedBox(height: Grid.one),
                  _Username(
                    username: user.username,
                  ),
                  const _Divider(),
                  _Email(
                    email: user.email,
                  ),
                  const _Divider(),
                  _Phone(
                    formattedPhoneNumber: user.formattedPhoneNumber,
                  ),
                  const _Divider(),
                  _Gender(
                    gender: user.gender,
                  ),
                  if (state.shouldShowOrganization) ...[
                    const _Divider(),
                    _Organization(
                      organization: user.organization,
                    ),
                  ],
                  if (state.shouldShowAffiliation) ...[
                    const _Divider(),
                    _Affiliation(
                      affiliation: user.affiliation,
                    ),
                  ],
                  if (state.shouldShowPosition) ...[
                    const _Divider(),
                    _Position(
                      position: user.position,
                    ),
                  ],
                  if (state.shouldShowCollege) ...[
                    const _Divider(),
                    _College(
                      college: user.college,
                    ),
                  ],
                  if (state.shouldShowEducationYear) ...[
                    const _Divider(),
                    _EducationYears(
                      educationYears: user.educationYears,
                    ),
                  ],
                  const _Divider(),
                  _OtpChannel(
                    otpChannel: user.otpChannel,
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

class _FullName extends StatelessWidget {
  const _FullName({
    required this.fullName,
  });

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Text(
      fullName,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.imageUrl,
  });

  final ImageUrl? imageUrl;

  @override
  Widget build(BuildContext context) {
    return MtpCircleImage(
      imageUrl?.thumbnail ?? '',
      width: 96,
      height: 96,
    );
  }
}

class _UserType extends StatelessWidget {
  const _UserType({
    required this.userRoleCode,
  });

  final UserRoleCode userRoleCode;

  @override
  Widget build(BuildContext context) {
    return Text(
      userRoleCode.getLabel(context),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.isEditable != current.isEditable,
      builder: (context, state) {
        if (!state.isEditable) {
          return const SizedBox();
        }

        return MtpTextButton(
          labelText: context.l10n.profileButtonTextEditProfile,
          onPressed: () => onPressed(),
        );
      },
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelUsername,
      value: username,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelEmail,
      value: email,
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({
    required this.formattedPhoneNumber,
  });

  final String formattedPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelPhone,
      value: formattedPhoneNumber.isNotEmpty ? formattedPhoneNumber : '-',
    );
  }
}

class _Gender extends StatelessWidget {
  const _Gender({
    required this.gender,
  });

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelGender,
      value: gender.getLabel(context),
    );
  }
}

class _Organization extends StatelessWidget {
  const _Organization({
    required this.organization,
  });

  final String organization;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelOrganization,
      value: organization.isNotEmpty ? organization : '-',
    );
  }
}

class _Affiliation extends StatelessWidget {
  const _Affiliation({
    required this.affiliation,
  });

  final String affiliation;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelAffiliation,
      value: affiliation.isNotEmpty ? affiliation : '-',
    );
  }
}

class _Position extends StatelessWidget {
  const _Position({
    required this.position,
  });

  final String position;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelPosition,
      value: position.isNotEmpty ? position : '-',
    );
  }
}

class _College extends StatelessWidget {
  const _College({
    required this.college,
  });

  final College? college;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelCollege,
      value: college?.name ?? '-',
    );
  }
}

class _EducationYears extends StatelessWidget {
  const _EducationYears({
    required this.educationYears,
  });

  final List<EducationYear> educationYears;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelYearOfStudyingTraining,
      value: educationYears.isNotEmpty
          ? educationYears
              .map((e) => e.title)
              .join('${context.l10n.labelSeparator} ')
          : '-',
    );
  }
}

class _OtpChannel extends StatelessWidget {
  const _OtpChannel({required this.otpChannel});

  final OtpChannel otpChannel;

  @override
  Widget build(BuildContext context) {
    return InfoItemListTile(
      caption: context.l10n.profileLabelOtpChannel,
      value: otpChannel.getLabel(context),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: Grid.two,
      endIndent: Grid.two,
    );
  }
}

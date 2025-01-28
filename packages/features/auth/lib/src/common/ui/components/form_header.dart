import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.subtitle,
    required this.showMemberLogin,
  });

  final String subtitle;
  final bool showMemberLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _AppLogo(),
        const SizedBox(height: Grid.two),
        const _AppName(),
        const SizedBox(height: Grid.two),
        if (subtitle.isNotEmpty) _Subtitle(subtitle: subtitle),
        if (showMemberLogin) const _MemberLogin(),
        const SizedBox(height: Grid.four),
      ],
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return MtpAssets.images.appIcon.image(
      width: 86,
      height: 86,
      fit: BoxFit.fill,
    );
  }
}

class _AppName extends StatelessWidget {
  const _AppName();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.appFullName,
      style: context.textTheme.titleLarge,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: context.textTheme.titleSmall,
    );
  }
}

class _MemberLogin extends StatelessWidget {
  const _MemberLogin();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.registerLabelMemberLogin,
        ),
        MtpUnderlineButton(
          labelText: context.l10n.buttonTextLogin,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

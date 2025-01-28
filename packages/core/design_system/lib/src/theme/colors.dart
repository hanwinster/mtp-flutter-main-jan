import 'package:flutter/material.dart';

extension ColorSchemeExt on ColorScheme {
  Color get success => brightness == Brightness.light
      ? const Color(0xFF4CAF50)
      : const Color(0xFF81C784);

  Color get onSuccess => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF1B5E20);

  Color get successContainer => brightness == Brightness.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF2E7D32);

  Color get onSuccessContainer => brightness == Brightness.light
      ? const Color(0xFF2E7D32)
      : const Color(0xFF81C784);

  Color get textHighEmphasis =>
      brightness == Brightness.light ? onSurface : onSurface.withOpacity(0.87);

  Color get textMediumEmphasis => brightness == Brightness.light
      ? onSurface.withOpacity(0.6)
      : onSurface.withOpacity(0.6);

  Color get textDisabled => brightness == Brightness.light
      ? onSurface.withOpacity(0.38)
      : onSurface.withOpacity(0.38);

  Color get iconHighEmphasis =>
      brightness == Brightness.light ? onSurface : onSurface.withOpacity(0.87);

  Color get iconMediumEmphasis => brightness == Brightness.light
      ? onSurface.withOpacity(0.6)
      : onSurface.withOpacity(0.6);

  Color get iconDisabled => brightness == Brightness.light
      ? onSurface.withOpacity(0.38)
      : onSurface.withOpacity(0.38);

  Gradient get backgroundGradient => brightness == Brightness.light
      ? MtpColors.gradientBackgroundLight
      : MtpColors.gradientBackgroundDark;

  Color get shimmerBaseColor =>
      brightness == Brightness.light ? Colors.grey[300]! : Colors.grey[800]!;

  Color get shimmerHighlightColor =>
      brightness == Brightness.light ? Colors.grey[100]! : Colors.grey[900]!;

  Color get categoryBackgroundColor => brightness == Brightness.light
      ? MtpColors.categoryBackgroundColor
      : MtpColors.categoryBackgroundColor;
}

class MtpColors {
  static const primaryColor = Color(0xFF0077D4);
  static const secondaryColor = Color(0xFF21409A);
  static const discountBGColor = Color(0xFFE1ECFF);
  static const itemStrokeColor = Color(0xFFE1E1E1);
  static const timerSliderBGColor = Color(0xFFE6E6E6);
  static const textBlack = Color(0xFF37393B);
  static const white = Color(0xFFffffff);
  static const productFeatureTitle = Color(0xFF616161);
  static const grey = Color(0xFF80807F);
  static const promoCodeBG = Color(0xFFDFE7FF);
  static const hint = Color(0xFF94989D);
  static const hometext = Color(0xFF10161F);
  static const starColor = Color(0xFFE9B911);
  static const homeswitch = Color(0xFF5498F9);

  static const assignComplete = Color(0xFF5B87DE);
  static const offlineColor = Color(0xFFDBEDF7);
  static const hint2 = Color(0xFF454C55);
  static const blue1 = Color(0xFFE6F0FE);
  static const backbtn = Color(0xFFE6F0FE);
  static const validationErrorColor = Color(0xFFCB2424);
  static const borderGreyColor = Color(0xFFC5D3D5);
  static const bgLightBlue = Color(0xFFDDF7FF);

  static const btnPrimaryColor = Color(0xFF1A58B4);
  static const textFieldBorderColor = Color(0xFFC4D2D5);

  static const offlineFeatureGradientColor1 = Color(0xFF0A5BD3);
  static const offlineFeatureGradientColor2 = Color(0xFF083A84);

  static const contactUsCardGradientColor1 = Color(0xFF2470E3);
  static const contactUsCardGradientColor2 = Color(0xFF0040A0);

  static const courseBackGroundColor = Color(0xFFF1F3F8);
  static const resetBtnColor = Color(0xFFD0EAEF);

  static const colorBlackSemiTransparent = Color(0xB2000000);
  static const colorTransparent = Color(0x00000000);

  static const lightBlueBackgroundColor = Color(0xFFE8F0FD);

  static LinearGradient gradientBackgroundLight = const LinearGradient(
    colors: [
      Color(0xFFEFEFFB),
      Color(0xFFEEF6FF),
    ],
    begin: FractionalOffset(0.9, 0.1),
    end: FractionalOffset(0.0, 0.3),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static LinearGradient gradientBackgroundDark = const LinearGradient(
    colors: [
      Color(0xFF121212),
      Color(0xFF121212),
    ],
    begin: FractionalOffset(0.9, 0.1),
    end: FractionalOffset(0.0, 0.3),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
  
  static LinearGradient gradientAppBar = const LinearGradient(
    colors: [
      Color(0xFF0057DA),
      Color(0xFF5A9AF9),
    ],
    begin: FractionalOffset(0.0, 0.3),
    end: FractionalOffset(0.3, 0.9),
    stops: [1.0, 0.0],
    tileMode: TileMode.clamp,
  );

  static const latestArticlesImageBackgroundColor =
      Color.fromRGBO(237, 239, 241, 1.0);
  static const categoryBackgroundColor = Color.fromRGBO(241, 243, 249, 1.0);
  static const disabledColor = Color.fromRGBO(115, 161, 229, 1.0);
  static const mtpGreyColor = Color.fromRGBO(115, 115, 115, 1.0);
  static const unselectedAnswerTextColor = Color.fromRGBO(152, 166, 177, 1.0);
  static const unselectedAnswerBackgroundColor =
      Color.fromRGBO(238, 243, 255, 1.0);
  static const quizResultGreyColor = Color.fromRGBO(128, 128, 128, 1.0);
  static const quizMarkBackgroundColor = Color.fromRGBO(208, 234, 239, 1.0);

  static const quizAnswerSelectedColor = Color.fromRGBO(77, 136, 229, 1.0);
  static const quizAnswerCorrectColor = Color.fromRGBO(88, 205, 127, 1.0);
  static const quizAnswerWrongColor = Color.fromRGBO(222, 119, 102, 1.0);

  static const tabBarBorderColor = Color.fromRGBO(196, 210, 213, 1.0);

  static const Color border = Color(0xFFE5E5EA);
}

class CustomColor extends Color {
  const CustomColor(super.value);
}

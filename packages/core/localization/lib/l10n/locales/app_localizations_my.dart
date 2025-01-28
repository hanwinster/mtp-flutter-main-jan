import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appName => 'MTP';

  @override
  String get appFullName => 'Myanmar Teacher Platform';

  @override
  String get navTitleHome => 'မူလ';

  @override
  String get navTitleMyCourses => 'ကျွန်ုပ်၏ သင်တန်းများ';

  @override
  String get navTitleGroup => 'အဖွဲ့';

  @override
  String get navTitleBlog => 'ဘလော့';

  @override
  String get navTitleLibrary => 'စာကြည့်တိုက်';

  @override
  String get buttonTextLogin => 'စနစ်သို့ဝင်';

  @override
  String get buttonTextRetry => 'ပြန်လည်လုပ်ဆောင်မည်';

  @override
  String get labelDoubleTapToBack => 'ထွက်ရန် ထပ်နှိပ်ပါ။';

  @override
  String get buttonTextTakePhoto => 'ပုံရိုက်';

  @override
  String get buttonTextChooseFromGallery => 'ပုံရွေး';

  @override
  String get buttonTextTakeMorePhoto => 'ပုံထပ်ရိုက်';

  @override
  String get errorNoImage => 'ဓာတ်ပုံမရှိ';

  @override
  String get errorFormFieldRequired => 'ဖြည့်ရန်လိုအပ်ပါသည်';

  @override
  String get errorFormFieldInvalid => 'မှားယွင်းနေပါသည်';

  @override
  String get errorFormFieldPasswordLength => 'စကားဝှက်တွင် အနည်းဆုံး စကားလုံး၈ လုံးရှိရမည်';

  @override
  String get errorFormFieldPasswordsDoNotMatch => 'စကားဝှက် မကိုက်ညီပါ';

  @override
  String get errorNoInternetConnection => 'အင်တာနက် ချိတ်ဆက်မှုမရှိပါ';

  @override
  String get errorNoInternetConnectionDescription => 'အင်တာနက်ချိတ်ဆက်မှုကိုစစ်ဆေးပြီး ထပ်မံကြိုးစားပါ';

  @override
  String get errorNoInternetConnectionWithInstruction => 'အင်တာနက်ချိတ်ဆက်မှုကိုစစ်ဆေးပြီး ထပ်မံကြိုးစားပါ';

  @override
  String get errorUnknown => 'တခုခုမှားယွင်းသွားပါသည်။ ခေတ္တစောင့်ဆိုင်းပြီးမှ ပြန်လည်ကြိုးစားကြည့်ပါ။';

  @override
  String get errorSessionExpired => 'ကျေးဇူးပြု၍ နောက်တစ်ကြိမ် အကောင့်ဝင်ပါ';

  @override
  String get labelSeparator => '၊';

  @override
  String get labelNetworkStatusOnline => 'အင်တာနက် ကွန်နက်ရှင် မရှိပါ';

  @override
  String get labelNetworkStatusOffline => 'အင်တာနက် ရရှိပါပြီ';

  @override
  String get accountTypeLabelLearner => 'သင်ယူလေ့လာသူ';

  @override
  String get accountTypeLabelTeacher => 'သင််ကြားသူဆရာ';

  @override
  String get userTypeLabelIndependentLearner => 'သင်ယူလေ့လာသူအားလုံး';

  @override
  String get userTypeLabelJournalist => 'သတင်းမီဒီယာသမား';

  @override
  String get userTypeLabelStudentTeacher => 'ကျောင်းသား ဆရာ';

  @override
  String get userTypeLabelIndependentTeacher => 'ဆရာအားလုံး';

  @override
  String get userTypeLabelAdmin => 'Admin';

  @override
  String get userTypeLabelManager => 'Manager';

  @override
  String get userTypeLabelTeacherEducator => 'Teacher Educator';

  @override
  String get userTypeLabelGuest => 'Guest';

  @override
  String get otpChannelLabelEmail => 'အီးမေးလ်';

  @override
  String get otpChannelLabelSms => 'စာတို';

  @override
  String get genderLabelMale => 'အမျိုးသား';

  @override
  String get genderLabelFemale => 'အမျိုးသမီး';

  @override
  String get genderLabelOther => 'အခြား';

  @override
  String durationUnitSecond(num second) {
    final intl.NumberFormat secondNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String secondString = secondNumberFormat.format(second);

    String _temp0 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$secondString စက္ကန့်',
      one: '၁ စက္ကန့်',
      zero: '၀ စက္ကန့်',
    );
    return '$_temp0';
  }

  @override
  String durationUnitMinute(num minute) {
    final intl.NumberFormat minuteNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String minuteString = minuteNumberFormat.format(minute);

    String _temp0 = intl.Intl.pluralLogic(
      minute,
      locale: localeName,
      other: '$minuteString မိနစ်',
      one: '၁ မိနစ်',
      zero: '၀ မိနစ်',
    );
    return '$_temp0';
  }

  @override
  String durationUnitHour(num hour) {
    final intl.NumberFormat hourNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String hourString = hourNumberFormat.format(hour);

    String _temp0 = intl.Intl.pluralLogic(
      hour,
      locale: localeName,
      other: '$hourString ရက်',
      one: '၁ ရက်',
      zero: '၀ ရက်',
    );
    return '$_temp0';
  }

  @override
  String durationUnitDay(num day) {
    final intl.NumberFormat dayNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String dayString = dayNumberFormat.format(day);

    String _temp0 = intl.Intl.pluralLogic(
      day,
      locale: localeName,
      other: '$dayString စက္ကန့်',
      one: '၁ စက္ကန့်',
      zero: '၀ စက္ကန့်',
    );
    return '$_temp0';
  }

  @override
  String durationUnitWeek(num week) {
    final intl.NumberFormat weekNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String weekString = weekNumberFormat.format(week);

    String _temp0 = intl.Intl.pluralLogic(
      week,
      locale: localeName,
      other: '$weekString ပတ်',
      one: '၁ ပတ်',
      zero: '၀ ပတ်',
    );
    return '$_temp0';
  }

  @override
  String durationUnitMonth(num month) {
    final intl.NumberFormat monthNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String monthString = monthNumberFormat.format(month);

    String _temp0 = intl.Intl.pluralLogic(
      month,
      locale: localeName,
      other: '$monthString လ',
      one: '၁ လ',
      zero: '၀ လ',
    );
    return '$_temp0';
  }

  @override
  String durationUnitYear(num year) {
    final intl.NumberFormat yearNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String yearString = yearNumberFormat.format(year);

    String _temp0 = intl.Intl.pluralLogic(
      year,
      locale: localeName,
      other: '$yearString နှစ်',
      one: '၁ နှစ်',
      zero: '၀ နှစ်',
    );
    return '$_temp0';
  }

  @override
  String postLabelCommentCount(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString မှတ်ချက်',
      one: '၁ မှတ်ချက်',
      zero: '၀ မှတ်ချက်',
    );
    return '$_temp0';
  }

  @override
  String postLabelReactionCount(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString နှစ်သက်',
      one: '၁ နှစ်သက်',
      zero: '၀ နှစ်သက်',
    );
    return '$_temp0';
  }

  @override
  String postLabelShare(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString မျှဝေ',
      one: '၁ မျှဝေ',
      zero: '၀ မျှဝေ',
    );
    return '$_temp0';
  }

  @override
  String labelAppVersion(String version) {
    return 'ဗားရှင်း $version';
  }

  @override
  String get labelCopyright => 'မူပိုင်ခွင့် © 2025  Myanmar Teacher Platform. မူပိုင်ခွင့်ကို ထိန်းသိမ်းထားသည်။';

  @override
  String get drawerHeaderLabelGuest => 'ပြင်ပအသုံးပြုသူ';

  @override
  String get drawerHeaderButtonTextLogin => 'စနစ်သို့၀င်ရန်';

  @override
  String get drawerItemLabelLanguage => 'ဘာသာစကား';

  @override
  String get drawerItemLabelAboutUs => 'ကျွန်ုပ်တို့အကြောင်း';

  @override
  String get drawerItemLabelTermsAndConditions => 'စည်းမျဉ်းစည်းကမ်းနှင့်သတ်မှတ်ချက်များ';

  @override
  String get drawerItemLabelPrivacyPolicy => 'ကိုယ်ရေးအချက်အလက်လုံခြုံမှုဆိုင်ရာ မူဝါဒ';

  @override
  String get drawerItemLabelUserManuals => 'အသုံးပြုသူလက်စွဲများ';

  @override
  String get drawerItemLabelFrequentlyAskedQuestions => 'အမေးများသည့်မေးခွန်းများ';

  @override
  String get drawerItemLabelContactUs => 'ဆက်သွယ်ရန်';

  @override
  String get drawerItemLabelLogOut => 'စနစ်မှထွက်ရန်';

  @override
  String get drawerItemLabelFaq => 'မေးခွန်းများ';

  @override
  String get loginLabelSubtitle => 'စနစ်သို့ဝင်ရန် အကောင့်';

  @override
  String get loginLabelUsername => 'အကောင့်နာမည် သို့မဟုတ် အီးမေးလ်';

  @override
  String get loginLabelPassword => 'စကားဝှက်';

  @override
  String get loginButtonTextForgotPassword => 'စကားဝှက်မေ့နေပါသလား';

  @override
  String get loginButtonTextSubmit => 'စနစ်သို့ ဝင်ရန်';

  @override
  String get loginButtonTextLoggingIn => 'စနစ်သို့ ဝင်နေပါသည်';

  @override
  String get loginLabelNewAccount => 'အကောင့်မရှိသေးဘူးလား?';

  @override
  String get loginButtonTextCreateNewAccount => 'မှတ်ပုံတင်ရန် သွားပါ';

  @override
  String get registerLabelSubtitleFillUserDetails => 'အသေးစိတ်ဖြည့်ရန်';

  @override
  String get registerLabelSubtitleRegister => 'သင့်အကောင့်ကို မှတ်ပုံတင်ပါ။';

  @override
  String get registerLabelMemberLogin => 'အကောင့်ရှိပီးသားလား';

  @override
  String get registerLabelUserType => 'အသုံးပြုသူအမျိုးအစား *';

  @override
  String get registerLabelAccountType => 'အကောင့်ပုံစံ';

  @override
  String get registerLabelFillInformation => 'အချက်အလက် ဖြည့်ပါ';

  @override
  String get registerLabelOrganization => 'အဖွဲ့အစည်း';

  @override
  String get registerLabelAffiliation => 'နှီးနွှယ်မှု(မီဒီယာ အမည်)';

  @override
  String get registerLabelPosition => 'ရာထူး';

  @override
  String get registerLabelCollege => 'ကောလိပ်ရွေးချယ်ပါ';

  @override
  String get registerLabelYearOfStudyingTraining => 'တက်ရောက်/သင်ကြားမည့် ခုနှစ် ရွေးပါ';

  @override
  String get registerLabelGender => 'ကျား/မ *';

  @override
  String get registerButtonTextPrev => 'နောက်သို့';

  @override
  String get registerButtonTextNext => 'ရှေ့သို့';

  @override
  String get registerButtonTextRegister => 'မှတ်ပုံတင်ပါ';

  @override
  String get registerButtonTextOK => 'OK';

  @override
  String get registerLabelUsername => 'အကောင့်အမည် *';

  @override
  String get registerLabelUsernameHelper => 'ကျေးဇူးပြု၍ အင်္ဂလိပ်အက္ခရာ/ဂဏန်း/ဒက်ရှ်(-)/အန်ဒါစကိုး(_) များကိုသာ အသုံးပြုပေးပါ။';

  @override
  String get registerLabelUsernameHelperExampleLabel => 'ဥပမာ - ';

  @override
  String get registerLabelUsernameHelperExampleValue => 'allen-brown, allen_brown, allen_Brown, allenbrown23';

  @override
  String get registerLabelUsernameErrorLength => 'အသုံးပြုသူနာမည် အနည်းဆုံးအက္ခရာ ၅ လုံးရှိရမည်';

  @override
  String get registerLabelName => 'အမည် *';

  @override
  String get registerLabelNameErrorLength => 'အသုံးပြုသူနာမည် အနည်းဆုံးအက္ခရာ ၅ လုံးရှိရမည်';

  @override
  String get registerLabelEmail => 'အီးမေးလ် လိပ်စာ *';

  @override
  String get registerLabelEmailHelper => 'ကျေးဇူးပြု၍ မှန်ကန်သောအီးမေးလ်ထည့်ပေးပါ။';

  @override
  String get registerLabelPassword => 'စကားဝှက် *';

  @override
  String get registerLabelPasswordHelper => 'စကားဝှက်တွင် အနည်းဆုံး စကားလုံး၈ လုံးရှိရမည်။';

  @override
  String get registerLabelConfirmPassword => 'စကားဝှက်အတည်ပြုရန် *';

  @override
  String get registerLabelPhone => 'ဖုန်းနံပါတ်';

  @override
  String get registerLabelPhoneHelper => 'ကျေးဇူးပြု၍ သင့်နိုင်ငံကို ရွေးချယ်ပြီး သင့်မိုဘိုင်းနံပါတ်ကို ရိုက်ထည့်ပါ (နံပါတ်ကို အင်္ဂလိပ်ဘာသာဖြင့်သာ).ဉပမာ., 0900000000 Or 900000000';

  @override
  String get registerLabelOtpChannel => 'OTP လက်ခံမည့် ချန်နယ်(Channel)';

  @override
  String get registerLabelProfileImage => 'ပရိုဖိုင်ပုံ';

  @override
  String get otpVerificaitonLabelTitle => 'OTP အတည်ပြုခြင်း';

  @override
  String otpVerificaitonLabelDescription(String email) {
    return 'သင့်အီးမေးလ်(သို့)ဖုန်းSMSသို့ OTPပေးပို့ပြီးပါပြီ။ ဤနေရာတွက် ကုဒ်ထည့်ပါ။\n$email';
  }

  @override
  String get otpVerificationButtonTextVerify => 'အတည်ပြုပါ';

  @override
  String get otpVerificationLabelDidNotReceiveCode => 'ကုဒ် မရဘူးလား?';

  @override
  String get otpVerificationButtonTextResend => 'ပြန်ပို့ပါ';

  @override
  String get otpVerifiedLabelTitle => 'အောင်မြင်သည်';

  @override
  String get otpVerifiedButtonTextLogin => 'ထပ်မံ ကြိုးစားပါ';

  @override
  String get forgotPasswordLabelTitle => 'စကားဝှက်ပြင်ရန်';

  @override
  String get forgotPasswordLabelEmail => 'အီးမေးလ်';

  @override
  String get forgotPasswordLabelHelper => 'စကားဝှက်ပြန်လည်သတ်မှတ်ခြင်းလုပ်ငန်းစဉ်အတွက် သင့်အီးမေးလ်သို့ OTP ပေးပို့ပါမည်။';

  @override
  String get forgotPasswordLabelSuccessful => 'သင့်အကောင့်စကားဝှက်ကို အောင်မြင်စွာ အပ်ဒိတ်လုပ်ပြီးပါပြီ။';

  @override
  String get forgotPasswordLabelNewPassword => 'စကားဝှက်အသစ်';

  @override
  String get forgotPasswordLabelConfirmPassword => 'စကားဝှက်အတည်ပြုရန်';

  @override
  String get forgotPasswordButtonTextResetPassword => 'စကားဝှက်ပြင်မည်';

  @override
  String get forgotPasswordButtonTextContinue => 'ရှေ့သို့';

  @override
  String get changePasswordLabelTitle => 'စကားဝှက်ပြောင်းရန်';

  @override
  String get changePasswordLabelInstruction => 'စကားဝှက်အသစ်မှာ စကားဝှက် အဟောင်းနှင့် မတူညီရပါ။';

  @override
  String get changePasswordLabelCurrentPassword => 'လောလောဆယ်သုံးနေသော စကားဝှက်';

  @override
  String get changePasswordLabelNewPassword => 'စကားဝှက်အသစ်';

  @override
  String get changePasswordLabelConfirmPassword => 'စကားဝှက်အတည်ပြုရန်';

  @override
  String get changePasswordLabelPasswordMismatchError => 'စကားဝှက်အသစ်နှင့် မကိုက်ညီပါ';

  @override
  String get changePasswordButtonTextSubmit => 'စကားဝှက်အားပြုပြင်မည်';

  @override
  String get changePasswordSuccessLabelTitle => 'အောင်မြင်သည်';

  @override
  String get changePasswordSuccessButtonTextLogin => 'ထပ်မံ ကြိုးစားပါ';

  @override
  String get profileButtonTextViewProfile => 'အကောင့်ကြည့်မည်';

  @override
  String get profileLabelOrganization => 'အဖွဲ့အစည်း *';

  @override
  String get profileLabelAffiliation => 'နှီးနွှယ်မှု(မီဒီယာ အမည်) *';

  @override
  String get profileLabelPosition => 'ရာထူး';

  @override
  String get profileLabelCollege => 'ကောလိပ်';

  @override
  String get profileLabelYearOfStudyingTraining => 'တက်ရောက်/သင်ကြားမည့် ခုနှစ်';

  @override
  String get profileLabelGender => 'ကျား/မ';

  @override
  String get profileLabelGenderMale => 'အမျိုးသား';

  @override
  String get profileLabelGenderFemale => 'အမျိုးသမီး';

  @override
  String get profileLabelGenderOther => 'အခြား';

  @override
  String get profileLabelUsername => 'အကောင့်အမည်';

  @override
  String get profileLabelEmail => 'အီးမေးလ် လိပ်စာ';

  @override
  String get profileLabelPhone => 'ဖုန်းနံပါတ်';

  @override
  String get profileLabelOtpChannel => 'OTP လက်ခံမည့် ချန်နယ်(Channel)';

  @override
  String get profileLabelOtpChannelEmail => 'အီးမေးလ် (ပုံသေ)';

  @override
  String get profileLabelOtpChannelSms => 'စာတို';

  @override
  String get profileButtonTextEditProfile => 'ကိုယ်ရေးအချက်အလက် ပြင်ဆင်';

  @override
  String get profilePostSomething => 'တစ်ခုခု ပို့စ်တင်ပါ...';

  @override
  String get editProfileLabelTitle => 'ကိုယ်ရေးအချက်အလက် ပြင်ဆင်';

  @override
  String get editProfileButtonTextSubmit => 'သိမ်းဆည်း';

  @override
  String get editProfileLabelUserType => 'အသုံးပြုသူအမျိုးအစား';

  @override
  String get editProfileLabelCollege => 'ကောလိပ်';

  @override
  String get editProfileLabelYearOfStudyingTraining => 'တက်ရောက်/သင်ကြားမည့် ခုနှစ်';

  @override
  String get editProfileLabelPhone => 'ဖုန်းနံပါတ်';

  @override
  String get editProfileLabelOrganization => 'အဖွဲ့အစည်း';

  @override
  String get editProfileLabelAffiliation => 'နှီးနွှယ်မှု(မီဒီယာ အမည်)';

  @override
  String get editProfileLabelPosition => 'ရာထူး';

  @override
  String get editProfileLabelUsername => 'အကောင့်အမည်';

  @override
  String get editProfileLabelName => 'အမည်';

  @override
  String get editProfileLabelOtpChannel => 'OTP လက်ခံမည့် ချန်နယ်(Channel)';

  @override
  String get editProfileLabelGender => 'ကျား/မ';

  @override
  String get editProfileLabelEmail => 'အီးမေးလ် လိပ်စာ';

  @override
  String get subscriptionButtonTextSubscribe => 'စာရင်းသွင်းမည်';

  @override
  String get subscriptionButtonTextUnsubscribe => 'စာရင်းပယ်ဖျက်ပါ';

  @override
  String get subscriptionDialogLoginTitle => 'စာရင်းမသွင်းခင် လော့ဂ်အင်ဝင်ရန် လိုအပ်ပါသည်။';

  @override
  String get subscriptionDialogLoginMessage => 'စနစ်ကိုအသုံးပြုရန် သင့်အကောင့်နှင့် လော့ဂ်အင်ဝင်ပါ။';

  @override
  String get subscriptionDialogLoginButton => 'စနစ်သို့ ၀င်ရန်';

  @override
  String get subscriptionLabelAgree => 'စည်းကမ်းနှင့်သတ်မှတ်ချက်များကို သဘောတူပါသည်';

  @override
  String get subscriptionButtonTextContinue => 'ရှေ့သို့';

  @override
  String get helpLabelTitle => 'အကူအညီရယူရန်';

  @override
  String get helpLabelAboutUs => 'ကျွန်ုပ်တို့အကြောင်း';

  @override
  String get helpLabelTermsAndConditions => 'စည်းမျဉ်းစည်းကမ်းနှင့်သတ်မှတ်ချက်များ';

  @override
  String get helpLabelPrivacyPolicy => 'ကိုယ်ရေးအချက်အလက်လုံခြုံမှုဆိုင်ရာ မူဝါဒ';

  @override
  String get helpLabelUserManuals => 'အသုံးပြုသူလက်စွဲများ';

  @override
  String get helpLabelFrequentlyAskedQuestions => 'အမေးများသည့်မေးခွန်းများ';

  @override
  String get helpLabelContactUs => 'ဆက်သွယ်ရန်';

  @override
  String get contactUsFormTitle => 'ကျွန်ုပ်တို့ သင့်ထံဆက်သွယ်ပါမည်';

  @override
  String get contactUsLabelName => 'အမည် *';

  @override
  String get contactUsLabelEmail => 'အီးမေလ်း လိပ်စာ *';

  @override
  String get contactUsLabelPhoneNumber => 'ဖုန်းနံပါတ်';

  @override
  String get contactUsLabelSubject => 'ဘာသာရပ် *';

  @override
  String get contactUsLabelOrganization => 'အဖွဲ့အစည်း/ကုပ္မဏီ';

  @override
  String get contactUsLabelRegion => 'တိုင်းဒေသကြီး/ပြည်နယ်များ';

  @override
  String get contactUsLabelMessage => 'ပြောလိုသော အကြောင်းအရာ *';

  @override
  String get contactUsButtonTextSend => 'ပို့မည်';

  @override
  String get settingsLabelTitle => 'ပြင်ဆင်ချက်များ';

  @override
  String get settingsLabelChangeLanguage => 'ဘာသာစကား';

  @override
  String get settingsLabelAccountSettings => 'အကောင့် ဆက်တင်';

  @override
  String get settingsLabelChangePassword => 'စကားဝှက်ပြောင်းရန်';

  @override
  String get settingsLabelDeleteAccount => 'အကောင့်ဖျက်ရန်';

  @override
  String get settingsButtonTextLogout => 'စနစ်မှထွက်ရန်';

  @override
  String get settingsConfirmDeleteMessage => 'Please be aware that all your taken courses, ratings & reviews, chat messages in discussions and user information will be removed after deleting the account and it cannot be reversible!';

  @override
  String get settingsCancel => 'ဖျက်သိမ်းမည်';

  @override
  String get homeLabelOfflineExplanation => 'အောဖ့်လိုင်းအလုပ်လုပ်ပုံ';

  @override
  String get homeLabelOfflineCourses => 'အော့ဖ်လိုင်းသင်တန်းများ';

  @override
  String get homeLabelCourseCategories => 'သင်တန်းအမျိုးအစားများ';

  @override
  String get homeLabelCourses => 'အွန်လိုင်းသင်တန်းများ';

  @override
  String get homeButtonTextSeeAllCourses => 'အားလုံးကြည့်ရန်';

  @override
  String get homeLabelNoCourses => 'No courses found';

  @override
  String get offlineCoursesTitle => 'အော့ဖ်လိုင်းသင်တန်းများ';

  @override
  String get offlineCoursesLabelEmptyList => 'အော့ဖ်လိုင်းအသုံးပြုရန်၊ သင်တန်း(များ)ကို အရင်ဒေါင်းလုပ် လုပ်ပါ။';

  @override
  String get offlineCoursesButtonTextStartLearning => 'အော့ဖ်လိုင်းသင်ကြားမှုစတင်ရန်';

  @override
  String get courseLearningModeLabelOfflineTitle => 'အော့ဖ်လိုင်းသင်ကြားမှု';

  @override
  String get courseLearningModeLabelOfflineMessage => 'သင့်အနေဖြင့် အော့ဖ်လိုင်းရရှိပါသည်။ ဖြေဆိုမှု့ များအတွက် သိမ်းမထားနိုင်ပါ။';

  @override
  String get courseLearningModeButtonTextSwitchToOnline => 'အော့ဖ်လိုင်းပြောင်းပါ';

  @override
  String get courseLearningModeButtonTextStayOffline => 'အော့ဖ်လိုင်းအနေနှင့် ဆက်လက်အသုံးပြုရန်';

  @override
  String get blogLabelSubtitleLatestPosts => 'နောက်ဆုံးရ ဆောင်းပါးများ';

  @override
  String get blogLabelSubtitleRecommendedPosts => 'အကြံပြုထားသောဆောင်းပါးများ';

  @override
  String get blogLabelPostsNotFound => 'ဆောင်းပါးများမရှိသေးပါ။ မကြာခင်ပြန်လည်စစ်ဆေးပေးပါ။';

  @override
  String get blogLableGuestUserMessage => 'ဘလော့ဂ်များကိုဖတ်ရန် လော့ဂ်အင်လုပ်ပါ။';

  @override
  String get blogButtonTextLogin => 'လော့ဂ်အင်လုပ်ပါ';

  @override
  String get postLabelSubtitleTags => 'Tags';

  @override
  String get postLabelSubtitleRecommendedPosts => 'အကြံပြုထားသောဆောင်းပါးများ';

  @override
  String get postLabelSubtitleCategories => 'ကဏ္ဍများ';

  @override
  String get postLabelSubtitleComments => 'မှတ်ချက်များ';

  @override
  String postLabelMemberSince(String date) {
    return '$date ကတည်းကအဖွဲ့ဝင်';
  }

  @override
  String postLabelPostedOn(String date) {
    return '$date မှာ တင်ခဲ့';
  }

  @override
  String postLabelDuration(String duration) {
    return '$duration ဖတ်';
  }

  @override
  String postLabelDurationUnitSecond(num second) {
    final intl.NumberFormat secondNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String secondString = secondNumberFormat.format(second);

    String _temp0 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$secondString စက္ကန့်',
      one: '၁ စက္ကန့်',
      zero: '၀ စက္ကန့်',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitMinute(num minute) {
    final intl.NumberFormat minuteNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String minuteString = minuteNumberFormat.format(minute);

    String _temp0 = intl.Intl.pluralLogic(
      minute,
      locale: localeName,
      other: '$minuteString မိနစ်',
      one: '၁ မိနစ်',
      zero: '၀ မိနစ်',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitHour(num hour) {
    final intl.NumberFormat hourNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String hourString = hourNumberFormat.format(hour);

    String _temp0 = intl.Intl.pluralLogic(
      hour,
      locale: localeName,
      other: '$hourString ရက်',
      one: '၁ ရက်',
      zero: '၀ ရက်',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitDay(num day) {
    final intl.NumberFormat dayNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String dayString = dayNumberFormat.format(day);

    String _temp0 = intl.Intl.pluralLogic(
      day,
      locale: localeName,
      other: '$dayString စက္ကန့်',
      one: '၁ စက္ကန့်',
      zero: '၀ စက္ကန့်',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitWeek(num week) {
    final intl.NumberFormat weekNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String weekString = weekNumberFormat.format(week);

    String _temp0 = intl.Intl.pluralLogic(
      week,
      locale: localeName,
      other: '$weekString ပတ်',
      one: '၁ ပတ်',
      zero: '၀ ပတ်',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitMonth(num month) {
    final intl.NumberFormat monthNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String monthString = monthNumberFormat.format(month);

    String _temp0 = intl.Intl.pluralLogic(
      month,
      locale: localeName,
      other: '$monthString လ',
      one: '၁ လ',
      zero: '၀ လ',
    );
    return '$_temp0';
  }

  @override
  String postLabelDurationUnitYear(num year) {
    final intl.NumberFormat yearNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String yearString = yearNumberFormat.format(year);

    String _temp0 = intl.Intl.pluralLogic(
      year,
      locale: localeName,
      other: '$yearString နှစ်',
      one: '၁ နှစ်',
      zero: '၀ နှစ်',
    );
    return '$_temp0';
  }

  @override
  String get postButtonTextTakeQuiz => 'ဉာဏ်စမ်းမေးခွန်းဖြေဆိုပြီး ဘလော့ဂ်ကို ဖတ်ပြီးကြောင်း အတည်ပြုမည်';

  @override
  String get postLabelReadAndTookQuiz => 'ဉာဏ်စမ်းမေးခွန်းဖြေဆိုပြီး အကြောင်းအရာကိုလည်း ဖတ်ပြီးပါပြီ';

  @override
  String get postButtonTextMarkAsRead => 'ဘလော့ဂ်ကို ဖတ်ပြီးကြောင်း အတည်ပြု';

  @override
  String get postLabelAlreadyRead => 'ဘလော့ဂ်ကို ဖတ်ပြီးပါပြီး';

  @override
  String get temp3 => 'လတ်တလော ဆွေးနွေးပြောဆိုမှုများ မရှိသေးပါ။';

  @override
  String get postLabelReadMore => 'ပိုမိုဖတ်ရှုရန်';

  @override
  String get postLabelReadLess => 'စာချုံ့ရန်';

  @override
  String get postLabelPlaceholderComment => 'မှတ်ချက်ရေးပါ';

  @override
  String get postLabelAddPhoto => 'ဓါတ်ပုံ';

  @override
  String get postLabelAddVideo => 'ဗွီဒီယို';

  @override
  String get postButtonTextSubmitComment => 'မှတ်ချက်';

  @override
  String get postButtonTextEditComment => 'ပြန်ပြင်';

  @override
  String get postButtonTextDeleteComment => 'ဖျက်';

  @override
  String get blogPostQuizTitle => 'ကျေးဇူးပြု၍ ဘလော့ဂ်နှင့်ဆိုင်သော စစ်တမ်းကိုဖြေဆိုပါ';

  @override
  String blogPostQuizLabelFormattedQuestionCount(num current, num total) {
    final intl.NumberFormat currentNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String currentString = currentNumberFormat.format(current);
    final intl.NumberFormat totalNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String totalString = totalNumberFormat.format(total);

    return 'မေးခွန်း $currentString/$totalString';
  }

  @override
  String blogPostQuizLabelFormattedOverallScore(num score) {
    final intl.NumberFormat scoreNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String scoreString = scoreNumberFormat.format(score);

    return 'စုစုပေါင်းရမှတ် : $scoreString';
  }

  @override
  String get blogPostQuizLabelTrueFalseInstruction => 'အဖြေမှန် တခုကို ရွေးချယ်ပါ';

  @override
  String get blogPostQuizLabelTrueFalseOptionTrue => 'မှန်သည်';

  @override
  String get blogPostQuizLabelTrueFalseOptionFalse => 'မှားသည်';

  @override
  String get blogPostQuizLabelTrueFalseOptionNone => 'တခုမှ မဟုတ်';

  @override
  String get blogPostQuizLabelMachingInstruction => 'အဖြေမှန်ကို ရွေးချယ်ပြီး ယှဥ်တွဲပါ';

  @override
  String get blogPostQuizLabelMultipleChoiceInstruction => 'အဖြေမှန်များကို ရွေးချယ်ပါ။ (အဖြေမှန်သည် တခု သို့မဟုတ် တခုထက် ပိုနိုင်ပါသည်)';

  @override
  String get blogPostQuizLabelRearrangeChoiceInstruction => 'အဖြေကို နှိပ်ပြီး မှန်ကန်သော အစီအစဥ်တိုင်း ဖြစ်အောင် ပြန်စီပါ။';

  @override
  String get blogPostQuizButtonTextNext => 'ရှေ့သို့';

  @override
  String get blogPostQuizButtonTextPrevious => 'နောက်သို့';

  @override
  String get blogPostQuizButtonTextSubmit => 'အတည်ပြု';

  @override
  String get blogQuizCompletionLabelPass => 'ဂုဏ်ယူပါတယ်';

  @override
  String get blogQuizCompletionLabelNotPass => 'ကြိုးစားမှုကို အသိအမှတ်ပြုပါတယ်';

  @override
  String get blogQuizCompletionLabelScore => 'ရမှတ်';

  @override
  String get blogQuizCompletionLabelQuizType => 'အထွေထွေဗဟုသုတ ဥာဏ်စမ်း';

  @override
  String get blogQuizButtonTextSumitAnswer => 'ဖြေဆိုမှု့ကိုပို့ပါ';

  @override
  String get blogQuizCompletionButtonTextRetakeQuiz => 'ပြန်လည် ဖြေဆိုပါ';

  @override
  String get blogQuizCompletionButtonTextContinue => 'ဆက်လက်လုပ်ဆောင်ရန်';

  @override
  String get notiButtonTextViewMore => 'ပိုမိုကြည့်ရှု့ရန်';

  @override
  String get notiLabelNotiListTitle => 'နိုတီများ';

  @override
  String get notificationList => 'နိုတီများ';

  @override
  String get notiLabelUnread => 'ဖတ်ရန် နိုတီများ';

  @override
  String get notiLabelRead => 'ဖတ်ပြီးသော နိုတီများ';

  @override
  String get notiLabelNoUnread => 'နိုတီများ မရှိသေးပါ';

  @override
  String get eLibraryHintSearch => 'ရှာမည်';

  @override
  String get temp7 => 'ပိုမိုကြည့်ရှု့ရန်';

  @override
  String get eLibraryClearAll => 'အားလုံးရှင်းလင်းပါ';

  @override
  String get eLibraryChooseSubject => 'ဘာသာရပ် ရွေးပါ';

  @override
  String get eLibraryChooseResourceFormat => 'အရင်းအမြစ်ပုံစံ ရွေးပါ';

  @override
  String get eLibraryDownloads => 'ဒေါင်းလုဒ်များ';

  @override
  String get eLibraryRating => 'အဆင့်သတ်မှတ်ချက်';

  @override
  String get eLibraryTotalPages => 'စုစုပေါင်းစာမျက်နှာများ';

  @override
  String get eLibraryOverview => 'အကျဉ်းချုပ်';

  @override
  String get eLibraryAuthor => 'စာရေးသူ';

  @override
  String get eLibraryPublisher => 'ထုတ်ဝေသူ';

  @override
  String get eLibraryStrand => 'အခန်း';

  @override
  String get eLibrarySubStrand => 'အခန်းငယ်';

  @override
  String get eLibraryLesson => 'သင်ခန်းစာ';

  @override
  String get eLibraryPublishingYear => 'ထုတ်ဝေသည့်နှစ်';

  @override
  String get eLibraryUrl => 'အင်တာနက်လိပ်စာ';

  @override
  String get eLibraryAdditionalInformation => 'ထပ်ဆောင်းအချက်အလက်များ';

  @override
  String get eLibraryTotalPageViews => 'စုစုပေါင်း စာမျက်နှာကြည့်ရှုမှု';

  @override
  String get eLibraryTotalDownloads => 'စုစုပေါင်း ဒေါင်းလုပ်ဆွဲမှု';

  @override
  String get eLibraryLastUpdated => 'နောက်ဆုံး တင်ဆက်ခဲ့သောနေ့';

  @override
  String get eLibraryPreview => 'အမြည်းကြည့်ရန်';

  @override
  String get eLibraryDownload => 'ဒေါင်းလုဒ်';

  @override
  String get eLibraryDownloading => 'ဒေါင်းလုပ်လုပ်နေသည်...';

  @override
  String get eLibraryDownloadComplete => 'ဒေါင်းလုပ်ပြီးပါပြီ';

  @override
  String get eLibraryDownloadPath => 'ဒေါင်းလုပ်ဆွဲထားသော လမ်းကြောင်း :';

  @override
  String get eLibraryNoResourceFound => 'အရင်းအမြစ်များ မတွေ့ပါ';

  @override
  String get eLibraryDownloadPathOpen => 'ဖွင့်မည်';

  @override
  String get eLibraryDownloadFail => 'ဒေါင်းလုဒ် မအောင်မြင်ပါ။ ထပ်စမ်းကြည့်ပါ။';

  @override
  String eLibraryDownloadPercent(num progress) {
    final intl.NumberFormat progressNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String progressString = progressNumberFormat.format(progress);

    return '$progressString % ';
  }

  @override
  String get courseLabelIntroudction => 'နိဒါန်း';

  @override
  String get courseLabelLectures => 'သင်ကြားပို့ချချက်များ';

  @override
  String get courseLabelLecture => 'သင်ကြားပို့ချချက်';

  @override
  String get courseLabelLearningActivities => 'သင်ယူမှုလုပ်ငန်းများ';

  @override
  String get courseLabelQuizzes => 'ဉာဏ်စမ်း မေးခွန်းများ';

  @override
  String get courseLabelSummaries => 'အကျဉ်းချုပ်များ';

  @override
  String get courseLabelLiveSessions => 'သင်တန်း Zoom သင်ခန်းစာများ';

  @override
  String get courseLabelEvaluations => 'အကဲဖြတ်သုံးသပ်ခြင်းများ';

  @override
  String get courseLabelAssessment => 'စစ်ဆေးအကဲဖြတ်ခြင်း';

  @override
  String get courseDetailsTabTitleOverview => 'အကျဉ်းချုပ်';

  @override
  String get courseDetailsTabTitleLectures => 'သင်ကြားပို့ချချက်များ';

  @override
  String get courseDetailsTabTitleDiscussion => 'ဆွေးနွေးခြင်း';

  @override
  String get courseDetailsTabTitleReview => 'မှတ်ချက်';

  @override
  String get courseDetailsTabTitleRelatedResources => 'သက်ဆိုင်သော အရင်းအမြစ်များ';

  @override
  String get courseLabelQuestionTextInputHint => 'အဖြေရေးသားပါ';

  @override
  String get courseLabelQuestionMatchingHint => 'ရွေးချယ်ပါ';

  @override
  String get courseLabelQuestionRearrangeGuide => '(အစီအစဥ် အမှန် ဖြစ်အောင် ဖိ၍ စီပါ )';

  @override
  String get courseLableQuestionAllRequiredError => 'မေးခွန်းများ ဖြေဆိုပါ';

  @override
  String get courseLableQuestionRequiredError => 'ဖြေဆိုရန် လိုအပ်ပါသည်';

  @override
  String get courseButtonTextNext => 'ရှေ့သို့';

  @override
  String get courseButtonTextPrevious => 'နောက်သို့';

  @override
  String get courseLableGuestUserMessage => 'သင်ခန်းစာများကို လေ့လာရန် လော့အင်၀င်ပါ';

  @override
  String get courseLableNoUserOngoingCourses => 'လက်ရှိ ယူထားသော သင်တန်းမရှိသေးပါ။ ကျေးဇူးပြု၍ သင်တန်းတစ်ခု စတင်ယူပေးပါ။';

  @override
  String get courseButtonTextExploreCourses => 'သင်တန်းများ';

  @override
  String get courseLableNoUserCompletedCourses => 'လက်ရှိ ပြီးထားသော သင်တန်းမရှိသေးပါ။ ကျေးဇူးပြု၍ သင်တန်းတစ်ခု ပြီးအောင် ယူပေးပါ။';

  @override
  String get courseButtonTextTakeCourse => 'ဤသင်တန်းကိုတက်ရောက်မည်';

  @override
  String get courseButtonTextContinue => 'ရှေ့သို့';

  @override
  String get courseButtonTextStartEvaluation => 'စစ်ဆေးမှု့စတင်ပါ';

  @override
  String get courseButtonTextGenerateCertificate => 'သင်တန်းပြီးဆုံးကြောင်းလက်မှတ်ထုတ်မည်';

  @override
  String get courseButtonTextDownloadCourse => 'သင်ခန်းစာများကို ဒေါင်းလုပ်လုပ်ပါ';

  @override
  String get courseButtonTextDownloadResources => 'သင်ခန်းစာ Resources များကို ဒေါင်းလုပ် လုပ်ပါ';

  @override
  String get courseLabelDownloadCourseSuccessfully => 'ဒေါင်းလုပ်ယူခြင်း အောင်မြင်ပါတယ်';

  @override
  String get courseLabelDownloadResourcesSuccessfully => 'အောင်မြင်စွာ ဒေါင်းလုဒ်ချပြီးပါပြီ။ ဒါကို ဖိုလ်ဒါထဲမှာ ရှာဖွေနိုင်ပါတယ်။';

  @override
  String get courseLabelCompletedMessage => 'သင်တန်းပြီးဆုံးခြင်းအတွက် ဂုဏ်ယူပါတယ်';

  @override
  String get courseButtonTextViewCertificate => 'သင်တန်းပြီးဆုံးခြင်းလက်မှတ်ကို ကြည့်ရှုပါ ';

  @override
  String get courseLabelCertificateDownloaded => 'သင်တန်းပြီးဆုံးခြင်းလက်မှတ်ကို အောင်မြင်စွာဒေါင်းလုပ် လုပ်ပြီးပါပြီ';

  @override
  String get courseCompletionLabelTitle => 'ဂုဏ်ယူပါတယ်';

  @override
  String get courseCompletionLabelMessage => 'သင်တန်းကို အောင်မြင်စွာ ပြီးဆုံးခဲ့ပါပြီ။ ကောင်းမွန်တဲ့ အလုပ်လုပ်ခဲ့တာပါ!';

  @override
  String get courseCompletionButtonTextGoToMyCourses => 'ယူထားသောသင်တန်းများကို သွားရန်';

  @override
  String courseDashboardLabelFormattedProgress(num progress) {
    final intl.NumberFormat progressNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String progressString = progressNumberFormat.format(progress);

    return '$progressString% လေ့လာပြီး';
  }

  @override
  String get courseDashboardLabelHalfWay => 'ဂုဏ်ယူပါတယ် ဒီသင်တန်းကို ပြီးမြောက်ရန် တစ်ဝက်လောက်ရောက်နေပါပြီ';

  @override
  String get courseDashboardButtonTextStartLearning => 'စလေ့လာ';

  @override
  String get courseDashboardButtonTextContinueLearning => 'ဆက်လေ့လာ';

  @override
  String get courseDashboardLabelAssessmentInfo => 'သင်ခန်းစာများအားလုံးပြီးဆုံးပြီးလျှင် လေ့လာသူအားအကဲဖြတ်သည့် မေးခွန်းမျာအား ဖြေဆိုနိုင်ပါသည်။';

  @override
  String get courseDashboardLabelEvaluationInfo => 'လေ့လာသူအားအကဲဖြတ်သည့် မေးခွန်းများဖြေပြီးလျှင် သင်တန်းအား အကဲဖြတ်နိင်ပါသည်။';

  @override
  String get courseExistConfirmationLabelTitle => 'သင်ယူမှု ခေတ္တ ရပ်နားမည်';

  @override
  String get courseExistConfirmationLabelMessage => 'သင်ခန်းစာ၏ အပြင်စာမျက်နှာသို့ ထွက်မှာ သေချာပါသလား။ သင်၏ လေ့လာမှုကို သိမ်းဆည်းထားမည်ဖြစ်ပြီး၊ အချိန်မရွေး နောက်ဆုံးလေ့လာခဲ့သည့် နေရာမှ ပြန်လည် စတင်နိုင်ပါသည်။  ';

  @override
  String get courseExistConfirmationButtonTextStay => 'ဆက်လက်သင်ယူမည်';

  @override
  String get courseExistConfirmationButtonTextLeave => 'ထွက်မည်';

  @override
  String get interactiveProcessButtonTextStart => 'စတင်ပါ';

  @override
  String interactiveProcessLabelFormattedStep(num step) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String stepString = stepNumberFormat.format(step);

    return 'အဆင့် $stepString';
  }

  @override
  String get interactiveProcessButtonTextStartAgain => 'ပြန်လည်စတင်ပါ';

  @override
  String get interactiveSortingButtonTextReplay => 'ပြန််လည်စစ်ဆေးပါ';

  @override
  String interactiveSortingLabelFormattedScore(num score, num total) {
    final intl.NumberFormat scoreNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String scoreString = scoreNumberFormat.format(score);
    final intl.NumberFormat totalNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String totalString = totalNumberFormat.format(total);

    return '$scoreString/$totalString ကဒ် မှန်';
  }

  @override
  String get courseXApiButtonTextMarkComplete => 'ရှေ့သို့';

  @override
  String get courseXApiLabelRequiredToComplete => 'သင်ကြားမှုပြီးစီးရန် ကျန်ရှိနေသေးသည်။ ကျေးဇူးပြု၍ ဆက်လက်လေ့လာပါ။';

  @override
  String get courseLabelCourseFeatures => 'သင်ခန်းစာ လုပ်ဆောင်ချက်များ';

  @override
  String get courseLabelCourseDescription => 'သင်တန်းအကြောင်းအရာ ဖော်ပြချက်';

  @override
  String get courseLabelCourseObjectives => 'သင်တန်းရည်ရွယ်ချက်များ';

  @override
  String get courseLabelCourseLearningOutcomes => 'သင်ယူမှုရလဒ်များ';

  @override
  String get courseLabelCourseResourceLink => 'အရင်းအမြစ်လင့်ခ်';

  @override
  String get courseLabelLectureDescription => 'သင်ခန်းစာအကြောင်းအရာ ဖော်ပြချက်';

  @override
  String get courseQuizLabelOptionTrue => 'မှန်';

  @override
  String get courseQuizLabelOptionFalse => 'မှား';

  @override
  String get courseAssignmentLableSubmission => 'Assignment တင်သွင်းခြင်း';

  @override
  String get courseAssignmentButtonTextChooseFile => 'ဖိုင်ရွေးပါ';

  @override
  String get courseAssignmentButtonTextSubmit => 'တင်သွင်းမည်';

  @override
  String get courseAssignmentLabelSubmitted => 'တင်သွင်းပြီးပါပြီ';

  @override
  String get courseAssignmentLabelFeedbackFromInstructor => 'သင်တန်းဆရာများမှ မှတ်ချက်';

  @override
  String get courseAssignmentLabelNoFeedback => 'သင်တန်းဆရာများမှ မှတ်ချက်မရှိသေးပါ';

  @override
  String get courseLiveSessionLabelAgenda => 'အစီအစဉ်';

  @override
  String get courseLiveSessionLabelSessionDateTime => 'Zoomသင်ခန်းစာ ပြုလုပ်မည့် နေ့ရက်နှင့်အချိန်';

  @override
  String get courseLiveSessionLabelSessionDuration => 'Zoomသင်ခန်းစာ  ကြာချိန်';

  @override
  String get courseLiveSessionLabelRegistrationPeriodOver => 'စာရင်းသွင်း ကာလ ကျော်လွန်သွားပါပြီ';

  @override
  String courseAssessmentLabelCorrectAnswerCountHint(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return 'အဖြေမှန် အရေအတွက် - $countString ခု';
  }

  @override
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerHint => 'အဖြေမှန််ဖြေဆိုမှု့ပြီးမြောက်မှသာ အောင်မြင်ပါသည်';

  @override
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerUserAnswerStatus => 'တင်သွင်း အောင်မြင်ပါသည်';

  @override
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackHint => 'course ပိုင်ရှင်မှ မှတ်ချက်ပေး ပြီးမှသာ အောင်မြင်ပါသည်';

  @override
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackUserAnswerStatus => 'course ပိုင်ရှင်မှ မှတ်ချက်စောင့်ရန်လိုပါသည်';

  @override
  String get courseAssessmentLabelPassingOptionAfterSettingPassHint => 'course ပိုင်ရှင်မှ မှတ်ချက်ပေး ပြီးမှသာ အောင်မြင်ပါသည်';

  @override
  String get courseAssessmentLabelPassingOptionAfterSettingPassUserAnswerStatus => 'course ပိုင်ရှင်မှ မှတ်ချက်ပေး ပြီးမှသာ အောင်မြင်ပါသည်';

  @override
  String courseAssessmentLabelFeedback(String feedback) {
    return 'course ပိုင်ရှင်မှ မှတ်ချက်: $feedback';
  }

  @override
  String get courseAssessmentButtonTextSave => 'သိမ်းမည်';

  @override
  String get courseAssessmentLabelSaved => 'သိမ််းပြီးပါပြီ';

  @override
  String get courseAssessmentButtonTextSubmit => 'တင်သွင်းမည်';

  @override
  String get courseAssessmentButtonTextShowCorrectAnswers => 'အဖြေမှန်ကြည့်မည်';

  @override
  String get courseAssessmentLabelCorrectAnswers => 'အဖြေမှန််တွေကတော့';

  @override
  String get courseEvaluationButtonTextSubmit => 'တင်သွင်းမည်';

  @override
  String get courseButtonTextCancelCourse => 'သင်တန်း ဖျက်သိမ်း';

  @override
  String get courseLabelCancelCourseConfirmationTitle => 'သေချာပါသလား';

  @override
  String get courseLabelCancelCourseConfirmationMessage => 'သင်တန်းကို ဖျက်သိမ်းပါက ဤသင်တန်းအတွက် တိုးတက်မှုအားလုံး ဆုံးရှုံးပါမည်။';

  @override
  String get courseButtonTextCancelCourseDismiss => 'နောက်သို့';

  @override
  String get courseButtonTextCancelCourseConfirm => 'ဖျက်သိမ်းမည်';

  @override
  String get courseDiscussionLabelGuestMessage => 'ဝင်ရောက်ဆွေးနွေးရန် ဤသင်တန်းကို သင်တက်ရောက်ရပါမည်။';

  @override
  String get courseDiscussionLabelInputHint => 'သင် ဘာတွေတွေးနေ သလဲ';

  @override
  String get courseDiscussionLabelDiscussionOwner => 'Me';

  @override
  String get courseReviewSummaryTitle => 'ရီဗျူးများ';

  @override
  String courseReviewSummaryFormattedReviewCount(num review) {
    final intl.NumberFormat reviewNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String reviewString = reviewNumberFormat.format(review);

    String _temp0 = intl.Intl.pluralLogic(
      review,
      locale: localeName,
      other: '$reviewString reviews',
      one: '1 review',
      zero: '0 review',
    );
    return '$_temp0';
  }

  @override
  String get courseReviewSummaryRatingLevels => '(5 - Best, 1 - Worst)';

  @override
  String get courseReviewLabelLearnerMessage => 'အဆင့်သတ်မှတ်ရန်နှင့် သုံးသပ်ချက်ထားခဲ့ရန် ဤသင်တန်းကို သင်တက်ရောက်ရပါမည်။';

  @override
  String get courseReviewLabelGuestMessage => 'အဆင့်သတ်မှတ်ရန်နှင့် ပြန်လည်သုံးသပ်ရန် ကျေးဇူးပြု၍ စနစ်သို့ ဝင်ပါ';

  @override
  String get courseReviewLabelWriteAReview => 'မှတ်ချက်ပေးပါ။';

  @override
  String get courseReviewButtonTextSubmitReview => 'မှတ်ချက်တင်ပါ။';

  @override
  String get courseReviewLabelNewReviewInput => 'ဒီအကြောင်းအရာကို ရှဲပေးပါ';

  @override
  String get courseReviewLabelNewReviewGuide => 'ဤသင်ခန်းစာကို အဆင့်သတ်မှတ်ပါ';

  @override
  String get courseRelatedResourceButtonTextLearnMore => 'ပိုမိုလေ့လာမည်';

  @override
  String get groupLabelThematicGroups => 'အဖွဲ့များ';

  @override
  String get groupLabelGuestWelcomeMessage => 'အဖွဲ့ထဲသို့ရောက်ရှိရန် လော့အင်လုပ်ပါ';

  @override
  String get groupLabelMyGroups => 'ကျွန်ုပ်၏ အဖွဲ့များ';

  @override
  String get groupLabelRecommended => 'အကြံပြုသည့် အဖွဲ့များ';

  @override
  String get groupLabelSearchAnything => 'ရှာပါ';

  @override
  String get groupLabelNoData => 'ဒေတာ မရှိပါ';

  @override
  String get groupLabelEmptyPost => 'ပို့များမရှိပါ';

  @override
  String get groupLabelEmptyGroup => 'အဖွဲ့များမရှိပါ';

  @override
  String groupLabelFormattedMemberCount(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString members',
      one: '1 member',
      zero: '0 member',
    );
    return '$_temp0';
  }

  @override
  String get groupLabelRequestSentMessage => 'အဖွဲ့ခေါင်းဆောင်မှ Approve စောင့်ပါ';

  @override
  String get groupLabelCategories => 'အမျိုးအစားများ';

  @override
  String get groupLabelFilterAllCategories => 'အမျိုးအစား အားလုံး';

  @override
  String get groupLabelPrivate => 'သီးသန့်အဖွဲ့';

  @override
  String get groupLabelPublic => 'အများသုံးအဖွဲ့';

  @override
  String get groupButtonTextRequestToJoin => 'အဖွဲသို့ ၀င်ရန် တောင်းဆိုပါ';

  @override
  String get groupButtonTextBack => 'နောက်သို့';

  @override
  String get groupButtonTextViewGroup => 'အဖွဲ့ကို ကြည့်ရန်';

  @override
  String get groupButtonTextJoinGroup => 'အဖွဲ့ကို ၀င်ရန်';

  @override
  String get groupButtonTextLeaveGroup => 'အဖွဲ့မှ ထွက်ရန်';

  @override
  String get groupButtonTextKeepPostAndLeave => 'ပို့များကိုထိန်းသိမ်းပီး အဖွဲ့ မှ ထွက်ရန်';

  @override
  String get groupButtonTextDeletePostAndLeave => 'ပို့များကို ဖျက်ပီး အဖွဲ့ မှ ထွက်ရန်';

  @override
  String get groupButtonTextAgree => 'သဘောတူပါသည်';

  @override
  String get groupLabelNewsFeed => 'သတင်းများ';

  @override
  String get groupLabelWelcome => 'ကြိုဆိုပါသည်';

  @override
  String get groupButtonTextPost => 'ပို့စ်တင်ပါ';

  @override
  String get groupLabelShareSomething => 'တစ်စုံတစ်ခု မျှဝေပါ';

  @override
  String get groupLabelPost => 'ပို့စ်';

  @override
  String get groupLabelPhoto => 'ဓာတ်ပုံ';

  @override
  String get groupLabelVideo => 'ဗီဒီယို';

  @override
  String get groupLabelTag => 'Tag';

  @override
  String groupLabelLikeCount(num like) {
    final intl.NumberFormat likeNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String likeString = likeNumberFormat.format(like);

    String _temp0 = intl.Intl.pluralLogic(
      like,
      locale: localeName,
      other: '$likeString နှစ်သက်',
      one: '၁ နှစ်သက်',
      zero: '၀ နှစ်သက်',
    );
    return '$_temp0';
  }

  @override
  String groupLabelPostCount(num post) {
    final intl.NumberFormat postNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String postString = postNumberFormat.format(post);

    String _temp0 = intl.Intl.pluralLogic(
      post,
      locale: localeName,
      other: '$postString ပို့စ်',
      one: '၁ ပို့စ်',
      zero: '၀ ပို့စ်',
    );
    return '$_temp0';
  }

  @override
  String groupLabelCommentCount(num comment) {
    final intl.NumberFormat commentNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String commentString = commentNumberFormat.format(comment);

    String _temp0 = intl.Intl.pluralLogic(
      comment,
      locale: localeName,
      other: '$commentString မှတ်ချက်',
      one: '၁ မှတ်ချက်',
      zero: '၀ မှတ်ချက်',
    );
    return '$_temp0';
  }

  @override
  String get groupLabelWriteComment => 'မှတ်ချက်ရေးပါ...';

  @override
  String groupLabelReplyCount(num reply) {
    final intl.NumberFormat replyNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String replyString = replyNumberFormat.format(reply);

    String _temp0 = intl.Intl.pluralLogic(
      reply,
      locale: localeName,
      other: '$replyString replies',
      one: '1 reply',
      zero: '0 reply',
    );
    return '$_temp0';
  }

  @override
  String groupLabelShareCount(num share) {
    final intl.NumberFormat shareNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String shareString = shareNumberFormat.format(share);

    String _temp0 = intl.Intl.pluralLogic(
      share,
      locale: localeName,
      other: '$shareString မျှဝေ',
      one: '၁ မျှဝေ',
      zero: '၀ မျှဝေ',
    );
    return '$_temp0';
  }

  @override
  String get groupLabelCreatePost => 'ပိုစ့်အသစ်';

  @override
  String get groupLabelEditPost => 'ပြင်မည်';

  @override
  String get groupLabelDeletePost => 'ဖျက်သိမ်းမည်';

  @override
  String get groupLabelNewPostHint => 'စာရိုက်ပါ';

  @override
  String get groupButtonTextSubmitPost => 'ပို့စ်တင်ပါ';

  @override
  String get groupLabelFailEditPost => 'ပို့စ်ပြင်ရန်';

  @override
  String get groupLabelHidePost => 'ပို့စ်ကို hide ရန်';

  @override
  String get groupLabelSuccessEditPost => 'ပိုစ့်ပြင်ဆင်တာအောင်မြင်ပါသည်';

  @override
  String get groupToastNoChanges => 'ပြောင်းလဲမှု့မရှိပါ';

  @override
  String get groupLabelPendingPostMessage => 'ပို့စ်ကို အဖွဲ့ခေါင်းဆောင်မှ ကြည့်ရှုနေပါသည်';

  @override
  String get groupLabelWaitingApproval => ' ';

  @override
  String get groupLabelPreview => 'နမူနာ';

  @override
  String get groupLabelCommentSection => 'မှတ်ချက်ပေးခြင်းအပိုင်း';

  @override
  String get groupButtonTextBackToFeed => 'ပို့်စ်အသစ်များဆီသွားရန်';

  @override
  String get groupLabelPendingPosts => 'စစ်ဆေးနေသောပို့စ်များ';

  @override
  String get groupLabelPendingForApproval => 'အတည်ပြုမည့် ပို့စ်များ';

  @override
  String get groupLabelCancel => 'ဖျက်သိမ်းမည်';

  @override
  String get groupButtonTextViewPendingPosts => 'အတည်ပြုမည့် ပို့စ်များ';

  @override
  String get groupLabelMyFeeds => 'ပို့်စ်အသစ်များဆီသွားရန်';

  @override
  String get groupWarningLeave => 'အဖွဲ့မှထွက်ရန်အတည်ပြုပါသလား';

  @override
  String get groupWarningDelete => 'ပို့်စ််များ ဖျက်သွားချင်ပါသလား ';

  @override
  String get groupLabelWarning => 'သတိပေးချက်';

  @override
  String get groupLabelRule => 'အဖွဲ့ စည်းကမ်းများ';

  @override
  String get homeLabelSearchCourses => 'ကျွန်ုပ်တို့၏သင်တန်းများကို ရှာဖွေရန်';

  @override
  String get learningQuizLabelSelectAnswer => 'အဖြေ ရွေးပါ';

  @override
  String get learningQuizButtonTextCheckAnswer => 'အဖြေမှန်စစ်မည်';

  @override
  String get communityVideoLocal => 'ပြည်တွင်း ဗီဒီယိုများ';

  @override
  String get communityVideoInternational => 'ပြည်ပ ဗီဒီယိုများ';

  @override
  String get communityVideoSeeAll => 'အားလုံးကြည့်ရန်';

  @override
  String get communityVideoViews => 'ကြည့်ရန်';

  @override
  String get communityVideoDescription => 'အကြောင်းအရာ';

  @override
  String get communityVideoRelatedVideos => 'ဆက်စပ်ဗီဒီယိုများ';

  @override
  String get communityVideoInspiredTitle => 'အကျိုးပြု ဗီဒီယိုများ';

  @override
  String get communityVideoInspiredBody => 'ကျွန်ုပ်တို့၏ လူ့မှု့အသိုင်းအဝိုင်းတွင် အကျိုးပြုစေသော အကြောင်းအရာများကို ရှာဖွေပါ။';

  @override
  String get communityVideoInspiredVideos => 'အကျိုးပြု ဗီဒီယိုများ';

  @override
  String get communityVideoVideoDetail => 'ဗီဒီယိုအသေးစိတ်';

  @override
  String get communityVideoDiscoveryExtraordinary => 'ကျွန်ုပ်တို့၏ လူ့မှု့အသိုင်းအဝိုင်းတွင် အကျိုးပြုစေသော အကြောင်းအရာများကို ရှာဖွေပါ။';

  @override
  String get communityVideoNoVideoFound => 'ဗီဒီယို မရှိပါ';

  @override
  String get communityVideoSearchForKeyword => 'စာရိုက် ရှာပါ';

  @override
  String get communityVideoSearch => 'ရှာပါ';

  @override
  String get chatGPTWelcomeTo => 'MTP AI Bot မှ';

  @override
  String get chatGPTMTPAIBot => 'ကြိုဆိုပါ၏။';

  @override
  String get chatGPTTypeMessage => 'စာရိုက်ပါ';

  @override
  String get userGuide => 'အသုံးပြုမှုလမ်းညွှန်';

  @override
  String get learnMore => 'ပိုမိုလေ့လာရန်';

  @override
  String get howToUseMTPApplication => ' MTP Application အသုံးပြုမှုလမ်းညွှန်';

  @override
  String get howOfflineFeatureWorks => 'Offline Features  အသုံးပြုမှုလမ်းညွှန်';

  @override
  String updateversionAvailable(String versionCode) {
    return 'ဗားရှင်းအသစ် $versionCode ကို ရနိုင်ပါပြီ။ ဆက်လုပ်ရန် ကျေးဇူးပြု၍ အပ်ဒိတ်လုပ်ပါ။';
  }

  @override
  String get updateTitle => 'အပ်ဒိတ် ရနိုင်သည်။';

  @override
  String get btnUpdate => 'အပ်ဒိတ်';

  @override
  String get versionalreadyupdated => 'ဗားရှင်းအသစ်ကို အပ်ဒိတ်လုပ်ပြီးပြီ။';

  @override
  String get alert => 'သတိပေးချက်';

  @override
  String get checkVersion => 'ဗားရှင်းကို စစ်ဆေးပါ။';

  @override
  String get ongoing => 'လုပ်ဆောင်ဆဲ';

  @override
  String get completed => 'ပြီးသွားပြီ';

  @override
  String get labelShares => 'မျှဝေ';

  @override
  String get failloadOfflinecontent => 'တင်လို့မရပါ';

  @override
  String get failloadVideo => 'တင်လို့မရပါ';

  @override
  String get failloadPDF => 'တင်လို့မရပါ';

  @override
  String get noQuestions => 'မေးခွန်းများမရှိပါ';

  @override
  String get txtReply => 'ပြန်ဖြေပါ';

  @override
  String get txtSelected => 'ရွေးချယ်ထားသော';
}

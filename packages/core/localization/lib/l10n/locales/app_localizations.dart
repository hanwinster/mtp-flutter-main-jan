import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_my.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'locales/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('my')
  ];

  /// Application Name
  ///
  /// In en, this message translates to:
  /// **'MTP'**
  String get appName;

  /// No description provided for @appFullName.
  ///
  /// In en, this message translates to:
  /// **'Myanmar Teacher Platform'**
  String get appFullName;

  /// No description provided for @navTitleHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navTitleHome;

  /// No description provided for @navTitleMyCourses.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get navTitleMyCourses;

  /// No description provided for @navTitleGroup.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get navTitleGroup;

  /// No description provided for @navTitleBlog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get navTitleBlog;

  /// No description provided for @navTitleLibrary.
  ///
  /// In en, this message translates to:
  /// **'E-library'**
  String get navTitleLibrary;

  /// No description provided for @buttonTextLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get buttonTextLogin;

  /// No description provided for @buttonTextRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get buttonTextRetry;

  /// No description provided for @labelDoubleTapToBack.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get labelDoubleTapToBack;

  /// No description provided for @buttonTextTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get buttonTextTakePhoto;

  /// No description provided for @buttonTextChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get buttonTextChooseFromGallery;

  /// No description provided for @buttonTextTakeMorePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take More Photo'**
  String get buttonTextTakeMorePhoto;

  /// No description provided for @errorNoImage.
  ///
  /// In en, this message translates to:
  /// **'No Image'**
  String get errorNoImage;

  /// No description provided for @errorFormFieldRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get errorFormFieldRequired;

  /// No description provided for @errorFormFieldInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get errorFormFieldInvalid;

  /// No description provided for @errorFormFieldPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password should be at least 8 digits.'**
  String get errorFormFieldPasswordLength;

  /// No description provided for @errorFormFieldPasswordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errorFormFieldPasswordsDoNotMatch;

  /// No description provided for @errorNoInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get errorNoInternetConnection;

  /// No description provided for @errorNoInternetConnectionDescription.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get errorNoInternetConnectionDescription;

  /// No description provided for @errorNoInternetConnectionWithInstruction.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection. Please check your internet connection and try again.'**
  String get errorNoInternetConnectionWithInstruction;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong. Please try again later.'**
  String get errorUnknown;

  /// No description provided for @errorSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired! Please login again.'**
  String get errorSessionExpired;

  /// No description provided for @labelSeparator.
  ///
  /// In en, this message translates to:
  /// **','**
  String get labelSeparator;

  /// No description provided for @labelNetworkStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get labelNetworkStatusOnline;

  /// No description provided for @labelNetworkStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get labelNetworkStatusOffline;

  /// No description provided for @accountTypeLabelLearner.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get accountTypeLabelLearner;

  /// No description provided for @accountTypeLabelTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get accountTypeLabelTeacher;

  /// No description provided for @userTypeLabelIndependentLearner.
  ///
  /// In en, this message translates to:
  /// **'Independent Learner'**
  String get userTypeLabelIndependentLearner;

  /// No description provided for @userTypeLabelJournalist.
  ///
  /// In en, this message translates to:
  /// **'Journalist'**
  String get userTypeLabelJournalist;

  /// No description provided for @userTypeLabelStudentTeacher.
  ///
  /// In en, this message translates to:
  /// **'Student Teacher'**
  String get userTypeLabelStudentTeacher;

  /// No description provided for @userTypeLabelIndependentTeacher.
  ///
  /// In en, this message translates to:
  /// **'Independent Teacher'**
  String get userTypeLabelIndependentTeacher;

  /// No description provided for @userTypeLabelAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get userTypeLabelAdmin;

  /// No description provided for @userTypeLabelManager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get userTypeLabelManager;

  /// No description provided for @userTypeLabelTeacherEducator.
  ///
  /// In en, this message translates to:
  /// **'Teacher Educator'**
  String get userTypeLabelTeacherEducator;

  /// No description provided for @userTypeLabelGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get userTypeLabelGuest;

  /// No description provided for @otpChannelLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get otpChannelLabelEmail;

  /// No description provided for @otpChannelLabelSms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get otpChannelLabelSms;

  /// No description provided for @genderLabelMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderLabelMale;

  /// No description provided for @genderLabelFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderLabelFemale;

  /// No description provided for @genderLabelOther.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get genderLabelOther;

  /// No description provided for @durationUnitSecond.
  ///
  /// In en, this message translates to:
  /// **'{second, plural, =0{0 second} =1{1 second} other{{second} seconds}}'**
  String durationUnitSecond(num second);

  /// No description provided for @durationUnitMinute.
  ///
  /// In en, this message translates to:
  /// **'{minute, plural, =0{0 minute} =1{1 minute} other{{minute} minutes}}'**
  String durationUnitMinute(num minute);

  /// No description provided for @durationUnitHour.
  ///
  /// In en, this message translates to:
  /// **'{hour, plural, =0{0 hour} =1{1 hour} other{{hour} hours}}'**
  String durationUnitHour(num hour);

  /// No description provided for @durationUnitDay.
  ///
  /// In en, this message translates to:
  /// **'{day, plural, =0{0 day} =1{1 day} other{{day} days}}'**
  String durationUnitDay(num day);

  /// No description provided for @durationUnitWeek.
  ///
  /// In en, this message translates to:
  /// **'{week, plural, =0{0 week} =1{1 week} other{{week} weeks}}'**
  String durationUnitWeek(num week);

  /// No description provided for @durationUnitMonth.
  ///
  /// In en, this message translates to:
  /// **'{month, plural, =0{0 month} =1{1 month} other{{month} months}}'**
  String durationUnitMonth(num month);

  /// No description provided for @durationUnitYear.
  ///
  /// In en, this message translates to:
  /// **'{year, plural, =0{0 year} =1{1 year} other{{year} years}}'**
  String durationUnitYear(num year);

  /// No description provided for @postLabelCommentCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 Comment} =1{1 Comment} other{{count} Comments}}'**
  String postLabelCommentCount(num count);

  /// No description provided for @postLabelReactionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 Like} =1{1 Like} other{{count} Likes}}'**
  String postLabelReactionCount(num count);

  /// No description provided for @postLabelShare.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 Share} =1{1 Share} other{{count} Shares}}'**
  String postLabelShare(num count);

  /// No description provided for @labelAppVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String labelAppVersion(String version);

  /// No description provided for @labelCopyright.
  ///
  /// In en, this message translates to:
  /// **'Copyright © 2025  Myanmar Teacher Platform. All Rights Reserved'**
  String get labelCopyright;

  /// No description provided for @drawerHeaderLabelGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get drawerHeaderLabelGuest;

  /// No description provided for @drawerHeaderButtonTextLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get drawerHeaderButtonTextLogin;

  /// No description provided for @drawerItemLabelLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get drawerItemLabelLanguage;

  /// No description provided for @drawerItemLabelAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get drawerItemLabelAboutUs;

  /// No description provided for @drawerItemLabelTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms And Conditions'**
  String get drawerItemLabelTermsAndConditions;

  /// No description provided for @drawerItemLabelPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get drawerItemLabelPrivacyPolicy;

  /// No description provided for @drawerItemLabelUserManuals.
  ///
  /// In en, this message translates to:
  /// **'User Manuals'**
  String get drawerItemLabelUserManuals;

  /// No description provided for @drawerItemLabelFrequentlyAskedQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get drawerItemLabelFrequentlyAskedQuestions;

  /// No description provided for @drawerItemLabelContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get drawerItemLabelContactUs;

  /// No description provided for @drawerItemLabelLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get drawerItemLabelLogOut;

  /// No description provided for @drawerItemLabelFaq.
  ///
  /// In en, this message translates to:
  /// **'Faq'**
  String get drawerItemLabelFaq;

  /// No description provided for @loginLabelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Login To Your Account'**
  String get loginLabelSubtitle;

  /// No description provided for @loginLabelUsername.
  ///
  /// In en, this message translates to:
  /// **'Username or Email'**
  String get loginLabelUsername;

  /// No description provided for @loginLabelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginLabelPassword;

  /// No description provided for @loginButtonTextForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginButtonTextForgotPassword;

  /// No description provided for @loginButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonTextSubmit;

  /// No description provided for @loginButtonTextLoggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging in ...'**
  String get loginButtonTextLoggingIn;

  /// No description provided for @loginLabelNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet?'**
  String get loginLabelNewAccount;

  /// No description provided for @loginButtonTextCreateNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get loginButtonTextCreateNewAccount;

  /// No description provided for @registerLabelSubtitleFillUserDetails.
  ///
  /// In en, this message translates to:
  /// **'Fill User Details'**
  String get registerLabelSubtitleFillUserDetails;

  /// No description provided for @registerLabelSubtitleRegister.
  ///
  /// In en, this message translates to:
  /// **'Register Your Account'**
  String get registerLabelSubtitleRegister;

  /// No description provided for @registerLabelMemberLogin.
  ///
  /// In en, this message translates to:
  /// **'Already a member?'**
  String get registerLabelMemberLogin;

  /// No description provided for @registerLabelUserType.
  ///
  /// In en, this message translates to:
  /// **'User Type *'**
  String get registerLabelUserType;

  /// No description provided for @registerLabelAccountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type *'**
  String get registerLabelAccountType;

  /// No description provided for @registerLabelFillInformation.
  ///
  /// In en, this message translates to:
  /// **'Fill Information'**
  String get registerLabelFillInformation;

  /// No description provided for @registerLabelOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get registerLabelOrganization;

  /// No description provided for @registerLabelAffiliation.
  ///
  /// In en, this message translates to:
  /// **'Affiliation'**
  String get registerLabelAffiliation;

  /// No description provided for @registerLabelPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get registerLabelPosition;

  /// No description provided for @registerLabelCollege.
  ///
  /// In en, this message translates to:
  /// **'Select College'**
  String get registerLabelCollege;

  /// No description provided for @registerLabelYearOfStudyingTraining.
  ///
  /// In en, this message translates to:
  /// **'Select year of studying/training'**
  String get registerLabelYearOfStudyingTraining;

  /// No description provided for @registerLabelGender.
  ///
  /// In en, this message translates to:
  /// **'Gender *'**
  String get registerLabelGender;

  /// No description provided for @registerButtonTextPrev.
  ///
  /// In en, this message translates to:
  /// **'Prev'**
  String get registerButtonTextPrev;

  /// No description provided for @registerButtonTextNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get registerButtonTextNext;

  /// No description provided for @registerButtonTextRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButtonTextRegister;

  /// No description provided for @registerButtonTextOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get registerButtonTextOK;

  /// No description provided for @registerLabelUsername.
  ///
  /// In en, this message translates to:
  /// **'Username *'**
  String get registerLabelUsername;

  /// No description provided for @registerLabelUsernameHelper.
  ///
  /// In en, this message translates to:
  /// **'Please provide the name using only English characters.\nPlease use character, number, dash and underscore only and do not include spaces.\n\n'**
  String get registerLabelUsernameHelper;

  /// No description provided for @registerLabelUsernameHelperExampleLabel.
  ///
  /// In en, this message translates to:
  /// **'e.g.,'**
  String get registerLabelUsernameHelperExampleLabel;

  /// No description provided for @registerLabelUsernameHelperExampleValue.
  ///
  /// In en, this message translates to:
  /// **'allen-brown, allen_brown, allen_Brown, allenbrown23'**
  String get registerLabelUsernameHelperExampleValue;

  /// No description provided for @registerLabelUsernameErrorLength.
  ///
  /// In en, this message translates to:
  /// **'The username must be at least 5 characters.'**
  String get registerLabelUsernameErrorLength;

  /// No description provided for @registerLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get registerLabelName;

  /// No description provided for @registerLabelNameErrorLength.
  ///
  /// In en, this message translates to:
  /// **'The name must be at least 5 characters.'**
  String get registerLabelNameErrorLength;

  /// No description provided for @registerLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address *'**
  String get registerLabelEmail;

  /// No description provided for @registerLabelEmailHelper.
  ///
  /// In en, this message translates to:
  /// **'Please enter your valid email.'**
  String get registerLabelEmailHelper;

  /// No description provided for @registerLabelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password *'**
  String get registerLabelPassword;

  /// No description provided for @registerLabelPasswordHelper.
  ///
  /// In en, this message translates to:
  /// **'The password must be at least 8 characters.'**
  String get registerLabelPasswordHelper;

  /// No description provided for @registerLabelConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password *'**
  String get registerLabelConfirmPassword;

  /// No description provided for @registerLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get registerLabelPhone;

  /// No description provided for @registerLabelPhoneHelper.
  ///
  /// In en, this message translates to:
  /// **'Please select your country and enter your mobile number (Number in English only).e.g., 0900000000 Or 900000000'**
  String get registerLabelPhoneHelper;

  /// No description provided for @registerLabelOtpChannel.
  ///
  /// In en, this message translates to:
  /// **'OTP Receiving Channel'**
  String get registerLabelOtpChannel;

  /// No description provided for @registerLabelProfileImage.
  ///
  /// In en, this message translates to:
  /// **'Profile Image'**
  String get registerLabelProfileImage;

  /// No description provided for @otpVerificaitonLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerificaitonLabelTitle;

  /// No description provided for @otpVerificaitonLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP code, we just sent an OTP to your email.\n{email}'**
  String otpVerificaitonLabelDescription(String email);

  /// No description provided for @otpVerificationButtonTextVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get otpVerificationButtonTextVerify;

  /// No description provided for @otpVerificationLabelDidNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get otpVerificationLabelDidNotReceiveCode;

  /// No description provided for @otpVerificationButtonTextResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get otpVerificationButtonTextResend;

  /// No description provided for @otpVerifiedLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to Go!'**
  String get otpVerifiedLabelTitle;

  /// No description provided for @otpVerifiedButtonTextLogin.
  ///
  /// In en, this message translates to:
  /// **'Please Login Again'**
  String get otpVerifiedButtonTextLogin;

  /// No description provided for @forgotPasswordLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get forgotPasswordLabelTitle;

  /// No description provided for @forgotPasswordLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forgotPasswordLabelEmail;

  /// No description provided for @forgotPasswordLabelHelper.
  ///
  /// In en, this message translates to:
  /// **'We will sent OTP to your email for reset password process.'**
  String get forgotPasswordLabelHelper;

  /// No description provided for @forgotPasswordLabelSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Your account password has been updated successfully.'**
  String get forgotPasswordLabelSuccessful;

  /// No description provided for @forgotPasswordLabelNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get forgotPasswordLabelNewPassword;

  /// No description provided for @forgotPasswordLabelConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get forgotPasswordLabelConfirmPassword;

  /// No description provided for @forgotPasswordButtonTextResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get forgotPasswordButtonTextResetPassword;

  /// No description provided for @forgotPasswordButtonTextContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get forgotPasswordButtonTextContinue;

  /// No description provided for @changePasswordLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordLabelTitle;

  /// No description provided for @changePasswordLabelInstruction.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different from the previous one.'**
  String get changePasswordLabelInstruction;

  /// No description provided for @changePasswordLabelCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get changePasswordLabelCurrentPassword;

  /// No description provided for @changePasswordLabelNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get changePasswordLabelNewPassword;

  /// No description provided for @changePasswordLabelConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get changePasswordLabelConfirmPassword;

  /// No description provided for @changePasswordLabelPasswordMismatchError.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t match with new password'**
  String get changePasswordLabelPasswordMismatchError;

  /// No description provided for @changePasswordButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get changePasswordButtonTextSubmit;

  /// No description provided for @changePasswordSuccessLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to Go!'**
  String get changePasswordSuccessLabelTitle;

  /// No description provided for @changePasswordSuccessButtonTextLogin.
  ///
  /// In en, this message translates to:
  /// **'Please Login Again'**
  String get changePasswordSuccessButtonTextLogin;

  /// No description provided for @profileButtonTextViewProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileButtonTextViewProfile;

  /// No description provided for @profileLabelOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get profileLabelOrganization;

  /// No description provided for @profileLabelAffiliation.
  ///
  /// In en, this message translates to:
  /// **'Affiliation *'**
  String get profileLabelAffiliation;

  /// No description provided for @profileLabelPosition.
  ///
  /// In en, this message translates to:
  /// **'Position *'**
  String get profileLabelPosition;

  /// No description provided for @profileLabelCollege.
  ///
  /// In en, this message translates to:
  /// **'College'**
  String get profileLabelCollege;

  /// No description provided for @profileLabelYearOfStudyingTraining.
  ///
  /// In en, this message translates to:
  /// **'Year of studying/training'**
  String get profileLabelYearOfStudyingTraining;

  /// No description provided for @profileLabelGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profileLabelGender;

  /// No description provided for @profileLabelGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get profileLabelGenderMale;

  /// No description provided for @profileLabelGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get profileLabelGenderFemale;

  /// No description provided for @profileLabelGenderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get profileLabelGenderOther;

  /// No description provided for @profileLabelUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get profileLabelUsername;

  /// No description provided for @profileLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileLabelEmail;

  /// No description provided for @profileLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profileLabelPhone;

  /// No description provided for @profileLabelOtpChannel.
  ///
  /// In en, this message translates to:
  /// **'OTP Receiving Channel'**
  String get profileLabelOtpChannel;

  /// No description provided for @profileLabelOtpChannelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email (Default)'**
  String get profileLabelOtpChannelEmail;

  /// No description provided for @profileLabelOtpChannelSms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get profileLabelOtpChannelSms;

  /// No description provided for @profileButtonTextEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileButtonTextEditProfile;

  /// No description provided for @profilePostSomething.
  ///
  /// In en, this message translates to:
  /// **'Post Something ...'**
  String get profilePostSomething;

  /// No description provided for @editProfileLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileLabelTitle;

  /// No description provided for @editProfileButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editProfileButtonTextSubmit;

  /// No description provided for @editProfileLabelUserType.
  ///
  /// In en, this message translates to:
  /// **'User Type'**
  String get editProfileLabelUserType;

  /// No description provided for @editProfileLabelCollege.
  ///
  /// In en, this message translates to:
  /// **'College'**
  String get editProfileLabelCollege;

  /// No description provided for @editProfileLabelYearOfStudyingTraining.
  ///
  /// In en, this message translates to:
  /// **'Year of studying/training'**
  String get editProfileLabelYearOfStudyingTraining;

  /// No description provided for @editProfileLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get editProfileLabelPhone;

  /// No description provided for @editProfileLabelOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get editProfileLabelOrganization;

  /// No description provided for @editProfileLabelAffiliation.
  ///
  /// In en, this message translates to:
  /// **'Affiliation'**
  String get editProfileLabelAffiliation;

  /// No description provided for @editProfileLabelPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get editProfileLabelPosition;

  /// No description provided for @editProfileLabelUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get editProfileLabelUsername;

  /// No description provided for @editProfileLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get editProfileLabelName;

  /// No description provided for @editProfileLabelOtpChannel.
  ///
  /// In en, this message translates to:
  /// **'OTP Receiving Channel'**
  String get editProfileLabelOtpChannel;

  /// No description provided for @editProfileLabelGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get editProfileLabelGender;

  /// No description provided for @editProfileLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editProfileLabelEmail;

  /// No description provided for @subscriptionButtonTextSubscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscriptionButtonTextSubscribe;

  /// No description provided for @subscriptionButtonTextUnsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get subscriptionButtonTextUnsubscribe;

  /// No description provided for @subscriptionDialogLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'You need to Login before Subscribing'**
  String get subscriptionDialogLoginTitle;

  /// No description provided for @subscriptionDialogLoginMessage.
  ///
  /// In en, this message translates to:
  /// **'Please login to your account to access to the feature'**
  String get subscriptionDialogLoginMessage;

  /// No description provided for @subscriptionDialogLoginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get subscriptionDialogLoginButton;

  /// No description provided for @subscriptionLabelAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Term & Conditions'**
  String get subscriptionLabelAgree;

  /// No description provided for @subscriptionButtonTextContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get subscriptionButtonTextContinue;

  /// No description provided for @helpLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpLabelTitle;

  /// No description provided for @helpLabelAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get helpLabelAboutUs;

  /// No description provided for @helpLabelTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms And Conditions'**
  String get helpLabelTermsAndConditions;

  /// No description provided for @helpLabelPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get helpLabelPrivacyPolicy;

  /// No description provided for @helpLabelUserManuals.
  ///
  /// In en, this message translates to:
  /// **'User Manuals'**
  String get helpLabelUserManuals;

  /// No description provided for @helpLabelFrequentlyAskedQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get helpLabelFrequentlyAskedQuestions;

  /// No description provided for @helpLabelContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get helpLabelContactUs;

  /// No description provided for @contactUsFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Let Us Reach Out to You'**
  String get contactUsFormTitle;

  /// No description provided for @contactUsLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get contactUsLabelName;

  /// No description provided for @contactUsLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email *'**
  String get contactUsLabelEmail;

  /// No description provided for @contactUsLabelPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get contactUsLabelPhoneNumber;

  /// No description provided for @contactUsLabelSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject *'**
  String get contactUsLabelSubject;

  /// No description provided for @contactUsLabelOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization/Company'**
  String get contactUsLabelOrganization;

  /// No description provided for @contactUsLabelRegion.
  ///
  /// In en, this message translates to:
  /// **'Regions/States'**
  String get contactUsLabelRegion;

  /// No description provided for @contactUsLabelMessage.
  ///
  /// In en, this message translates to:
  /// **'Message *'**
  String get contactUsLabelMessage;

  /// No description provided for @contactUsButtonTextSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get contactUsButtonTextSend;

  /// No description provided for @settingsLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsLabelTitle;

  /// No description provided for @settingsLabelChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLabelChangeLanguage;

  /// No description provided for @settingsLabelAccountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get settingsLabelAccountSettings;

  /// No description provided for @settingsLabelChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsLabelChangePassword;

  /// No description provided for @settingsLabelDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsLabelDeleteAccount;

  /// No description provided for @settingsButtonTextLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsButtonTextLogout;

  /// No description provided for @settingsConfirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Please be aware that all your taken courses, ratings & reviews, chat messages in discussions and user information will be removed after deleting the account and it cannot be reversible!'**
  String get settingsConfirmDeleteMessage;

  /// No description provided for @settingsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsCancel;

  /// No description provided for @homeLabelOfflineExplanation.
  ///
  /// In en, this message translates to:
  /// **'How Offline Feature Works'**
  String get homeLabelOfflineExplanation;

  /// No description provided for @homeLabelOfflineCourses.
  ///
  /// In en, this message translates to:
  /// **'Go to Offline Courses'**
  String get homeLabelOfflineCourses;

  /// No description provided for @homeLabelCourseCategories.
  ///
  /// In en, this message translates to:
  /// **'Course Categories'**
  String get homeLabelCourseCategories;

  /// No description provided for @homeLabelCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get homeLabelCourses;

  /// No description provided for @homeButtonTextSeeAllCourses.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get homeButtonTextSeeAllCourses;

  /// No description provided for @homeLabelNoCourses.
  ///
  /// In en, this message translates to:
  /// **'No courses found'**
  String get homeLabelNoCourses;

  /// No description provided for @offlineCoursesTitle.
  ///
  /// In en, this message translates to:
  /// **'Downloaded Courses'**
  String get offlineCoursesTitle;

  /// No description provided for @offlineCoursesLabelEmptyList.
  ///
  /// In en, this message translates to:
  /// **'To use offline, download the course(s) first.'**
  String get offlineCoursesLabelEmptyList;

  /// No description provided for @offlineCoursesButtonTextStartLearning.
  ///
  /// In en, this message translates to:
  /// **'Start Offline Learning'**
  String get offlineCoursesButtonTextStartLearning;

  /// No description provided for @courseLearningModeLabelOfflineTitle.
  ///
  /// In en, this message translates to:
  /// **'Offline Learning Mode'**
  String get courseLearningModeLabelOfflineTitle;

  /// No description provided for @courseLearningModeLabelOfflineMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re currently in offline mode. Progress won\'t be saved.'**
  String get courseLearningModeLabelOfflineMessage;

  /// No description provided for @courseLearningModeButtonTextSwitchToOnline.
  ///
  /// In en, this message translates to:
  /// **'Switch to Online'**
  String get courseLearningModeButtonTextSwitchToOnline;

  /// No description provided for @courseLearningModeButtonTextStayOffline.
  ///
  /// In en, this message translates to:
  /// **'Stay Offline'**
  String get courseLearningModeButtonTextStayOffline;

  /// No description provided for @blogLabelSubtitleLatestPosts.
  ///
  /// In en, this message translates to:
  /// **'Latest Articles'**
  String get blogLabelSubtitleLatestPosts;

  /// No description provided for @blogLabelSubtitleRecommendedPosts.
  ///
  /// In en, this message translates to:
  /// **'Recommended Articles'**
  String get blogLabelSubtitleRecommendedPosts;

  /// No description provided for @blogLabelPostsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no articles in this category. We\'re always updating our content, so please check back soon!'**
  String get blogLabelPostsNotFound;

  /// No description provided for @blogLableGuestUserMessage.
  ///
  /// In en, this message translates to:
  /// **'Please login to read the blogs.'**
  String get blogLableGuestUserMessage;

  /// No description provided for @blogButtonTextLogin.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get blogButtonTextLogin;

  /// No description provided for @postLabelSubtitleTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get postLabelSubtitleTags;

  /// No description provided for @postLabelSubtitleRecommendedPosts.
  ///
  /// In en, this message translates to:
  /// **'Recommended Articles'**
  String get postLabelSubtitleRecommendedPosts;

  /// No description provided for @postLabelSubtitleCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get postLabelSubtitleCategories;

  /// No description provided for @postLabelSubtitleComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get postLabelSubtitleComments;

  /// No description provided for @postLabelMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member Since: {date}'**
  String postLabelMemberSince(String date);

  /// No description provided for @postLabelPostedOn.
  ///
  /// In en, this message translates to:
  /// **'Posted On: {date}'**
  String postLabelPostedOn(String date);

  /// No description provided for @postLabelDuration.
  ///
  /// In en, this message translates to:
  /// **'{duration} read'**
  String postLabelDuration(String duration);

  /// No description provided for @postLabelDurationUnitSecond.
  ///
  /// In en, this message translates to:
  /// **'{second, plural, =0{0 second} =1{1 second} other{{second} seconds}}'**
  String postLabelDurationUnitSecond(num second);

  /// No description provided for @postLabelDurationUnitMinute.
  ///
  /// In en, this message translates to:
  /// **'{minute, plural, =0{0 minute} =1{1 minute} other{{minute} minutes}}'**
  String postLabelDurationUnitMinute(num minute);

  /// No description provided for @postLabelDurationUnitHour.
  ///
  /// In en, this message translates to:
  /// **'{hour, plural, =0{0 hour} =1{1 hour} other{{hour} hours}}'**
  String postLabelDurationUnitHour(num hour);

  /// No description provided for @postLabelDurationUnitDay.
  ///
  /// In en, this message translates to:
  /// **'{day, plural, =0{0 day} =1{1 day} other{{day} days}}'**
  String postLabelDurationUnitDay(num day);

  /// No description provided for @postLabelDurationUnitWeek.
  ///
  /// In en, this message translates to:
  /// **'{week, plural, =0{0 week} =1{1 week} other{{week} weeks}}'**
  String postLabelDurationUnitWeek(num week);

  /// No description provided for @postLabelDurationUnitMonth.
  ///
  /// In en, this message translates to:
  /// **'{month, plural, =0{0 month} =1{1 month} other{{month} months}}'**
  String postLabelDurationUnitMonth(num month);

  /// No description provided for @postLabelDurationUnitYear.
  ///
  /// In en, this message translates to:
  /// **'{year, plural, =0{0 year} =1{1 year} other{{year} years}}'**
  String postLabelDurationUnitYear(num year);

  /// No description provided for @postButtonTextTakeQuiz.
  ///
  /// In en, this message translates to:
  /// **'Take quiz to mark as read'**
  String get postButtonTextTakeQuiz;

  /// No description provided for @postLabelReadAndTookQuiz.
  ///
  /// In en, this message translates to:
  /// **'Successfully took quiz and already read'**
  String get postLabelReadAndTookQuiz;

  /// No description provided for @postButtonTextMarkAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark As Read'**
  String get postButtonTextMarkAsRead;

  /// No description provided for @postLabelAlreadyRead.
  ///
  /// In en, this message translates to:
  /// **'Already read'**
  String get postLabelAlreadyRead;

  /// No description provided for @temp3.
  ///
  /// In en, this message translates to:
  /// **'No comments for now!'**
  String get temp3;

  /// No description provided for @postLabelReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get postLabelReadMore;

  /// No description provided for @postLabelReadLess.
  ///
  /// In en, this message translates to:
  /// **'Read Less'**
  String get postLabelReadLess;

  /// No description provided for @postLabelPlaceholderComment.
  ///
  /// In en, this message translates to:
  /// **'Write comment ...'**
  String get postLabelPlaceholderComment;

  /// No description provided for @postLabelAddPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get postLabelAddPhoto;

  /// No description provided for @postLabelAddVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get postLabelAddVideo;

  /// No description provided for @postButtonTextSubmitComment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get postButtonTextSubmitComment;

  /// No description provided for @postButtonTextEditComment.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get postButtonTextEditComment;

  /// No description provided for @postButtonTextDeleteComment.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get postButtonTextDeleteComment;

  /// No description provided for @blogPostQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'Please take the blog-related quiz'**
  String get blogPostQuizTitle;

  /// No description provided for @blogPostQuizLabelFormattedQuestionCount.
  ///
  /// In en, this message translates to:
  /// **'Question {current}/{total}'**
  String blogPostQuizLabelFormattedQuestionCount(num current, num total);

  /// No description provided for @blogPostQuizLabelFormattedOverallScore.
  ///
  /// In en, this message translates to:
  /// **'Overall Score : {score}'**
  String blogPostQuizLabelFormattedOverallScore(num score);

  /// No description provided for @blogPostQuizLabelTrueFalseInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please check the correct box.'**
  String get blogPostQuizLabelTrueFalseInstruction;

  /// No description provided for @blogPostQuizLabelTrueFalseOptionTrue.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get blogPostQuizLabelTrueFalseOptionTrue;

  /// No description provided for @blogPostQuizLabelTrueFalseOptionFalse.
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get blogPostQuizLabelTrueFalseOptionFalse;

  /// No description provided for @blogPostQuizLabelTrueFalseOptionNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get blogPostQuizLabelTrueFalseOptionNone;

  /// No description provided for @blogPostQuizLabelMachingInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please choose and match'**
  String get blogPostQuizLabelMachingInstruction;

  /// No description provided for @blogPostQuizLabelMultipleChoiceInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please check the correct boxes.'**
  String get blogPostQuizLabelMultipleChoiceInstruction;

  /// No description provided for @blogPostQuizLabelRearrangeChoiceInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please drag and drop the items into the correct order.'**
  String get blogPostQuizLabelRearrangeChoiceInstruction;

  /// No description provided for @blogPostQuizButtonTextNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get blogPostQuizButtonTextNext;

  /// No description provided for @blogPostQuizButtonTextPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get blogPostQuizButtonTextPrevious;

  /// No description provided for @blogPostQuizButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get blogPostQuizButtonTextSubmit;

  /// No description provided for @blogQuizCompletionLabelPass.
  ///
  /// In en, this message translates to:
  /// **'Greate Job'**
  String get blogQuizCompletionLabelPass;

  /// No description provided for @blogQuizCompletionLabelNotPass.
  ///
  /// In en, this message translates to:
  /// **'Nice Try'**
  String get blogQuizCompletionLabelNotPass;

  /// No description provided for @blogQuizCompletionLabelScore.
  ///
  /// In en, this message translates to:
  /// **'Here is Your Score'**
  String get blogQuizCompletionLabelScore;

  /// No description provided for @blogQuizCompletionLabelQuizType.
  ///
  /// In en, this message translates to:
  /// **'General Knowledge Quiz'**
  String get blogQuizCompletionLabelQuizType;

  /// No description provided for @blogQuizButtonTextSumitAnswer.
  ///
  /// In en, this message translates to:
  /// **'Submit Answer'**
  String get blogQuizButtonTextSumitAnswer;

  /// No description provided for @blogQuizCompletionButtonTextRetakeQuiz.
  ///
  /// In en, this message translates to:
  /// **'Retake Quiz'**
  String get blogQuizCompletionButtonTextRetakeQuiz;

  /// No description provided for @blogQuizCompletionButtonTextContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get blogQuizCompletionButtonTextContinue;

  /// No description provided for @notiButtonTextViewMore.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get notiButtonTextViewMore;

  /// No description provided for @notiLabelNotiListTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notiLabelNotiListTitle;

  /// No description provided for @notificationList.
  ///
  /// In en, this message translates to:
  /// **'Notification List'**
  String get notificationList;

  /// No description provided for @notiLabelUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notiLabelUnread;

  /// No description provided for @notiLabelRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get notiLabelRead;

  /// No description provided for @notiLabelNoUnread.
  ///
  /// In en, this message translates to:
  /// **'There are no unread notifications.'**
  String get notiLabelNoUnread;

  /// No description provided for @eLibraryHintSearch.
  ///
  /// In en, this message translates to:
  /// **'Search Anything'**
  String get eLibraryHintSearch;

  /// No description provided for @temp7.
  ///
  /// In en, this message translates to:
  /// **'Load More'**
  String get temp7;

  /// No description provided for @eLibraryClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get eLibraryClearAll;

  /// No description provided for @eLibraryChooseSubject.
  ///
  /// In en, this message translates to:
  /// **'Choose Subject'**
  String get eLibraryChooseSubject;

  /// No description provided for @eLibraryChooseResourceFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose Resource Formats'**
  String get eLibraryChooseResourceFormat;

  /// No description provided for @eLibraryDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get eLibraryDownloads;

  /// No description provided for @eLibraryRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get eLibraryRating;

  /// No description provided for @eLibraryTotalPages.
  ///
  /// In en, this message translates to:
  /// **'Total Pages'**
  String get eLibraryTotalPages;

  /// No description provided for @eLibraryOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get eLibraryOverview;

  /// No description provided for @eLibraryAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author '**
  String get eLibraryAuthor;

  /// No description provided for @eLibraryPublisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get eLibraryPublisher;

  /// No description provided for @eLibraryStrand.
  ///
  /// In en, this message translates to:
  /// **'Strand'**
  String get eLibraryStrand;

  /// No description provided for @eLibrarySubStrand.
  ///
  /// In en, this message translates to:
  /// **'Sub Strand'**
  String get eLibrarySubStrand;

  /// No description provided for @eLibraryLesson.
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get eLibraryLesson;

  /// No description provided for @eLibraryPublishingYear.
  ///
  /// In en, this message translates to:
  /// **'Publishing year'**
  String get eLibraryPublishingYear;

  /// No description provided for @eLibraryUrl.
  ///
  /// In en, this message translates to:
  /// **'Url'**
  String get eLibraryUrl;

  /// No description provided for @eLibraryAdditionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get eLibraryAdditionalInformation;

  /// No description provided for @eLibraryTotalPageViews.
  ///
  /// In en, this message translates to:
  /// **'Total page views'**
  String get eLibraryTotalPageViews;

  /// No description provided for @eLibraryTotalDownloads.
  ///
  /// In en, this message translates to:
  /// **'Total downloads'**
  String get eLibraryTotalDownloads;

  /// No description provided for @eLibraryLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated'**
  String get eLibraryLastUpdated;

  /// No description provided for @eLibraryPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get eLibraryPreview;

  /// No description provided for @eLibraryDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get eLibraryDownload;

  /// No description provided for @eLibraryDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get eLibraryDownloading;

  /// No description provided for @eLibraryDownloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Download Complete '**
  String get eLibraryDownloadComplete;

  /// No description provided for @eLibraryDownloadPath.
  ///
  /// In en, this message translates to:
  /// **'Download Path: '**
  String get eLibraryDownloadPath;

  /// No description provided for @eLibraryNoResourceFound.
  ///
  /// In en, this message translates to:
  /// **'No resources found'**
  String get eLibraryNoResourceFound;

  /// No description provided for @eLibraryDownloadPathOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get eLibraryDownloadPathOpen;

  /// No description provided for @eLibraryDownloadFail.
  ///
  /// In en, this message translates to:
  /// **'Download failed. Please try again.'**
  String get eLibraryDownloadFail;

  /// No description provided for @eLibraryDownloadPercent.
  ///
  /// In en, this message translates to:
  /// **'{progress} %'**
  String eLibraryDownloadPercent(num progress);

  /// No description provided for @courseLabelIntroudction.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get courseLabelIntroudction;

  /// No description provided for @courseLabelLectures.
  ///
  /// In en, this message translates to:
  /// **'Lectures'**
  String get courseLabelLectures;

  /// No description provided for @courseLabelLecture.
  ///
  /// In en, this message translates to:
  /// **'Lecture'**
  String get courseLabelLecture;

  /// No description provided for @courseLabelLearningActivities.
  ///
  /// In en, this message translates to:
  /// **'Learning Activities'**
  String get courseLabelLearningActivities;

  /// No description provided for @courseLabelQuizzes.
  ///
  /// In en, this message translates to:
  /// **'Quizzes'**
  String get courseLabelQuizzes;

  /// No description provided for @courseLabelSummaries.
  ///
  /// In en, this message translates to:
  /// **'Summaries'**
  String get courseLabelSummaries;

  /// No description provided for @courseLabelLiveSessions.
  ///
  /// In en, this message translates to:
  /// **'Course Live Sessions/Zoom'**
  String get courseLabelLiveSessions;

  /// No description provided for @courseLabelEvaluations.
  ///
  /// In en, this message translates to:
  /// **'Evaluations'**
  String get courseLabelEvaluations;

  /// No description provided for @courseLabelAssessment.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get courseLabelAssessment;

  /// No description provided for @courseDetailsTabTitleOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get courseDetailsTabTitleOverview;

  /// No description provided for @courseDetailsTabTitleLectures.
  ///
  /// In en, this message translates to:
  /// **'Lectures'**
  String get courseDetailsTabTitleLectures;

  /// No description provided for @courseDetailsTabTitleDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Discussion '**
  String get courseDetailsTabTitleDiscussion;

  /// No description provided for @courseDetailsTabTitleReview.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get courseDetailsTabTitleReview;

  /// No description provided for @courseDetailsTabTitleRelatedResources.
  ///
  /// In en, this message translates to:
  /// **'Related Resources'**
  String get courseDetailsTabTitleRelatedResources;

  /// No description provided for @courseLabelQuestionTextInputHint.
  ///
  /// In en, this message translates to:
  /// **'Write down your answer'**
  String get courseLabelQuestionTextInputHint;

  /// No description provided for @courseLabelQuestionMatchingHint.
  ///
  /// In en, this message translates to:
  /// **'Select match'**
  String get courseLabelQuestionMatchingHint;

  /// No description provided for @courseLabelQuestionRearrangeGuide.
  ///
  /// In en, this message translates to:
  /// **'(Drag and drop for the orders.)'**
  String get courseLabelQuestionRearrangeGuide;

  /// No description provided for @courseLableQuestionAllRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please answer all questions'**
  String get courseLableQuestionAllRequiredError;

  /// No description provided for @courseLableQuestionRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get courseLableQuestionRequiredError;

  /// No description provided for @courseButtonTextNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get courseButtonTextNext;

  /// No description provided for @courseButtonTextPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get courseButtonTextPrevious;

  /// No description provided for @courseLableGuestUserMessage.
  ///
  /// In en, this message translates to:
  /// **'Please login to access your courses.'**
  String get courseLableGuestUserMessage;

  /// No description provided for @courseLableNoUserOngoingCourses.
  ///
  /// In en, this message translates to:
  /// **'No ongoing course found. Please enroll in a course first'**
  String get courseLableNoUserOngoingCourses;

  /// No description provided for @courseButtonTextExploreCourses.
  ///
  /// In en, this message translates to:
  /// **'Explore Courses'**
  String get courseButtonTextExploreCourses;

  /// No description provided for @courseLableNoUserCompletedCourses.
  ///
  /// In en, this message translates to:
  /// **'No completed course found. Please complete a course first'**
  String get courseLableNoUserCompletedCourses;

  /// No description provided for @courseButtonTextTakeCourse.
  ///
  /// In en, this message translates to:
  /// **'Take This Course'**
  String get courseButtonTextTakeCourse;

  /// No description provided for @courseButtonTextContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get courseButtonTextContinue;

  /// No description provided for @courseButtonTextStartEvaluation.
  ///
  /// In en, this message translates to:
  /// **'Start Evaluation'**
  String get courseButtonTextStartEvaluation;

  /// No description provided for @courseButtonTextGenerateCertificate.
  ///
  /// In en, this message translates to:
  /// **'Generate Certificate'**
  String get courseButtonTextGenerateCertificate;

  /// No description provided for @courseButtonTextDownloadCourse.
  ///
  /// In en, this message translates to:
  /// **'Download Course'**
  String get courseButtonTextDownloadCourse;

  /// No description provided for @courseButtonTextDownloadResources.
  ///
  /// In en, this message translates to:
  /// **'Download Course Resources'**
  String get courseButtonTextDownloadResources;

  /// No description provided for @courseLabelDownloadCourseSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Course downloaded successfully.'**
  String get courseLabelDownloadCourseSuccessfully;

  /// No description provided for @courseLabelDownloadResourcesSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Resource downloaded successfully. You can find it in downloads folder.'**
  String get courseLabelDownloadResourcesSuccessfully;

  /// No description provided for @courseLabelCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have completed this course.'**
  String get courseLabelCompletedMessage;

  /// No description provided for @courseButtonTextViewCertificate.
  ///
  /// In en, this message translates to:
  /// **'View Certificate'**
  String get courseButtonTextViewCertificate;

  /// No description provided for @courseLabelCertificateDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Certificate downloaded successfully.\nYou can view it in the downloads folder.'**
  String get courseLabelCertificateDownloaded;

  /// No description provided for @courseCompletionLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get courseCompletionLabelTitle;

  /// No description provided for @courseCompletionLabelMessage.
  ///
  /// In en, this message translates to:
  /// **'You have successfully completed the course. Great work!'**
  String get courseCompletionLabelMessage;

  /// No description provided for @courseCompletionButtonTextGoToMyCourses.
  ///
  /// In en, this message translates to:
  /// **'Go to My Courses'**
  String get courseCompletionButtonTextGoToMyCourses;

  /// No description provided for @courseDashboardLabelFormattedProgress.
  ///
  /// In en, this message translates to:
  /// **'{progress}% Completed'**
  String courseDashboardLabelFormattedProgress(num progress);

  /// No description provided for @courseDashboardLabelHalfWay.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You are half way there to complete this course!'**
  String get courseDashboardLabelHalfWay;

  /// No description provided for @courseDashboardButtonTextStartLearning.
  ///
  /// In en, this message translates to:
  /// **'Start Learning'**
  String get courseDashboardButtonTextStartLearning;

  /// No description provided for @courseDashboardButtonTextContinueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get courseDashboardButtonTextContinueLearning;

  /// No description provided for @courseDashboardLabelAssessmentInfo.
  ///
  /// In en, this message translates to:
  /// **'You can take the assessment after completing the course!'**
  String get courseDashboardLabelAssessmentInfo;

  /// No description provided for @courseDashboardLabelEvaluationInfo.
  ///
  /// In en, this message translates to:
  /// **'You can evaluate after completing assessments.'**
  String get courseDashboardLabelEvaluationInfo;

  /// No description provided for @courseExistConfirmationLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Pause Learning?'**
  String get courseExistConfirmationLabelTitle;

  /// No description provided for @courseExistConfirmationLabelMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit? Your progress will be saved, and you can resume anytime!'**
  String get courseExistConfirmationLabelMessage;

  /// No description provided for @courseExistConfirmationButtonTextStay.
  ///
  /// In en, this message translates to:
  /// **'Stay Learning'**
  String get courseExistConfirmationButtonTextStay;

  /// No description provided for @courseExistConfirmationButtonTextLeave.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get courseExistConfirmationButtonTextLeave;

  /// No description provided for @interactiveProcessButtonTextStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get interactiveProcessButtonTextStart;

  /// No description provided for @interactiveProcessLabelFormattedStep.
  ///
  /// In en, this message translates to:
  /// **'Step {step}'**
  String interactiveProcessLabelFormattedStep(num step);

  /// No description provided for @interactiveProcessButtonTextStartAgain.
  ///
  /// In en, this message translates to:
  /// **'Start again'**
  String get interactiveProcessButtonTextStartAgain;

  /// No description provided for @interactiveSortingButtonTextReplay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get interactiveSortingButtonTextReplay;

  /// No description provided for @interactiveSortingLabelFormattedScore.
  ///
  /// In en, this message translates to:
  /// **'{score}/{total} Cards Correct'**
  String interactiveSortingLabelFormattedScore(num score, num total);

  /// No description provided for @courseXApiButtonTextMarkComplete.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get courseXApiButtonTextMarkComplete;

  /// No description provided for @courseXApiLabelRequiredToComplete.
  ///
  /// In en, this message translates to:
  /// **'You still have some lessons left to complete the course. Please continue learning. '**
  String get courseXApiLabelRequiredToComplete;

  /// No description provided for @courseLabelCourseFeatures.
  ///
  /// In en, this message translates to:
  /// **'Course Features'**
  String get courseLabelCourseFeatures;

  /// No description provided for @courseLabelCourseDescription.
  ///
  /// In en, this message translates to:
  /// **'Course Description'**
  String get courseLabelCourseDescription;

  /// No description provided for @courseLabelCourseObjectives.
  ///
  /// In en, this message translates to:
  /// **'Course Objectives'**
  String get courseLabelCourseObjectives;

  /// No description provided for @courseLabelCourseLearningOutcomes.
  ///
  /// In en, this message translates to:
  /// **'Learning Outcomes'**
  String get courseLabelCourseLearningOutcomes;

  /// No description provided for @courseLabelCourseResourceLink.
  ///
  /// In en, this message translates to:
  /// **'Resource Link'**
  String get courseLabelCourseResourceLink;

  /// No description provided for @courseLabelLectureDescription.
  ///
  /// In en, this message translates to:
  /// **'Lecture Description'**
  String get courseLabelLectureDescription;

  /// No description provided for @courseQuizLabelOptionTrue.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get courseQuizLabelOptionTrue;

  /// No description provided for @courseQuizLabelOptionFalse.
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get courseQuizLabelOptionFalse;

  /// No description provided for @courseAssignmentLableSubmission.
  ///
  /// In en, this message translates to:
  /// **'Assignment Submission'**
  String get courseAssignmentLableSubmission;

  /// No description provided for @courseAssignmentButtonTextChooseFile.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get courseAssignmentButtonTextChooseFile;

  /// No description provided for @courseAssignmentButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get courseAssignmentButtonTextSubmit;

  /// No description provided for @courseAssignmentLabelSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted'**
  String get courseAssignmentLabelSubmitted;

  /// No description provided for @courseAssignmentLabelFeedbackFromInstructor.
  ///
  /// In en, this message translates to:
  /// **'Comment From Instructor'**
  String get courseAssignmentLabelFeedbackFromInstructor;

  /// No description provided for @courseAssignmentLabelNoFeedback.
  ///
  /// In en, this message translates to:
  /// **'No Comment from the instructor yet!'**
  String get courseAssignmentLabelNoFeedback;

  /// No description provided for @courseLiveSessionLabelAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get courseLiveSessionLabelAgenda;

  /// No description provided for @courseLiveSessionLabelSessionDateTime.
  ///
  /// In en, this message translates to:
  /// **'Session Date And Time'**
  String get courseLiveSessionLabelSessionDateTime;

  /// No description provided for @courseLiveSessionLabelSessionDuration.
  ///
  /// In en, this message translates to:
  /// **'Session Duration'**
  String get courseLiveSessionLabelSessionDuration;

  /// No description provided for @courseLiveSessionLabelRegistrationPeriodOver.
  ///
  /// In en, this message translates to:
  /// **'The registration period for this session is over'**
  String get courseLiveSessionLabelRegistrationPeriodOver;

  /// No description provided for @courseAssessmentLabelCorrectAnswerCountHint.
  ///
  /// In en, this message translates to:
  /// **'Hint: Number of right answers for this question: {count}'**
  String courseAssessmentLabelCorrectAnswerCountHint(num count);

  /// No description provided for @courseAssessmentLabelPassingOptionAfterProvdingAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Hint: This section will be passed after providing the answer'**
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerHint;

  /// No description provided for @courseAssessmentLabelPassingOptionAfterProvdingAnswerUserAnswerStatus.
  ///
  /// In en, this message translates to:
  /// **'Submitted and passed'**
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerUserAnswerStatus;

  /// No description provided for @courseAssessmentLabelPassingOptionAfterSendingFeedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Hint: This section will be passed after the course owner provides feedback'**
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackHint;

  /// No description provided for @courseAssessmentLabelPassingOptionAfterSendingFeedbackUserAnswerStatus.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the feedback from the course owner'**
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackUserAnswerStatus;

  /// No description provided for @courseAssessmentLabelPassingOptionAfterSettingPassHint.
  ///
  /// In en, this message translates to:
  /// **'Hint: This section will be passed after the course owner provides feedback and allow to proceed'**
  String get courseAssessmentLabelPassingOptionAfterSettingPassHint;

  /// No description provided for @courseAssessmentLabelPassingOptionAfterSettingPassUserAnswerStatus.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the feedback from the course owner and the answer is marked as satisfactory'**
  String get courseAssessmentLabelPassingOptionAfterSettingPassUserAnswerStatus;

  /// No description provided for @courseAssessmentLabelFeedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback from the course owner: {feedback}'**
  String courseAssessmentLabelFeedback(String feedback);

  /// No description provided for @courseAssessmentButtonTextSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get courseAssessmentButtonTextSave;

  /// No description provided for @courseAssessmentLabelSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get courseAssessmentLabelSaved;

  /// No description provided for @courseAssessmentButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get courseAssessmentButtonTextSubmit;

  /// No description provided for @courseAssessmentButtonTextShowCorrectAnswers.
  ///
  /// In en, this message translates to:
  /// **'Show Right Answers'**
  String get courseAssessmentButtonTextShowCorrectAnswers;

  /// No description provided for @courseAssessmentLabelCorrectAnswers.
  ///
  /// In en, this message translates to:
  /// **'The right answers are :'**
  String get courseAssessmentLabelCorrectAnswers;

  /// No description provided for @courseEvaluationButtonTextSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get courseEvaluationButtonTextSubmit;

  /// No description provided for @courseButtonTextCancelCourse.
  ///
  /// In en, this message translates to:
  /// **'Cancel course'**
  String get courseButtonTextCancelCourse;

  /// No description provided for @courseLabelCancelCourseConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get courseLabelCancelCourseConfirmationTitle;

  /// No description provided for @courseLabelCancelCourseConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'If you cancel the course, all progress will be lost for this course.'**
  String get courseLabelCancelCourseConfirmationMessage;

  /// No description provided for @courseButtonTextCancelCourseDismiss.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get courseButtonTextCancelCourseDismiss;

  /// No description provided for @courseButtonTextCancelCourseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get courseButtonTextCancelCourseConfirm;

  /// No description provided for @courseDiscussionLabelGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'You need to take this course to discuss.'**
  String get courseDiscussionLabelGuestMessage;

  /// No description provided for @courseDiscussionLabelInputHint.
  ///
  /// In en, this message translates to:
  /// **'What’s on your thoughts?'**
  String get courseDiscussionLabelInputHint;

  /// No description provided for @courseDiscussionLabelDiscussionOwner.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get courseDiscussionLabelDiscussionOwner;

  /// No description provided for @courseReviewSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Reivews'**
  String get courseReviewSummaryTitle;

  /// No description provided for @courseReviewSummaryFormattedReviewCount.
  ///
  /// In en, this message translates to:
  /// **'{review, plural, =0{0 review} =1{1 review} other{{review} reviews}}'**
  String courseReviewSummaryFormattedReviewCount(num review);

  /// No description provided for @courseReviewSummaryRatingLevels.
  ///
  /// In en, this message translates to:
  /// **'(5 - Best, 1 - Worst)'**
  String get courseReviewSummaryRatingLevels;

  /// No description provided for @courseReviewLabelLearnerMessage.
  ///
  /// In en, this message translates to:
  /// **'You need to take this course to rate and leave a review.'**
  String get courseReviewLabelLearnerMessage;

  /// No description provided for @courseReviewLabelGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'Please <span style=\"color: #0077D4; font-weight: bold;\">Login</span> and take the course to rate and review.'**
  String get courseReviewLabelGuestMessage;

  /// No description provided for @courseReviewLabelWriteAReview.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get courseReviewLabelWriteAReview;

  /// No description provided for @courseReviewButtonTextSubmitReview.
  ///
  /// In en, this message translates to:
  /// **'Publish Review'**
  String get courseReviewButtonTextSubmitReview;

  /// No description provided for @courseReviewLabelNewReviewInput.
  ///
  /// In en, this message translates to:
  /// **'Care to share more about it?'**
  String get courseReviewLabelNewReviewInput;

  /// No description provided for @courseReviewLabelNewReviewGuide.
  ///
  /// In en, this message translates to:
  /// **'Leave Your Reviews Here (5 - Best, 1 - Worst)'**
  String get courseReviewLabelNewReviewGuide;

  /// No description provided for @courseRelatedResourceButtonTextLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get courseRelatedResourceButtonTextLearnMore;

  /// No description provided for @groupLabelThematicGroups.
  ///
  /// In en, this message translates to:
  /// **'Thematic Groups'**
  String get groupLabelThematicGroups;

  /// No description provided for @groupLabelGuestWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Please login to access thematic groups'**
  String get groupLabelGuestWelcomeMessage;

  /// No description provided for @groupLabelMyGroups.
  ///
  /// In en, this message translates to:
  /// **'My Groups'**
  String get groupLabelMyGroups;

  /// No description provided for @groupLabelRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get groupLabelRecommended;

  /// No description provided for @groupLabelSearchAnything.
  ///
  /// In en, this message translates to:
  /// **'Search Anything'**
  String get groupLabelSearchAnything;

  /// No description provided for @groupLabelNoData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get groupLabelNoData;

  /// No description provided for @groupLabelEmptyPost.
  ///
  /// In en, this message translates to:
  /// **'No posts available'**
  String get groupLabelEmptyPost;

  /// No description provided for @groupLabelEmptyGroup.
  ///
  /// In en, this message translates to:
  /// **'No groups available'**
  String get groupLabelEmptyGroup;

  /// No description provided for @groupLabelFormattedMemberCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 member} =1{1 member} other{{count} members}}'**
  String groupLabelFormattedMemberCount(num count);

  /// No description provided for @groupLabelRequestSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Sent your request to admin. Please wait for approval.'**
  String get groupLabelRequestSentMessage;

  /// No description provided for @groupLabelCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get groupLabelCategories;

  /// No description provided for @groupLabelFilterAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get groupLabelFilterAllCategories;

  /// No description provided for @groupLabelPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get groupLabelPrivate;

  /// No description provided for @groupLabelPublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get groupLabelPublic;

  /// No description provided for @groupButtonTextRequestToJoin.
  ///
  /// In en, this message translates to:
  /// **'Request To Join'**
  String get groupButtonTextRequestToJoin;

  /// No description provided for @groupButtonTextBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get groupButtonTextBack;

  /// No description provided for @groupButtonTextViewGroup.
  ///
  /// In en, this message translates to:
  /// **'View Group'**
  String get groupButtonTextViewGroup;

  /// No description provided for @groupButtonTextJoinGroup.
  ///
  /// In en, this message translates to:
  /// **'Join Group'**
  String get groupButtonTextJoinGroup;

  /// No description provided for @groupButtonTextLeaveGroup.
  ///
  /// In en, this message translates to:
  /// **'Leave Group'**
  String get groupButtonTextLeaveGroup;

  /// No description provided for @groupButtonTextKeepPostAndLeave.
  ///
  /// In en, this message translates to:
  /// **'Keep Posts & Leave'**
  String get groupButtonTextKeepPostAndLeave;

  /// No description provided for @groupButtonTextDeletePostAndLeave.
  ///
  /// In en, this message translates to:
  /// **'Delete Posts & Leave'**
  String get groupButtonTextDeletePostAndLeave;

  /// No description provided for @groupButtonTextAgree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get groupButtonTextAgree;

  /// No description provided for @groupLabelNewsFeed.
  ///
  /// In en, this message translates to:
  /// **'NewsFeed'**
  String get groupLabelNewsFeed;

  /// No description provided for @groupLabelWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get groupLabelWelcome;

  /// No description provided for @groupButtonTextPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get groupButtonTextPost;

  /// No description provided for @groupLabelShareSomething.
  ///
  /// In en, this message translates to:
  /// **'Share Something'**
  String get groupLabelShareSomething;

  /// No description provided for @groupLabelPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get groupLabelPost;

  /// No description provided for @groupLabelPhoto.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get groupLabelPhoto;

  /// No description provided for @groupLabelVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get groupLabelVideo;

  /// No description provided for @groupLabelTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get groupLabelTag;

  /// No description provided for @groupLabelLikeCount.
  ///
  /// In en, this message translates to:
  /// **'{like, plural, =0{0 like} =1{1 like} other{{like} likes}}'**
  String groupLabelLikeCount(num like);

  /// No description provided for @groupLabelPostCount.
  ///
  /// In en, this message translates to:
  /// **'{post, plural, =0{0 Post} =1{1 Post} other{{post} Posts}}'**
  String groupLabelPostCount(num post);

  /// No description provided for @groupLabelCommentCount.
  ///
  /// In en, this message translates to:
  /// **'{comment, plural, =0{0 comment} =1{1 comment} other{{comment} comments}}'**
  String groupLabelCommentCount(num comment);

  /// No description provided for @groupLabelWriteComment.
  ///
  /// In en, this message translates to:
  /// **'Write comment...'**
  String get groupLabelWriteComment;

  /// No description provided for @groupLabelReplyCount.
  ///
  /// In en, this message translates to:
  /// **'{reply, plural, =0{0 reply} =1{1 reply} other{{reply} replies}}'**
  String groupLabelReplyCount(num reply);

  /// No description provided for @groupLabelShareCount.
  ///
  /// In en, this message translates to:
  /// **'{share, plural, =0{0 share} =1{1 share} other{{share} shares}}'**
  String groupLabelShareCount(num share);

  /// No description provided for @groupLabelCreatePost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get groupLabelCreatePost;

  /// No description provided for @groupLabelEditPost.
  ///
  /// In en, this message translates to:
  /// **'Edit Post'**
  String get groupLabelEditPost;

  /// No description provided for @groupLabelDeletePost.
  ///
  /// In en, this message translates to:
  /// **'Delete Post'**
  String get groupLabelDeletePost;

  /// No description provided for @groupLabelNewPostHint.
  ///
  /// In en, this message translates to:
  /// **'Type here . . .'**
  String get groupLabelNewPostHint;

  /// No description provided for @groupButtonTextSubmitPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get groupButtonTextSubmitPost;

  /// No description provided for @groupLabelFailEditPost.
  ///
  /// In en, this message translates to:
  /// **'Failed to Edit Post.'**
  String get groupLabelFailEditPost;

  /// No description provided for @groupLabelHidePost.
  ///
  /// In en, this message translates to:
  /// **'Hide Post'**
  String get groupLabelHidePost;

  /// No description provided for @groupLabelSuccessEditPost.
  ///
  /// In en, this message translates to:
  /// **'Post Edited Successfully.'**
  String get groupLabelSuccessEditPost;

  /// No description provided for @groupToastNoChanges.
  ///
  /// In en, this message translates to:
  /// **'No changes made to the post'**
  String get groupToastNoChanges;

  /// No description provided for @groupLabelPendingPostMessage.
  ///
  /// In en, this message translates to:
  /// **'Now your post is pending to admin’s Approval .We’ll verify you soon .'**
  String get groupLabelPendingPostMessage;

  /// No description provided for @groupLabelWaitingApproval.
  ///
  /// In en, this message translates to:
  /// **' '**
  String get groupLabelWaitingApproval;

  /// No description provided for @groupLabelPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get groupLabelPreview;

  /// No description provided for @groupLabelCommentSection.
  ///
  /// In en, this message translates to:
  /// **'Comment Section'**
  String get groupLabelCommentSection;

  /// No description provided for @groupButtonTextBackToFeed.
  ///
  /// In en, this message translates to:
  /// **'Back To Feed'**
  String get groupButtonTextBackToFeed;

  /// No description provided for @groupLabelPendingPosts.
  ///
  /// In en, this message translates to:
  /// **'Pending Posts'**
  String get groupLabelPendingPosts;

  /// No description provided for @groupLabelPendingForApproval.
  ///
  /// In en, this message translates to:
  /// **'Pending for Approval'**
  String get groupLabelPendingForApproval;

  /// No description provided for @groupLabelCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get groupLabelCancel;

  /// No description provided for @groupButtonTextViewPendingPosts.
  ///
  /// In en, this message translates to:
  /// **'View Pending Posts'**
  String get groupButtonTextViewPendingPosts;

  /// No description provided for @groupLabelMyFeeds.
  ///
  /// In en, this message translates to:
  /// **'My Feeds'**
  String get groupLabelMyFeeds;

  /// No description provided for @groupWarningLeave.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to leave this group?'**
  String get groupWarningLeave;

  /// No description provided for @groupWarningDelete.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete all the posted posts in this group?'**
  String get groupWarningDelete;

  /// No description provided for @groupLabelWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning!'**
  String get groupLabelWarning;

  /// No description provided for @groupLabelRule.
  ///
  /// In en, this message translates to:
  /// **'Group Rule'**
  String get groupLabelRule;

  /// No description provided for @homeLabelSearchCourses.
  ///
  /// In en, this message translates to:
  /// **'Search by keywords'**
  String get homeLabelSearchCourses;

  /// No description provided for @learningQuizLabelSelectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Select Answer'**
  String get learningQuizLabelSelectAnswer;

  /// No description provided for @learningQuizButtonTextCheckAnswer.
  ///
  /// In en, this message translates to:
  /// **'Check Answer'**
  String get learningQuizButtonTextCheckAnswer;

  /// No description provided for @communityVideoLocal.
  ///
  /// In en, this message translates to:
  /// **'LOCAL'**
  String get communityVideoLocal;

  /// No description provided for @communityVideoInternational.
  ///
  /// In en, this message translates to:
  /// **'INTERNATIONAL'**
  String get communityVideoInternational;

  /// No description provided for @communityVideoSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get communityVideoSeeAll;

  /// No description provided for @communityVideoViews.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get communityVideoViews;

  /// No description provided for @communityVideoDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get communityVideoDescription;

  /// No description provided for @communityVideoRelatedVideos.
  ///
  /// In en, this message translates to:
  /// **'Related Videos'**
  String get communityVideoRelatedVideos;

  /// No description provided for @communityVideoInspiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Inspired by our community'**
  String get communityVideoInspiredTitle;

  /// No description provided for @communityVideoInspiredBody.
  ///
  /// In en, this message translates to:
  /// **'Discover the extraordinary stories of individuals making a difference in our community.'**
  String get communityVideoInspiredBody;

  /// No description provided for @communityVideoInspiredVideos.
  ///
  /// In en, this message translates to:
  /// **'Inspired Videos'**
  String get communityVideoInspiredVideos;

  /// No description provided for @communityVideoVideoDetail.
  ///
  /// In en, this message translates to:
  /// **'Video Detail'**
  String get communityVideoVideoDetail;

  /// No description provided for @communityVideoDiscoveryExtraordinary.
  ///
  /// In en, this message translates to:
  /// **'Discover the extraordinary stories of individuals making a difference in our community.'**
  String get communityVideoDiscoveryExtraordinary;

  /// No description provided for @communityVideoNoVideoFound.
  ///
  /// In en, this message translates to:
  /// **'No Video Found'**
  String get communityVideoNoVideoFound;

  /// No description provided for @communityVideoSearchForKeyword.
  ///
  /// In en, this message translates to:
  /// **'Search For Keyword'**
  String get communityVideoSearchForKeyword;

  /// No description provided for @communityVideoSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get communityVideoSearch;

  /// No description provided for @chatGPTWelcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get chatGPTWelcomeTo;

  /// No description provided for @chatGPTMTPAIBot.
  ///
  /// In en, this message translates to:
  /// **'MTP AI-Bot'**
  String get chatGPTMTPAIBot;

  /// No description provided for @chatGPTTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message ...'**
  String get chatGPTTypeMessage;

  /// No description provided for @userGuide.
  ///
  /// In en, this message translates to:
  /// **'User Guide'**
  String get userGuide;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @howToUseMTPApplication.
  ///
  /// In en, this message translates to:
  /// **'How To Use MTP Application'**
  String get howToUseMTPApplication;

  /// No description provided for @howOfflineFeatureWorks.
  ///
  /// In en, this message translates to:
  /// **'How Offline Features Works'**
  String get howOfflineFeatureWorks;

  /// No description provided for @updateversionAvailable.
  ///
  /// In en, this message translates to:
  /// **'A new version {versionCode} is available. Please update to continue.'**
  String updateversionAvailable(String versionCode);

  /// No description provided for @updateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateTitle;

  /// No description provided for @btnUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get btnUpdate;

  /// No description provided for @versionalreadyupdated.
  ///
  /// In en, this message translates to:
  /// **'You are using the latest version.'**
  String get versionalreadyupdated;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert !'**
  String get alert;

  /// No description provided for @checkVersion.
  ///
  /// In en, this message translates to:
  /// **'Check Version'**
  String get checkVersion;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @labelShares.
  ///
  /// In en, this message translates to:
  /// **'Shares'**
  String get labelShares;

  /// No description provided for @failloadOfflinecontent.
  ///
  /// In en, this message translates to:
  /// **'Failed to load offline content.'**
  String get failloadOfflinecontent;

  /// No description provided for @failloadVideo.
  ///
  /// In en, this message translates to:
  /// **'Failed to load video.'**
  String get failloadVideo;

  /// No description provided for @failloadPDF.
  ///
  /// In en, this message translates to:
  /// **'Error loading PDF'**
  String get failloadPDF;

  /// No description provided for @noQuestions.
  ///
  /// In en, this message translates to:
  /// **'No questions!'**
  String get noQuestions;

  /// No description provided for @txtReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get txtReply;

  /// No description provided for @txtSelected.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get txtSelected;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'my'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'my': return AppLocalizationsMy();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

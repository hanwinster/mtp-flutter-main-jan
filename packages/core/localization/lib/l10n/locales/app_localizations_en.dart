import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'MTP';

  @override
  String get appFullName => 'Myanmar Teacher Platform';

  @override
  String get navTitleHome => 'Home';

  @override
  String get navTitleMyCourses => 'My Courses';

  @override
  String get navTitleGroup => 'Group';

  @override
  String get navTitleBlog => 'Blog';

  @override
  String get navTitleLibrary => 'E-library';

  @override
  String get buttonTextLogin => 'Login';

  @override
  String get buttonTextRetry => 'Retry';

  @override
  String get labelDoubleTapToBack => 'Press back again to exit';

  @override
  String get buttonTextTakePhoto => 'Take Photo';

  @override
  String get buttonTextChooseFromGallery => 'Choose from Gallery';

  @override
  String get buttonTextTakeMorePhoto => 'Take More Photo';

  @override
  String get errorNoImage => 'No Image';

  @override
  String get errorFormFieldRequired => 'Required';

  @override
  String get errorFormFieldInvalid => 'Invalid';

  @override
  String get errorFormFieldPasswordLength => 'Password should be at least 8 digits.';

  @override
  String get errorFormFieldPasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get errorNoInternetConnection => 'No Internet Connection';

  @override
  String get errorNoInternetConnectionDescription => 'Please check your internet connection and try again.';

  @override
  String get errorNoInternetConnectionWithInstruction => 'No Internet Connection. Please check your internet connection and try again.';

  @override
  String get errorUnknown => 'Oops! Something went wrong. Please try again later.';

  @override
  String get errorSessionExpired => 'Session expired! Please login again.';

  @override
  String get labelSeparator => ',';

  @override
  String get labelNetworkStatusOnline => 'Online';

  @override
  String get labelNetworkStatusOffline => 'Offline';

  @override
  String get accountTypeLabelLearner => 'Learner';

  @override
  String get accountTypeLabelTeacher => 'Teacher';

  @override
  String get userTypeLabelIndependentLearner => 'Independent Learner';

  @override
  String get userTypeLabelJournalist => 'Journalist';

  @override
  String get userTypeLabelStudentTeacher => 'Student Teacher';

  @override
  String get userTypeLabelIndependentTeacher => 'Independent Teacher';

  @override
  String get userTypeLabelAdmin => 'Admin';

  @override
  String get userTypeLabelManager => 'Manager';

  @override
  String get userTypeLabelTeacherEducator => 'Teacher Educator';

  @override
  String get userTypeLabelGuest => 'Guest';

  @override
  String get otpChannelLabelEmail => 'Email';

  @override
  String get otpChannelLabelSms => 'SMS';

  @override
  String get genderLabelMale => 'Male';

  @override
  String get genderLabelFemale => 'Female';

  @override
  String get genderLabelOther => 'Others';

  @override
  String durationUnitSecond(num second) {
    final intl.NumberFormat secondNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String secondString = secondNumberFormat.format(second);

    String _temp0 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$secondString seconds',
      one: '1 second',
      zero: '0 second',
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
      other: '$minuteString minutes',
      one: '1 minute',
      zero: '0 minute',
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
      other: '$hourString hours',
      one: '1 hour',
      zero: '0 hour',
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
      other: '$dayString days',
      one: '1 day',
      zero: '0 day',
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
      other: '$weekString weeks',
      one: '1 week',
      zero: '0 week',
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
      other: '$monthString months',
      one: '1 month',
      zero: '0 month',
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
      other: '$yearString years',
      one: '1 year',
      zero: '0 year',
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
      other: '$countString Comments',
      one: '1 Comment',
      zero: '0 Comment',
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
      other: '$countString Likes',
      one: '1 Like',
      zero: '0 Like',
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
      other: '$countString Shares',
      one: '1 Share',
      zero: '0 Share',
    );
    return '$_temp0';
  }

  @override
  String labelAppVersion(String version) {
    return 'Version $version';
  }

  @override
  String get labelCopyright => 'Copyright © 2025  Myanmar Teacher Platform. All Rights Reserved';

  @override
  String get drawerHeaderLabelGuest => 'Guest';

  @override
  String get drawerHeaderButtonTextLogin => 'Login';

  @override
  String get drawerItemLabelLanguage => 'Language';

  @override
  String get drawerItemLabelAboutUs => 'About Us';

  @override
  String get drawerItemLabelTermsAndConditions => 'Terms And Conditions';

  @override
  String get drawerItemLabelPrivacyPolicy => 'Privacy Policy';

  @override
  String get drawerItemLabelUserManuals => 'User Manuals';

  @override
  String get drawerItemLabelFrequentlyAskedQuestions => 'Frequently Asked Questions';

  @override
  String get drawerItemLabelContactUs => 'Contact Us';

  @override
  String get drawerItemLabelLogOut => 'Log Out';

  @override
  String get drawerItemLabelFaq => 'Faq';

  @override
  String get loginLabelSubtitle => 'Login To Your Account';

  @override
  String get loginLabelUsername => 'Username or Email';

  @override
  String get loginLabelPassword => 'Password';

  @override
  String get loginButtonTextForgotPassword => 'Forgot Password?';

  @override
  String get loginButtonTextSubmit => 'Login';

  @override
  String get loginButtonTextLoggingIn => 'Logging in ...';

  @override
  String get loginLabelNewAccount => 'Don\'t have an account yet?';

  @override
  String get loginButtonTextCreateNewAccount => 'Create New';

  @override
  String get registerLabelSubtitleFillUserDetails => 'Fill User Details';

  @override
  String get registerLabelSubtitleRegister => 'Register Your Account';

  @override
  String get registerLabelMemberLogin => 'Already a member?';

  @override
  String get registerLabelUserType => 'User Type *';

  @override
  String get registerLabelAccountType => 'Account Type *';

  @override
  String get registerLabelFillInformation => 'Fill Information';

  @override
  String get registerLabelOrganization => 'Organization';

  @override
  String get registerLabelAffiliation => 'Affiliation';

  @override
  String get registerLabelPosition => 'Position';

  @override
  String get registerLabelCollege => 'Select College';

  @override
  String get registerLabelYearOfStudyingTraining => 'Select year of studying/training';

  @override
  String get registerLabelGender => 'Gender *';

  @override
  String get registerButtonTextPrev => 'Prev';

  @override
  String get registerButtonTextNext => 'Next';

  @override
  String get registerButtonTextRegister => 'Register';

  @override
  String get registerButtonTextOK => 'OK';

  @override
  String get registerLabelUsername => 'Username *';

  @override
  String get registerLabelUsernameHelper => 'Please provide the name using only English characters.\nPlease use character, number, dash and underscore only and do not include spaces.\n\n';

  @override
  String get registerLabelUsernameHelperExampleLabel => 'e.g.,';

  @override
  String get registerLabelUsernameHelperExampleValue => 'allen-brown, allen_brown, allen_Brown, allenbrown23';

  @override
  String get registerLabelUsernameErrorLength => 'The username must be at least 5 characters.';

  @override
  String get registerLabelName => 'Name *';

  @override
  String get registerLabelNameErrorLength => 'The name must be at least 5 characters.';

  @override
  String get registerLabelEmail => 'Email Address *';

  @override
  String get registerLabelEmailHelper => 'Please enter your valid email.';

  @override
  String get registerLabelPassword => 'Password *';

  @override
  String get registerLabelPasswordHelper => 'The password must be at least 8 characters.';

  @override
  String get registerLabelConfirmPassword => 'Confirm Password *';

  @override
  String get registerLabelPhone => 'Phone';

  @override
  String get registerLabelPhoneHelper => 'Please select your country and enter your mobile number (Number in English only).e.g., 0900000000 Or 900000000';

  @override
  String get registerLabelOtpChannel => 'OTP Receiving Channel';

  @override
  String get registerLabelProfileImage => 'Profile Image';

  @override
  String get otpVerificaitonLabelTitle => 'OTP Verification';

  @override
  String otpVerificaitonLabelDescription(String email) {
    return 'Enter the OTP code, we just sent an OTP to your email.\n$email';
  }

  @override
  String get otpVerificationButtonTextVerify => 'Verify';

  @override
  String get otpVerificationLabelDidNotReceiveCode => 'Didn\'t receive code?';

  @override
  String get otpVerificationButtonTextResend => 'Resend';

  @override
  String get otpVerifiedLabelTitle => 'Ready to Go!';

  @override
  String get otpVerifiedButtonTextLogin => 'Please Login Again';

  @override
  String get forgotPasswordLabelTitle => 'Reset Your Password';

  @override
  String get forgotPasswordLabelEmail => 'Email';

  @override
  String get forgotPasswordLabelHelper => 'We will sent OTP to your email for reset password process.';

  @override
  String get forgotPasswordLabelSuccessful => 'Your account password has been updated successfully.';

  @override
  String get forgotPasswordLabelNewPassword => 'New Password';

  @override
  String get forgotPasswordLabelConfirmPassword => 'Confirm Password';

  @override
  String get forgotPasswordButtonTextResetPassword => 'Reset Password';

  @override
  String get forgotPasswordButtonTextContinue => 'Continue';

  @override
  String get changePasswordLabelTitle => 'Change Password';

  @override
  String get changePasswordLabelInstruction => 'Your new password must be different from the previous one.';

  @override
  String get changePasswordLabelCurrentPassword => 'Current Password';

  @override
  String get changePasswordLabelNewPassword => 'New Password';

  @override
  String get changePasswordLabelConfirmPassword => 'Confirm Password';

  @override
  String get changePasswordLabelPasswordMismatchError => 'Doesn\'t match with new password';

  @override
  String get changePasswordButtonTextSubmit => 'Update Password';

  @override
  String get changePasswordSuccessLabelTitle => 'Ready to Go!';

  @override
  String get changePasswordSuccessButtonTextLogin => 'Please Login Again';

  @override
  String get profileButtonTextViewProfile => 'Profile';

  @override
  String get profileLabelOrganization => 'Organization';

  @override
  String get profileLabelAffiliation => 'Affiliation *';

  @override
  String get profileLabelPosition => 'Position *';

  @override
  String get profileLabelCollege => 'College';

  @override
  String get profileLabelYearOfStudyingTraining => 'Year of studying/training';

  @override
  String get profileLabelGender => 'Gender';

  @override
  String get profileLabelGenderMale => 'Male';

  @override
  String get profileLabelGenderFemale => 'Female';

  @override
  String get profileLabelGenderOther => 'Other';

  @override
  String get profileLabelUsername => 'Username';

  @override
  String get profileLabelEmail => 'Email';

  @override
  String get profileLabelPhone => 'Phone';

  @override
  String get profileLabelOtpChannel => 'OTP Receiving Channel';

  @override
  String get profileLabelOtpChannelEmail => 'Email (Default)';

  @override
  String get profileLabelOtpChannelSms => 'SMS';

  @override
  String get profileButtonTextEditProfile => 'Edit Profile';

  @override
  String get profilePostSomething => 'Post Something ...';

  @override
  String get editProfileLabelTitle => 'Edit Profile';

  @override
  String get editProfileButtonTextSubmit => 'Save';

  @override
  String get editProfileLabelUserType => 'User Type';

  @override
  String get editProfileLabelCollege => 'College';

  @override
  String get editProfileLabelYearOfStudyingTraining => 'Year of studying/training';

  @override
  String get editProfileLabelPhone => 'Phone';

  @override
  String get editProfileLabelOrganization => 'Organization';

  @override
  String get editProfileLabelAffiliation => 'Affiliation';

  @override
  String get editProfileLabelPosition => 'Position';

  @override
  String get editProfileLabelUsername => 'Username';

  @override
  String get editProfileLabelName => 'Name';

  @override
  String get editProfileLabelOtpChannel => 'OTP Receiving Channel';

  @override
  String get editProfileLabelGender => 'Gender';

  @override
  String get editProfileLabelEmail => 'Email';

  @override
  String get subscriptionButtonTextSubscribe => 'Subscribe';

  @override
  String get subscriptionButtonTextUnsubscribe => 'Unsubscribe';

  @override
  String get subscriptionDialogLoginTitle => 'You need to Login before Subscribing';

  @override
  String get subscriptionDialogLoginMessage => 'Please login to your account to access to the feature';

  @override
  String get subscriptionDialogLoginButton => 'Log in';

  @override
  String get subscriptionLabelAgree => 'I agree to the Term & Conditions';

  @override
  String get subscriptionButtonTextContinue => 'Continue';

  @override
  String get helpLabelTitle => 'Help & Support';

  @override
  String get helpLabelAboutUs => 'About Us';

  @override
  String get helpLabelTermsAndConditions => 'Terms And Conditions';

  @override
  String get helpLabelPrivacyPolicy => 'Privacy Policy';

  @override
  String get helpLabelUserManuals => 'User Manuals';

  @override
  String get helpLabelFrequentlyAskedQuestions => 'Frequently Asked Questions';

  @override
  String get helpLabelContactUs => 'Contact Us';

  @override
  String get contactUsFormTitle => 'Let Us Reach Out to You';

  @override
  String get contactUsLabelName => 'Name *';

  @override
  String get contactUsLabelEmail => 'Email *';

  @override
  String get contactUsLabelPhoneNumber => 'Phone Number';

  @override
  String get contactUsLabelSubject => 'Subject *';

  @override
  String get contactUsLabelOrganization => 'Organization/Company';

  @override
  String get contactUsLabelRegion => 'Regions/States';

  @override
  String get contactUsLabelMessage => 'Message *';

  @override
  String get contactUsButtonTextSend => 'Send';

  @override
  String get settingsLabelTitle => 'Settings';

  @override
  String get settingsLabelChangeLanguage => 'Language';

  @override
  String get settingsLabelAccountSettings => 'Account Settings';

  @override
  String get settingsLabelChangePassword => 'Change Password';

  @override
  String get settingsLabelDeleteAccount => 'Delete Account';

  @override
  String get settingsButtonTextLogout => 'Logout';

  @override
  String get settingsConfirmDeleteMessage => 'Please be aware that all your taken courses, ratings & reviews, chat messages in discussions and user information will be removed after deleting the account and it cannot be reversible!';

  @override
  String get settingsCancel => 'Cancel';

  @override
  String get homeLabelOfflineExplanation => 'How Offline Feature Works';

  @override
  String get homeLabelOfflineCourses => 'Go to Offline Courses';

  @override
  String get homeLabelCourseCategories => 'Course Categories';

  @override
  String get homeLabelCourses => 'Courses';

  @override
  String get homeButtonTextSeeAllCourses => 'See All';

  @override
  String get homeLabelNoCourses => 'No courses found';

  @override
  String get offlineCoursesTitle => 'Downloaded Courses';

  @override
  String get offlineCoursesLabelEmptyList => 'To use offline, download the course(s) first.';

  @override
  String get offlineCoursesButtonTextStartLearning => 'Start Offline Learning';

  @override
  String get courseLearningModeLabelOfflineTitle => 'Offline Learning Mode';

  @override
  String get courseLearningModeLabelOfflineMessage => 'You\'re currently in offline mode. Progress won\'t be saved.';

  @override
  String get courseLearningModeButtonTextSwitchToOnline => 'Switch to Online';

  @override
  String get courseLearningModeButtonTextStayOffline => 'Stay Offline';

  @override
  String get blogLabelSubtitleLatestPosts => 'Latest Articles';

  @override
  String get blogLabelSubtitleRecommendedPosts => 'Recommended Articles';

  @override
  String get blogLabelPostsNotFound => 'Currently, there are no articles in this category. We\'re always updating our content, so please check back soon!';

  @override
  String get blogLableGuestUserMessage => 'Please login to read the blogs.';

  @override
  String get blogButtonTextLogin => 'Login Now';

  @override
  String get postLabelSubtitleTags => 'Tags';

  @override
  String get postLabelSubtitleRecommendedPosts => 'Recommended Articles';

  @override
  String get postLabelSubtitleCategories => 'Categories';

  @override
  String get postLabelSubtitleComments => 'Comments';

  @override
  String postLabelMemberSince(String date) {
    return 'Member Since: $date';
  }

  @override
  String postLabelPostedOn(String date) {
    return 'Posted On: $date';
  }

  @override
  String postLabelDuration(String duration) {
    return '$duration read';
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
      other: '$secondString seconds',
      one: '1 second',
      zero: '0 second',
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
      other: '$minuteString minutes',
      one: '1 minute',
      zero: '0 minute',
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
      other: '$hourString hours',
      one: '1 hour',
      zero: '0 hour',
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
      other: '$dayString days',
      one: '1 day',
      zero: '0 day',
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
      other: '$weekString weeks',
      one: '1 week',
      zero: '0 week',
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
      other: '$monthString months',
      one: '1 month',
      zero: '0 month',
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
      other: '$yearString years',
      one: '1 year',
      zero: '0 year',
    );
    return '$_temp0';
  }

  @override
  String get postButtonTextTakeQuiz => 'Take quiz to mark as read';

  @override
  String get postLabelReadAndTookQuiz => 'Successfully took quiz and already read';

  @override
  String get postButtonTextMarkAsRead => 'Mark As Read';

  @override
  String get postLabelAlreadyRead => 'Already read';

  @override
  String get temp3 => 'No comments for now!';

  @override
  String get postLabelReadMore => 'Read More';

  @override
  String get postLabelReadLess => 'Read Less';

  @override
  String get postLabelPlaceholderComment => 'Write comment ...';

  @override
  String get postLabelAddPhoto => 'Photo';

  @override
  String get postLabelAddVideo => 'Video';

  @override
  String get postButtonTextSubmitComment => 'Comment';

  @override
  String get postButtonTextEditComment => 'Edit';

  @override
  String get postButtonTextDeleteComment => 'Delete';

  @override
  String get blogPostQuizTitle => 'Please take the blog-related quiz';

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

    return 'Question $currentString/$totalString';
  }

  @override
  String blogPostQuizLabelFormattedOverallScore(num score) {
    final intl.NumberFormat scoreNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String scoreString = scoreNumberFormat.format(score);

    return 'Overall Score : $scoreString';
  }

  @override
  String get blogPostQuizLabelTrueFalseInstruction => 'Please check the correct box.';

  @override
  String get blogPostQuizLabelTrueFalseOptionTrue => 'True';

  @override
  String get blogPostQuizLabelTrueFalseOptionFalse => 'False';

  @override
  String get blogPostQuizLabelTrueFalseOptionNone => 'None';

  @override
  String get blogPostQuizLabelMachingInstruction => 'Please choose and match';

  @override
  String get blogPostQuizLabelMultipleChoiceInstruction => 'Please check the correct boxes.';

  @override
  String get blogPostQuizLabelRearrangeChoiceInstruction => 'Please drag and drop the items into the correct order.';

  @override
  String get blogPostQuizButtonTextNext => 'Next';

  @override
  String get blogPostQuizButtonTextPrevious => 'Previous';

  @override
  String get blogPostQuizButtonTextSubmit => 'Submit';

  @override
  String get blogQuizCompletionLabelPass => 'Greate Job';

  @override
  String get blogQuizCompletionLabelNotPass => 'Nice Try';

  @override
  String get blogQuizCompletionLabelScore => 'Here is Your Score';

  @override
  String get blogQuizCompletionLabelQuizType => 'General Knowledge Quiz';

  @override
  String get blogQuizButtonTextSumitAnswer => 'Submit Answer';

  @override
  String get blogQuizCompletionButtonTextRetakeQuiz => 'Retake Quiz';

  @override
  String get blogQuizCompletionButtonTextContinue => 'Continue';

  @override
  String get notiButtonTextViewMore => 'View More';

  @override
  String get notiLabelNotiListTitle => 'Notifications';

  @override
  String get notificationList => 'Notification List';

  @override
  String get notiLabelUnread => 'Unread';

  @override
  String get notiLabelRead => 'Read';

  @override
  String get notiLabelNoUnread => 'There are no unread notifications.';

  @override
  String get eLibraryHintSearch => 'Search Anything';

  @override
  String get temp7 => 'Load More';

  @override
  String get eLibraryClearAll => 'Clear All';

  @override
  String get eLibraryChooseSubject => 'Choose Subject';

  @override
  String get eLibraryChooseResourceFormat => 'Choose Resource Formats';

  @override
  String get eLibraryDownloads => 'Downloads';

  @override
  String get eLibraryRating => 'Rating';

  @override
  String get eLibraryTotalPages => 'Total Pages';

  @override
  String get eLibraryOverview => 'Overview';

  @override
  String get eLibraryAuthor => 'Author ';

  @override
  String get eLibraryPublisher => 'Publisher';

  @override
  String get eLibraryStrand => 'Strand';

  @override
  String get eLibrarySubStrand => 'Sub Strand';

  @override
  String get eLibraryLesson => 'Lesson';

  @override
  String get eLibraryPublishingYear => 'Publishing year';

  @override
  String get eLibraryUrl => 'Url';

  @override
  String get eLibraryAdditionalInformation => 'Additional Information';

  @override
  String get eLibraryTotalPageViews => 'Total page views';

  @override
  String get eLibraryTotalDownloads => 'Total downloads';

  @override
  String get eLibraryLastUpdated => 'Last updated';

  @override
  String get eLibraryPreview => 'Preview';

  @override
  String get eLibraryDownload => 'Download';

  @override
  String get eLibraryDownloading => 'Downloading';

  @override
  String get eLibraryDownloadComplete => 'Download Complete ';

  @override
  String get eLibraryDownloadPath => 'Download Path: ';

  @override
  String get eLibraryNoResourceFound => 'No resources found';

  @override
  String get eLibraryDownloadPathOpen => 'Open';

  @override
  String get eLibraryDownloadFail => 'Download failed. Please try again.';

  @override
  String eLibraryDownloadPercent(num progress) {
    final intl.NumberFormat progressNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String progressString = progressNumberFormat.format(progress);

    return '$progressString %';
  }

  @override
  String get courseLabelIntroudction => 'Introduction';

  @override
  String get courseLabelLectures => 'Lectures';

  @override
  String get courseLabelLecture => 'Lecture';

  @override
  String get courseLabelLearningActivities => 'Learning Activities';

  @override
  String get courseLabelQuizzes => 'Quizzes';

  @override
  String get courseLabelSummaries => 'Summaries';

  @override
  String get courseLabelLiveSessions => 'Course Live Sessions/Zoom';

  @override
  String get courseLabelEvaluations => 'Evaluations';

  @override
  String get courseLabelAssessment => 'Assessment';

  @override
  String get courseDetailsTabTitleOverview => 'Overview';

  @override
  String get courseDetailsTabTitleLectures => 'Lectures';

  @override
  String get courseDetailsTabTitleDiscussion => 'Discussion ';

  @override
  String get courseDetailsTabTitleReview => 'Reviews';

  @override
  String get courseDetailsTabTitleRelatedResources => 'Related Resources';

  @override
  String get courseLabelQuestionTextInputHint => 'Write down your answer';

  @override
  String get courseLabelQuestionMatchingHint => 'Select match';

  @override
  String get courseLabelQuestionRearrangeGuide => '(Drag and drop for the orders.)';

  @override
  String get courseLableQuestionAllRequiredError => 'Please answer all questions';

  @override
  String get courseLableQuestionRequiredError => 'Required';

  @override
  String get courseButtonTextNext => 'Next';

  @override
  String get courseButtonTextPrevious => 'Previous';

  @override
  String get courseLableGuestUserMessage => 'Please login to access your courses.';

  @override
  String get courseLableNoUserOngoingCourses => 'No ongoing course found. Please enroll in a course first';

  @override
  String get courseButtonTextExploreCourses => 'Explore Courses';

  @override
  String get courseLableNoUserCompletedCourses => 'No completed course found. Please complete a course first';

  @override
  String get courseButtonTextTakeCourse => 'Take This Course';

  @override
  String get courseButtonTextContinue => 'Continue';

  @override
  String get courseButtonTextStartEvaluation => 'Start Evaluation';

  @override
  String get courseButtonTextGenerateCertificate => 'Generate Certificate';

  @override
  String get courseButtonTextDownloadCourse => 'Download Course';

  @override
  String get courseButtonTextDownloadResources => 'Download Course Resources';

  @override
  String get courseLabelDownloadCourseSuccessfully => 'Course downloaded successfully.';

  @override
  String get courseLabelDownloadResourcesSuccessfully => 'Resource downloaded successfully. You can find it in downloads folder.';

  @override
  String get courseLabelCompletedMessage => 'Congratulations! You have completed this course.';

  @override
  String get courseButtonTextViewCertificate => 'View Certificate';

  @override
  String get courseLabelCertificateDownloaded => 'Certificate downloaded successfully.\nYou can view it in the downloads folder.';

  @override
  String get courseCompletionLabelTitle => 'Congratulations!';

  @override
  String get courseCompletionLabelMessage => 'You have successfully completed the course. Great work!';

  @override
  String get courseCompletionButtonTextGoToMyCourses => 'Go to My Courses';

  @override
  String courseDashboardLabelFormattedProgress(num progress) {
    final intl.NumberFormat progressNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String progressString = progressNumberFormat.format(progress);

    return '$progressString% Completed';
  }

  @override
  String get courseDashboardLabelHalfWay => 'Congratulations! You are half way there to complete this course!';

  @override
  String get courseDashboardButtonTextStartLearning => 'Start Learning';

  @override
  String get courseDashboardButtonTextContinueLearning => 'Continue Learning';

  @override
  String get courseDashboardLabelAssessmentInfo => 'You can take the assessment after completing the course!';

  @override
  String get courseDashboardLabelEvaluationInfo => 'You can evaluate after completing assessments.';

  @override
  String get courseExistConfirmationLabelTitle => 'Pause Learning?';

  @override
  String get courseExistConfirmationLabelMessage => 'Are you sure you want to exit? Your progress will be saved, and you can resume anytime!';

  @override
  String get courseExistConfirmationButtonTextStay => 'Stay Learning';

  @override
  String get courseExistConfirmationButtonTextLeave => 'Quit';

  @override
  String get interactiveProcessButtonTextStart => 'Start';

  @override
  String interactiveProcessLabelFormattedStep(num step) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String stepString = stepNumberFormat.format(step);

    return 'Step $stepString';
  }

  @override
  String get interactiveProcessButtonTextStartAgain => 'Start again';

  @override
  String get interactiveSortingButtonTextReplay => 'Replay';

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

    return '$scoreString/$totalString Cards Correct';
  }

  @override
  String get courseXApiButtonTextMarkComplete => 'Next';

  @override
  String get courseXApiLabelRequiredToComplete => 'You still have some lessons left to complete the course. Please continue learning. ';

  @override
  String get courseLabelCourseFeatures => 'Course Features';

  @override
  String get courseLabelCourseDescription => 'Course Description';

  @override
  String get courseLabelCourseObjectives => 'Course Objectives';

  @override
  String get courseLabelCourseLearningOutcomes => 'Learning Outcomes';

  @override
  String get courseLabelCourseResourceLink => 'Resource Link';

  @override
  String get courseLabelLectureDescription => 'Lecture Description';

  @override
  String get courseQuizLabelOptionTrue => 'True';

  @override
  String get courseQuizLabelOptionFalse => 'False';

  @override
  String get courseAssignmentLableSubmission => 'Assignment Submission';

  @override
  String get courseAssignmentButtonTextChooseFile => 'Choose File';

  @override
  String get courseAssignmentButtonTextSubmit => 'Submit';

  @override
  String get courseAssignmentLabelSubmitted => 'Submitted';

  @override
  String get courseAssignmentLabelFeedbackFromInstructor => 'Comment From Instructor';

  @override
  String get courseAssignmentLabelNoFeedback => 'No Comment from the instructor yet!';

  @override
  String get courseLiveSessionLabelAgenda => 'Agenda';

  @override
  String get courseLiveSessionLabelSessionDateTime => 'Session Date And Time';

  @override
  String get courseLiveSessionLabelSessionDuration => 'Session Duration';

  @override
  String get courseLiveSessionLabelRegistrationPeriodOver => 'The registration period for this session is over';

  @override
  String courseAssessmentLabelCorrectAnswerCountHint(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return 'Hint: Number of right answers for this question: $countString';
  }

  @override
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerHint => 'Hint: This section will be passed after providing the answer';

  @override
  String get courseAssessmentLabelPassingOptionAfterProvdingAnswerUserAnswerStatus => 'Submitted and passed';

  @override
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackHint => 'Hint: This section will be passed after the course owner provides feedback';

  @override
  String get courseAssessmentLabelPassingOptionAfterSendingFeedbackUserAnswerStatus => 'Waiting for the feedback from the course owner';

  @override
  String get courseAssessmentLabelPassingOptionAfterSettingPassHint => 'Hint: This section will be passed after the course owner provides feedback and allow to proceed';

  @override
  String get courseAssessmentLabelPassingOptionAfterSettingPassUserAnswerStatus => 'Waiting for the feedback from the course owner and the answer is marked as satisfactory';

  @override
  String courseAssessmentLabelFeedback(String feedback) {
    return 'Feedback from the course owner: $feedback';
  }

  @override
  String get courseAssessmentButtonTextSave => 'Save';

  @override
  String get courseAssessmentLabelSaved => 'Saved';

  @override
  String get courseAssessmentButtonTextSubmit => 'Submit';

  @override
  String get courseAssessmentButtonTextShowCorrectAnswers => 'Show Right Answers';

  @override
  String get courseAssessmentLabelCorrectAnswers => 'The right answers are :';

  @override
  String get courseEvaluationButtonTextSubmit => 'Submit';

  @override
  String get courseButtonTextCancelCourse => 'Cancel course';

  @override
  String get courseLabelCancelCourseConfirmationTitle => 'Are you sure?';

  @override
  String get courseLabelCancelCourseConfirmationMessage => 'If you cancel the course, all progress will be lost for this course.';

  @override
  String get courseButtonTextCancelCourseDismiss => 'Back';

  @override
  String get courseButtonTextCancelCourseConfirm => 'Cancel';

  @override
  String get courseDiscussionLabelGuestMessage => 'You need to take this course to discuss.';

  @override
  String get courseDiscussionLabelInputHint => 'What’s on your thoughts?';

  @override
  String get courseDiscussionLabelDiscussionOwner => 'Me';

  @override
  String get courseReviewSummaryTitle => 'Reivews';

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
  String get courseReviewLabelLearnerMessage => 'You need to take this course to rate and leave a review.';

  @override
  String get courseReviewLabelGuestMessage => 'Please <span style=\"color: #0077D4; font-weight: bold;\">Login</span> and take the course to rate and review.';

  @override
  String get courseReviewLabelWriteAReview => 'Write a review';

  @override
  String get courseReviewButtonTextSubmitReview => 'Publish Review';

  @override
  String get courseReviewLabelNewReviewInput => 'Care to share more about it?';

  @override
  String get courseReviewLabelNewReviewGuide => 'Leave Your Reviews Here (5 - Best, 1 - Worst)';

  @override
  String get courseRelatedResourceButtonTextLearnMore => 'Learn More';

  @override
  String get groupLabelThematicGroups => 'Thematic Groups';

  @override
  String get groupLabelGuestWelcomeMessage => 'Please login to access thematic groups';

  @override
  String get groupLabelMyGroups => 'My Groups';

  @override
  String get groupLabelRecommended => 'Recommended';

  @override
  String get groupLabelSearchAnything => 'Search Anything';

  @override
  String get groupLabelNoData => 'No Data';

  @override
  String get groupLabelEmptyPost => 'No posts available';

  @override
  String get groupLabelEmptyGroup => 'No groups available';

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
  String get groupLabelRequestSentMessage => 'Sent your request to admin. Please wait for approval.';

  @override
  String get groupLabelCategories => 'Categories';

  @override
  String get groupLabelFilterAllCategories => 'All Categories';

  @override
  String get groupLabelPrivate => 'Private';

  @override
  String get groupLabelPublic => 'Public';

  @override
  String get groupButtonTextRequestToJoin => 'Request To Join';

  @override
  String get groupButtonTextBack => 'Back';

  @override
  String get groupButtonTextViewGroup => 'View Group';

  @override
  String get groupButtonTextJoinGroup => 'Join Group';

  @override
  String get groupButtonTextLeaveGroup => 'Leave Group';

  @override
  String get groupButtonTextKeepPostAndLeave => 'Keep Posts & Leave';

  @override
  String get groupButtonTextDeletePostAndLeave => 'Delete Posts & Leave';

  @override
  String get groupButtonTextAgree => 'Agree';

  @override
  String get groupLabelNewsFeed => 'NewsFeed';

  @override
  String get groupLabelWelcome => 'Welcome';

  @override
  String get groupButtonTextPost => 'Post';

  @override
  String get groupLabelShareSomething => 'Share Something';

  @override
  String get groupLabelPost => 'Post';

  @override
  String get groupLabelPhoto => 'Image';

  @override
  String get groupLabelVideo => 'Video';

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
      other: '$likeString likes',
      one: '1 like',
      zero: '0 like',
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
      other: '$postString Posts',
      one: '1 Post',
      zero: '0 Post',
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
      other: '$commentString comments',
      one: '1 comment',
      zero: '0 comment',
    );
    return '$_temp0';
  }

  @override
  String get groupLabelWriteComment => 'Write comment...';

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
      other: '$shareString shares',
      one: '1 share',
      zero: '0 share',
    );
    return '$_temp0';
  }

  @override
  String get groupLabelCreatePost => 'Create Post';

  @override
  String get groupLabelEditPost => 'Edit Post';

  @override
  String get groupLabelDeletePost => 'Delete Post';

  @override
  String get groupLabelNewPostHint => 'Type here . . .';

  @override
  String get groupButtonTextSubmitPost => 'Post';

  @override
  String get groupLabelFailEditPost => 'Failed to Edit Post.';

  @override
  String get groupLabelHidePost => 'Hide Post';

  @override
  String get groupLabelSuccessEditPost => 'Post Edited Successfully.';

  @override
  String get groupToastNoChanges => 'No changes made to the post';

  @override
  String get groupLabelPendingPostMessage => 'Now your post is pending to admin’s Approval .We’ll verify you soon .';

  @override
  String get groupLabelWaitingApproval => ' ';

  @override
  String get groupLabelPreview => 'Preview';

  @override
  String get groupLabelCommentSection => 'Comment Section';

  @override
  String get groupButtonTextBackToFeed => 'Back To Feed';

  @override
  String get groupLabelPendingPosts => 'Pending Posts';

  @override
  String get groupLabelPendingForApproval => 'Pending for Approval';

  @override
  String get groupLabelCancel => 'Cancel';

  @override
  String get groupButtonTextViewPendingPosts => 'View Pending Posts';

  @override
  String get groupLabelMyFeeds => 'My Feeds';

  @override
  String get groupWarningLeave => 'Are you sure to leave this group?';

  @override
  String get groupWarningDelete => 'Do you want to delete all the posted posts in this group?';

  @override
  String get groupLabelWarning => 'Warning!';

  @override
  String get groupLabelRule => 'Group Rule';

  @override
  String get homeLabelSearchCourses => 'Search by keywords';

  @override
  String get learningQuizLabelSelectAnswer => 'Select Answer';

  @override
  String get learningQuizButtonTextCheckAnswer => 'Check Answer';

  @override
  String get communityVideoLocal => 'LOCAL';

  @override
  String get communityVideoInternational => 'INTERNATIONAL';

  @override
  String get communityVideoSeeAll => 'See All';

  @override
  String get communityVideoViews => 'views';

  @override
  String get communityVideoDescription => 'Description';

  @override
  String get communityVideoRelatedVideos => 'Related Videos';

  @override
  String get communityVideoInspiredTitle => 'Inspired by our community';

  @override
  String get communityVideoInspiredBody => 'Discover the extraordinary stories of individuals making a difference in our community.';

  @override
  String get communityVideoInspiredVideos => 'Inspired Videos';

  @override
  String get communityVideoVideoDetail => 'Video Detail';

  @override
  String get communityVideoDiscoveryExtraordinary => 'Discover the extraordinary stories of individuals making a difference in our community.';

  @override
  String get communityVideoNoVideoFound => 'No Video Found';

  @override
  String get communityVideoSearchForKeyword => 'Search For Keyword';

  @override
  String get communityVideoSearch => 'Search';

  @override
  String get chatGPTWelcomeTo => 'Welcome to';

  @override
  String get chatGPTMTPAIBot => 'MTP AI-Bot';

  @override
  String get chatGPTTypeMessage => 'Type your message ...';

  @override
  String get userGuide => 'User Guide';

  @override
  String get learnMore => 'Learn More';

  @override
  String get howToUseMTPApplication => 'How To Use MTP Application';

  @override
  String get howOfflineFeatureWorks => 'How Offline Features Works';

  @override
  String updateversionAvailable(String versionCode) {
    return 'A new version $versionCode is available. Please update to continue.';
  }

  @override
  String get updateTitle => 'Update Available';

  @override
  String get btnUpdate => 'Update';

  @override
  String get versionalreadyupdated => 'You are using the latest version.';

  @override
  String get alert => 'Alert !';

  @override
  String get checkVersion => 'Check Version';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get completed => 'Completed';

  @override
  String get labelShares => 'Shares';

  @override
  String get failloadOfflinecontent => 'Failed to load offline content.';

  @override
  String get failloadVideo => 'Failed to load video.';

  @override
  String get failloadPDF => 'Error loading PDF';

  @override
  String get noQuestions => 'No questions!';

  @override
  String get txtReply => 'Reply';

  @override
  String get txtSelected => 'selected';
}

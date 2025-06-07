import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @clickHere.
  ///
  /// In en, this message translates to:
  /// **'Click here'**
  String get clickHere;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmPasswordHint;

  /// No description provided for @fieldsNotFilled.
  ///
  /// In en, this message translates to:
  /// **'Make sure you fill in all fields'**
  String get fieldsNotFilled;

  /// No description provided for @token.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get token;

  /// No description provided for @tokenHint.
  ///
  /// In en, this message translates to:
  /// **'Enter token'**
  String get tokenHint;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @report_post.
  ///
  /// In en, this message translates to:
  /// **'Report post'**
  String get report_post;

  /// No description provided for @delete_post.
  ///
  /// In en, this message translates to:
  /// **'Delete post'**
  String get delete_post;

  /// No description provided for @assets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get assets;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get unexpectedError;

  /// No description provided for @nickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get nickname;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @setPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have a password set for your account yet'**
  String get setPasswordTitle;

  /// No description provided for @setPasswordFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Set your password'**
  String get setPasswordFormTitle;

  /// No description provided for @setPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Set password'**
  String get setPasswordButton;

  /// No description provided for @passwordSet.
  ///
  /// In en, this message translates to:
  /// **'The password has been set'**
  String get passwordSet;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_title;

  /// No description provided for @login_button.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login_button;

  /// No description provided for @login_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get login_or;

  /// No description provided for @login_loginVia.
  ///
  /// In en, this message translates to:
  /// **'Log in via'**
  String get login_loginVia;

  /// No description provided for @login_viewAsGuest.
  ///
  /// In en, this message translates to:
  /// **'View as a guest'**
  String get login_viewAsGuest;

  /// No description provided for @login_noAccount.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have an account?'**
  String get login_noAccount;

  /// No description provided for @login_registerCta.
  ///
  /// In en, this message translates to:
  /// **'to register'**
  String get login_registerCta;

  /// No description provided for @login_dontRemember.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your password?'**
  String get login_dontRemember;

  /// No description provided for @login_resetPasswordCta.
  ///
  /// In en, this message translates to:
  /// **'to reset it'**
  String get login_resetPasswordCta;

  /// No description provided for @login_loggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get login_loggedIn;

  /// No description provided for @login_invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get login_invalidCredentials;

  /// No description provided for @logout_loggedOut.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get logout_loggedOut;

  /// No description provided for @logout_button.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout_button;

  /// No description provided for @register_title.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_title;

  /// No description provided for @register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_button;

  /// No description provided for @register_registerVia.
  ///
  /// In en, this message translates to:
  /// **'Register via'**
  String get register_registerVia;

  /// No description provided for @register_haveAccount.
  ///
  /// In en, this message translates to:
  /// **'You have an account?'**
  String get register_haveAccount;

  /// No description provided for @register_haveAccountCta.
  ///
  /// In en, this message translates to:
  /// **'You have an account?'**
  String get register_haveAccountCta;

  /// No description provided for @register_registered.
  ///
  /// In en, this message translates to:
  /// **'Registration completed successfully. Now you can log in'**
  String get register_registered;

  /// No description provided for @fp_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get fp_title;

  /// No description provided for @fp_button.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get fp_button;

  /// No description provided for @fp_haveResetToken.
  ///
  /// In en, this message translates to:
  /// **'You already have a reset token?'**
  String get fp_haveResetToken;

  /// No description provided for @fp_haveResetTokenCta.
  ///
  /// In en, this message translates to:
  /// **'to reset password'**
  String get fp_haveResetTokenCta;

  /// No description provided for @fp_resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Register via'**
  String get fp_resetPassword;

  /// No description provided for @fp_rememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Did you remember Your password?'**
  String get fp_rememberPassword;

  /// No description provided for @fp_rememberPasswordCta.
  ///
  /// In en, this message translates to:
  /// **'to log in'**
  String get fp_rememberPasswordCta;

  /// No description provided for @rp_title.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get rp_title;

  /// No description provided for @rp_noResetToken.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have a reset token?'**
  String get rp_noResetToken;

  /// No description provided for @rp_noResetTokenCta.
  ///
  /// In en, this message translates to:
  /// **'to get one'**
  String get rp_noResetTokenCta;

  /// No description provided for @rp_rememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Did you remember Your password?'**
  String get rp_rememberPassword;

  /// No description provided for @rp_rememberPasswordCta.
  ///
  /// In en, this message translates to:
  /// **'to log in'**
  String get rp_rememberPasswordCta;

  /// No description provided for @rp_tokenSent.
  ///
  /// In en, this message translates to:
  /// **'If the email is correct, a token to reset your password will be sent to it'**
  String get rp_tokenSent;

  /// No description provided for @rp_passwordReset.
  ///
  /// In en, this message translates to:
  /// **'Success! You can now log in with your new password'**
  String get rp_passwordReset;

  /// No description provided for @update_title.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get update_title;

  /// No description provided for @update_updateButton.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update_updateButton;

  /// No description provided for @update_nextTime.
  ///
  /// In en, this message translates to:
  /// **'Next time'**
  String get update_nextTime;

  /// No description provided for @posts_loaded.
  ///
  /// In en, this message translates to:
  /// **'Posts loaded successfully'**
  String get posts_loaded;

  /// No description provided for @posts_noPosts.
  ///
  /// In en, this message translates to:
  /// **'Posts loaded successfully'**
  String get posts_noPosts;

  /// No description provided for @posts_postCreated.
  ///
  /// In en, this message translates to:
  /// **'Post has been created'**
  String get posts_postCreated;

  /// No description provided for @posts_discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get posts_discover;

  /// No description provided for @posts_create.
  ///
  /// In en, this message translates to:
  /// **'Create a post'**
  String get posts_create;

  /// No description provided for @posts_contentHint.
  ///
  /// In en, this message translates to:
  /// **'Join the conversation'**
  String get posts_contentHint;

  /// No description provided for @posts_contentRequired.
  ///
  /// In en, this message translates to:
  /// **'Content is required'**
  String get posts_contentRequired;

  /// No description provided for @posts_searchGame.
  ///
  /// In en, this message translates to:
  /// **'Search game...'**
  String get posts_searchGame;

  /// No description provided for @posts_game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get posts_game;

  /// No description provided for @posts_addGame.
  ///
  /// In en, this message translates to:
  /// **'Add game'**
  String get posts_addGame;

  /// No description provided for @posts_searchTag.
  ///
  /// In en, this message translates to:
  /// **'Search tag...'**
  String get posts_searchTag;

  /// No description provided for @posts_tag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get posts_tag;

  /// No description provided for @posts_addTag.
  ///
  /// In en, this message translates to:
  /// **'Add tag'**
  String get posts_addTag;

  /// No description provided for @posts_linkTo.
  ///
  /// In en, this message translates to:
  /// **'Link to'**
  String get posts_linkTo;

  /// No description provided for @posts_post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get posts_post;

  /// No description provided for @posts_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get posts_cancel;

  /// No description provided for @posts_trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get posts_trending;

  /// No description provided for @posts_recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get posts_recent;

  /// No description provided for @posts_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get posts_search;

  /// No description provided for @posts_reply.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get posts_reply;

  /// No description provided for @posts_comment.
  ///
  /// In en, this message translates to:
  /// **'Create a comment'**
  String get posts_comment;

  /// No description provided for @posts_commentCreated.
  ///
  /// In en, this message translates to:
  /// **'Comment has been created'**
  String get posts_commentCreated;

  /// No description provided for @posts_reported.
  ///
  /// In en, this message translates to:
  /// **'Post has been reported'**
  String get posts_reported;

  /// No description provided for @posts_deleted.
  ///
  /// In en, this message translates to:
  /// **'Post has been deleted'**
  String get posts_deleted;

  /// No description provided for @navbar_feed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get navbar_feed;

  /// No description provided for @navbar_following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get navbar_following;

  /// No description provided for @navbar_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get navbar_notifications;

  /// No description provided for @navbar_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navbar_profile;

  /// No description provided for @su_searchUserProfile.
  ///
  /// In en, this message translates to:
  /// **'Search user profile'**
  String get su_searchUserProfile;

  /// No description provided for @su_selectUser.
  ///
  /// In en, this message translates to:
  /// **'Select user'**
  String get su_selectUser;

  /// No description provided for @su_search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get su_search;

  /// No description provided for @profile_following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get profile_following;

  /// No description provided for @profile_followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get profile_followers;

  /// No description provided for @profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get profile_edit;

  /// No description provided for @profile_deleteAvatar.
  ///
  /// In en, this message translates to:
  /// **'Delete avatar'**
  String get profile_deleteAvatar;

  /// No description provided for @profile_uploadAvatar.
  ///
  /// In en, this message translates to:
  /// **'Upload avatar'**
  String get profile_uploadAvatar;

  /// No description provided for @profile_takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get profile_takePhoto;

  /// No description provided for @profile_nicknameChanged.
  ///
  /// In en, this message translates to:
  /// **'Nickname changed'**
  String get profile_nicknameChanged;

  /// No description provided for @profile_avatarUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload an image'**
  String get profile_avatarUploadFailed;

  /// No description provided for @profile_avatarUploaded.
  ///
  /// In en, this message translates to:
  /// **'Avatar uploaded successfully'**
  String get profile_avatarUploaded;

  /// No description provided for @profile_avatarDeleted.
  ///
  /// In en, this message translates to:
  /// **'Avatar deleted successfully'**
  String get profile_avatarDeleted;

  /// No description provided for @profile_hardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware'**
  String get profile_hardware;

  /// No description provided for @profile_componentUpdated.
  ///
  /// In en, this message translates to:
  /// **'Component has been updated'**
  String get profile_componentUpdated;

  /// No description provided for @profile_componentNotFound.
  ///
  /// In en, this message translates to:
  /// **'Component not found'**
  String get profile_componentNotFound;

  /// No description provided for @profile_componentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Component has been deleted'**
  String get profile_componentDeleted;

  /// No description provided for @profile_componentTitle.
  ///
  /// In en, this message translates to:
  /// **'Component type'**
  String get profile_componentTitle;

  /// No description provided for @profile_componentValue.
  ///
  /// In en, this message translates to:
  /// **'Component model'**
  String get profile_componentValue;

  /// No description provided for @tfa_title.
  ///
  /// In en, this message translates to:
  /// **'Two-factory authentication'**
  String get tfa_title;

  /// No description provided for @tfa_dontShareCode.
  ///
  /// In en, this message translates to:
  /// **'Do not share this code with anyone.\nIt is valid for a limited time only.'**
  String get tfa_dontShareCode;

  /// No description provided for @tfa_generateCode.
  ///
  /// In en, this message translates to:
  /// **'Generate new code'**
  String get tfa_generateCode;

  /// No description provided for @tfa_getCode.
  ///
  /// In en, this message translates to:
  /// **'Get code'**
  String get tfa_getCode;

  /// No description provided for @tfa_codeExpired.
  ///
  /// In en, this message translates to:
  /// **'Code expired'**
  String get tfa_codeExpired;

  /// No description provided for @tfa_codeExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'Code expires in'**
  String get tfa_codeExpiresIn;

  /// No description provided for @user_ban.
  ///
  /// In en, this message translates to:
  /// **'Ban user'**
  String get user_ban;

  /// No description provided for @user_report.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get user_report;

  /// No description provided for @user_reported.
  ///
  /// In en, this message translates to:
  /// **'User has been reported'**
  String get user_reported;

  /// No description provided for @user_banned.
  ///
  /// In en, this message translates to:
  /// **'User has been banned'**
  String get user_banned;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
  ];

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @homeAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available for new projects'**
  String get homeAvailable;

  /// No description provided for @homeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get homeTitle1;

  /// No description provided for @homeTitle2.
  ///
  /// In en, this message translates to:
  /// **'Creating digital solutions'**
  String get homeTitle2;

  /// No description provided for @homeDescription.
  ///
  /// In en, this message translates to:
  /// **'Specialized in modern web development, transforming ideas into scalable and performant applications focused on user experience.'**
  String get homeDescription;

  /// No description provided for @kpiYearsLabel.
  ///
  /// In en, this message translates to:
  /// **'Years of experience'**
  String get kpiYearsLabel;

  /// No description provided for @kpiProjectsLabel.
  ///
  /// In en, this message translates to:
  /// **'Completed projects'**
  String get kpiProjectsLabel;

  /// No description provided for @kpiClientsLabel.
  ///
  /// In en, this message translates to:
  /// **'Satisfied clients'**
  String get kpiClientsLabel;

  /// No description provided for @actionViewProjects.
  ///
  /// In en, this message translates to:
  /// **'View projects'**
  String get actionViewProjects;

  /// No description provided for @actionContact.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get actionContact;

  /// No description provided for @actionDownloadCV.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get actionDownloadCV;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skillsTitle;

  /// No description provided for @skillsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical expertise and competencies'**
  String get skillsSubtitle;

  /// No description provided for @skillsDescription.
  ///
  /// In en, this message translates to:
  /// **'A comprehensive set of technologies and skills to deliver complete, high-quality solutions.'**
  String get skillsDescription;

  /// No description provided for @expBadge.
  String get expBadge;

  /// No description provided for @expTitle.
  String get expTitle;

  /// No description provided for @expDescription.
  String get expDescription;

  /// No description provided for @expDownloadResume.
  String get expDownloadResume;

  /// No description provided for @expCurrentLabel.
  String get expCurrentLabel;

  /// No description provided for @expAchievementsLabel.
  String get expAchievementsLabel;

  /// No description provided for @expTechnologiesLabel.
  String get expTechnologiesLabel;

  /// No description provided for @skillsFrontend.
  String get skillsFrontend;

  /// No description provided for @skillsBackend.
  String get skillsBackend;

  /// No description provided for @skillsDevOps.
  String get skillsDevOps;

  /// No description provided for @skillsSoftSkills.
  String get skillsSoftSkills;

  /// No description provided for @expJobTitle.
  String get expJobTitle;

  /// No description provided for @expCompany.
  String get expCompany;

  /// No description provided for @expDateRange.
  String get expDateRange;

  /// No description provided for @expLocation.
  String get expLocation;

  /// No description provided for @expJobDescription.
  String get expJobDescription;

  /// No description provided for @expAchievement1.
  String get expAchievement1;

  /// No description provided for @expAchievement2.
  String get expAchievement2;

  /// No description provided for @expAchievement3.
  String get expAchievement3;

  /// No description provided for @projectsBadge.
  String get projectsBadge;

  /// No description provided for @projectsTitle.
  String get projectsTitle;

  /// No description provided for @projectsDescription.
  String get projectsDescription;

  /// No description provided for @projectCardTitle.
  String get projectCardTitle;

  /// No description provided for @projectCardDescription.
  String get projectCardDescription;

  /// No description provided for @contactBadge.
  String get contactBadge;

  /// No description provided for @contactTitle.
  String get contactTitle;

  /// No description provided for @contactDescription.
  String get contactDescription;

  /// No description provided for @contactLabelEmail.
  String get contactLabelEmail;

  /// No description provided for @contactLabelGithub.
  String get contactLabelGithub;

  /// No description provided for @contactLabelLinkedin.
  String get contactLabelLinkedin;

  /// No description provided for @contactLabelLocation.
  String get contactLabelLocation;

  /// No description provided for @contactLocationValue.
  String get contactLocationValue;

  /// No description provided for @contactFormName.
  String get contactFormName;

  /// No description provided for @contactFormNameHint.
  String get contactFormNameHint;

  /// No description provided for @contactFormEmail.
  String get contactFormEmail;

  /// No description provided for @contactFormEmailHint.
  String get contactFormEmailHint;

  /// No description provided for @contactFormMessage.
  String get contactFormMessage;

  /// No description provided for @contactFormMessageHint.
  String get contactFormMessageHint;

  /// No description provided for @contactFormSubmit.
  String get contactFormSubmit;

  /// No description provided for @softSkillTeamwork.
  String get softSkillTeamwork;

  /// No description provided for @softSkillCommunication.
  String get softSkillCommunication;

  /// No description provided for @softSkillProblemSolving.
  String get softSkillProblemSolving;

  /// No description provided for @softSkillTimeManagement.
  String get softSkillTimeManagement;

  /// No description provided for @softSkillAdaptability.
  String get softSkillAdaptability;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
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
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactTitle;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get contactEmail;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @formName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get formName;

  /// No description provided for @formEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get formEmail;

  /// No description provided for @formMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get formMessage;

  /// No description provided for @formSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get formSubmit;

  /// No description provided for @formSuccess.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully!'**
  String get formSuccess;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navKnowledge;

  /// No description provided for @navPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Portifolio'**
  String get navPortfolio;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @homeRole.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer'**
  String get homeRole;

  /// No description provided for @homeIntro1.
  ///
  /// In en, this message translates to:
  /// **'This is my official Website and Portfolio.'**
  String get homeIntro1;

  /// No description provided for @homeIntro2.
  ///
  /// In en, this message translates to:
  /// **'All details of the work developed by me are here.'**
  String get homeIntro2;

  /// No description provided for @downloadResume.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD RESUME'**
  String get downloadResume;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'about'**
  String get aboutTitle;

  /// No description provided for @aboutHeadline.
  ///
  /// In en, this message translates to:
  /// **'Hello, my name is Davi Borges and I graduated in Computer Science from the Catholic University of Brasília. I have been working in the area for 7 years and have developed applications for the companies I passed through. I am extremely motivated and I am always constantly developing my skills.'**
  String get aboutHeadline;

  /// No description provided for @aboutNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get aboutNameLabel;

  /// No description provided for @aboutNameValue.
  ///
  /// In en, this message translates to:
  /// **'Davi Borges'**
  String get aboutNameValue;

  /// No description provided for @aboutEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get aboutEmailLabel;

  /// No description provided for @aboutEmailValue.
  ///
  /// In en, this message translates to:
  /// **'daviborges.sistemas@gmail.com'**
  String get aboutEmailValue;

  /// No description provided for @aboutAgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get aboutAgeLabel;

  /// No description provided for @aboutAgeValue.
  ///
  /// In en, this message translates to:
  /// **'35 years old'**
  String get aboutAgeValue;

  /// No description provided for @aboutCNPJLabel.
  ///
  /// In en, this message translates to:
  /// **'CNPJ'**
  String get aboutCNPJLabel;

  /// No description provided for @aboutCNPJValue.
  ///
  /// In en, this message translates to:
  /// **'44.635.964/0001-81'**
  String get aboutCNPJValue;

  /// No description provided for @aboutFromLabel.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get aboutFromLabel;

  /// No description provided for @aboutFromValue.
  ///
  /// In en, this message translates to:
  /// **'Brasília, Federal District'**
  String get aboutFromValue;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'my experiences'**
  String get experienceTitle;

  /// No description provided for @job1Title.
  ///
  /// In en, this message translates to:
  /// **'Condomínio de Soluções Corporativas'**
  String get job1Title;

  /// No description provided for @job1Period.
  ///
  /// In en, this message translates to:
  /// **'Oct/2010 - Jan/2011'**
  String get job1Period;

  /// No description provided for @job1Role.
  ///
  /// In en, this message translates to:
  /// **'Intern'**
  String get job1Role;

  /// No description provided for @job1Desc.
  ///
  /// In en, this message translates to:
  /// **'Responsible for data analysis and performing loads in the Data Warehouse.'**
  String get job1Desc;

  /// No description provided for @job1Stack.
  ///
  /// In en, this message translates to:
  /// **'Sql Server, Data Warehouse'**
  String get job1Stack;

  /// No description provided for @job2Title.
  ///
  /// In en, this message translates to:
  /// **'Instituto Brasília de Tecnologia e Inovação'**
  String get job2Title;

  /// No description provided for @job2Period.
  ///
  /// In en, this message translates to:
  /// **'Oct/2012 - Jul/2014'**
  String get job2Period;

  /// No description provided for @job2Role.
  ///
  /// In en, this message translates to:
  /// **'Systems Analyst'**
  String get job2Role;

  /// No description provided for @job2Desc.
  ///
  /// In en, this message translates to:
  /// **'Mobile apps development'**
  String get job2Desc;

  /// No description provided for @job2Stack.
  ///
  /// In en, this message translates to:
  /// **'Objective-C, Android(Java), JavaScript, Phonegap'**
  String get job2Stack;

  /// No description provided for @job3Title.
  ///
  /// In en, this message translates to:
  /// **'CEAS'**
  String get job3Title;

  /// No description provided for @job3Period.
  ///
  /// In en, this message translates to:
  /// **'Jan/2015 - Dec/2015'**
  String get job3Period;

  /// No description provided for @job3Role.
  ///
  /// In en, this message translates to:
  /// **'Professor'**
  String get job3Role;

  /// No description provided for @job3Desc.
  ///
  /// In en, this message translates to:
  /// **'Teaching digital inclusion course'**
  String get job3Desc;

  /// No description provided for @job3Stack.
  ///
  /// In en, this message translates to:
  /// **'Windows, Office Package'**
  String get job3Stack;

  /// No description provided for @job4Title.
  ///
  /// In en, this message translates to:
  /// **'Happy Code'**
  String get job4Title;

  /// No description provided for @job4Period.
  ///
  /// In en, this message translates to:
  /// **'Fez/2017 - Dec/2017'**
  String get job4Period;

  /// No description provided for @job4Role.
  ///
  /// In en, this message translates to:
  /// **'Professor'**
  String get job4Role;

  /// No description provided for @job4Desc.
  ///
  /// In en, this message translates to:
  /// **'Teaching programming to children and teenagers'**
  String get job4Desc;

  /// No description provided for @job4Stack.
  ///
  /// In en, this message translates to:
  /// **'Scratch,Construct 2, Unity, Blender'**
  String get job4Stack;

  /// No description provided for @job5Title.
  ///
  /// In en, this message translates to:
  /// **'Wooba'**
  String get job5Title;

  /// No description provided for @job5Period.
  ///
  /// In en, this message translates to:
  /// **'Jan/2018 - Feb/2019'**
  String get job5Period;

  /// No description provided for @job5Role.
  ///
  /// In en, this message translates to:
  /// **'Junior Mobile Developer'**
  String get job5Role;

  /// No description provided for @job5Desc.
  ///
  /// In en, this message translates to:
  /// **'Android apps development'**
  String get job5Desc;

  /// No description provided for @job5Stack.
  ///
  /// In en, this message translates to:
  /// **'Json, Rest Api, Android(Java), OTP'**
  String get job5Stack;

  /// No description provided for @job6Title.
  ///
  /// In en, this message translates to:
  /// **'Liberty'**
  String get job6Title;

  /// No description provided for @job6Period.
  ///
  /// In en, this message translates to:
  /// **'Mar/2019 - Dec/2019'**
  String get job6Period;

  /// No description provided for @job6Role.
  ///
  /// In en, this message translates to:
  /// **'Junior Mobile Developer'**
  String get job6Role;

  /// No description provided for @job6Desc.
  ///
  /// In en, this message translates to:
  /// **'Android and iOS apps development'**
  String get job6Desc;

  /// No description provided for @job6Stack.
  ///
  /// In en, this message translates to:
  /// **'Json, Rest Api, Ionic'**
  String get job6Stack;

  /// No description provided for @job7Title.
  ///
  /// In en, this message translates to:
  /// **'Montreal Hotéis Viagens e Turismo S.A.'**
  String get job7Title;

  /// No description provided for @job7Period.
  ///
  /// In en, this message translates to:
  /// **'Jan/2020 - Dec/2021'**
  String get job7Period;

  /// No description provided for @job7Role.
  ///
  /// In en, this message translates to:
  /// **'Mid-level Mobile Developer'**
  String get job7Role;

  /// No description provided for @job7Desc.
  ///
  /// In en, this message translates to:
  /// **'Android and iOS apps development'**
  String get job7Desc;

  /// No description provided for @job7Stack.
  ///
  /// In en, this message translates to:
  /// **'Flutter ,Json, Rest Api, C#, MongoDB'**
  String get job7Stack;

  /// No description provided for @job8Title.
  ///
  /// In en, this message translates to:
  /// **'Mirante Tecnologia.'**
  String get job8Title;

  /// No description provided for @job8Period.
  ///
  /// In en, this message translates to:
  /// **'Dec/2021 - Jan/2022'**
  String get job8Period;

  /// No description provided for @job8Role.
  ///
  /// In en, this message translates to:
  /// **'Mid-level Mobile Developer'**
  String get job8Role;

  /// No description provided for @job8Desc.
  ///
  /// In en, this message translates to:
  /// **'Android and iOS apps development'**
  String get job8Desc;

  /// No description provided for @job8Stack.
  ///
  /// In en, this message translates to:
  /// **'JSP ,Json, Rest Api, SQL Server'**
  String get job8Stack;

  /// No description provided for @job9Title.
  ///
  /// In en, this message translates to:
  /// **'Montreal Hotéis Viagens e Turismo S.A.'**
  String get job9Title;

  /// No description provided for @job9Period.
  ///
  /// In en, this message translates to:
  /// **'Jan/2020 - Current'**
  String get job9Period;

  /// No description provided for @job9Role.
  ///
  /// In en, this message translates to:
  /// **'Freelancer'**
  String get job9Role;

  /// No description provided for @job9Desc.
  ///
  /// In en, this message translates to:
  /// **'Android and iOS apps development'**
  String get job9Desc;

  /// No description provided for @job9Stack.
  ///
  /// In en, this message translates to:
  /// **'Flutter ,Json, Rest Api, C#, MongoDB'**
  String get job9Stack;

  /// No description provided for @knowledgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get knowledgeTitle;

  /// No description provided for @portfolioTitle.
  ///
  /// In en, this message translates to:
  /// **'portfolio'**
  String get portfolioTitle;

  /// No description provided for @formError.
  ///
  /// In en, this message translates to:
  /// **'Error sending message. Please try again.'**
  String get formError;

  /// No description provided for @validationName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get validationName;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get validationEmail;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validationEmailInvalid;

  /// No description provided for @validationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter your message'**
  String get validationMessage;
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
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

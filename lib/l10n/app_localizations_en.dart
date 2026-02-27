import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Home';

  @override
  String get navAbout => 'About';

  @override
  String get navExperience => 'Experience';

  @override
  String get navKnowledge => 'Skills';

  @override
  String get navPortfolio => 'Portfolio';

  @override
  String get navContact => 'Contact';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Available for new projects';

  @override
  String get homeTitle1 => 'Full Stack Developer';

  @override
  String get homeTitle2 => 'Creating digital solutions';

  @override
  String get homeDescription =>
      'Specialized in modern web development, transforming ideas into scalable and performant applications focused on user experience.';

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => 'Years of experience';

  @override
  String get kpiProjectsLabel => 'Completed projects';

  @override
  String get kpiClientsLabel => 'Satisfied clients';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'View projects';

  @override
  String get actionContact => 'Get in touch';

  @override
  String get actionDownloadCV => 'Download CV';
}

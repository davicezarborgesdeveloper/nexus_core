import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Startseite';

  @override
  String get navSkills => 'Fähigkeiten';

  @override
  String get navExperience => 'Erfahrung';

  @override
  String get navProjects => 'Projekte';

  @override
  String get navContact => 'Kontakt';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Verfügbar für neue Projekte';

  @override
  String get homeTitle1 => 'Full-Stack-Entwickler';

  @override
  String get homeTitle2 => 'Digitale Lösungen entwickeln';

  @override
  String get homeDescription =>
      'Spezialisiert auf moderne Webentwicklung und die Umsetzung von Ideen in skalierbare und leistungsstarke Anwendungen mit Fokus auf die Nutzererfahrung.';

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => 'Jahre Erfahrung';

  @override
  String get kpiProjectsLabel => 'Abgeschlossene Projekte';

  @override
  String get kpiClientsLabel => 'Zufriedene Kunden';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'Projekte ansehen';

  @override
  String get actionContact => 'Kontakt aufnehmen';

  @override
  String get actionDownloadCV => 'Lebenslauf herunterladen';

  @override
  String get skillsTitle => 'Fähigkeiten';
}

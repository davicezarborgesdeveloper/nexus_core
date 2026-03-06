import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Home';

  @override
  String get navSkills => 'Competenze';

  @override
  String get navExperience => 'Esperienza';

  @override
  String get navProjects => 'Progetti';

  @override
  String get navContact => 'Contatti';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Disponibile per nuovi progetti';

  @override
  String get homeTitle1 => 'Sviluppatore Full Stack';

  @override
  String get homeTitle2 => 'Creando soluzioni digitali';

  @override
  String get homeDescription =>
      "Specializzato nello sviluppo web moderno, trasformando idee in applicazioni scalabili e performanti con focus sull'esperienza utente.";

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => 'Anni di esperienza';

  @override
  String get kpiProjectsLabel => 'Progetti completati';

  @override
  String get kpiClientsLabel => 'Clienti soddisfatti';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'Vedi progetti';

  @override
  String get actionContact => 'Contattami';

  @override
  String get actionDownloadCV => 'Scarica CV';

  @override
  String get skillsTitle => 'Competenze';
}

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Accueil';

  @override
  String get navSkills => 'Compétences';

  @override
  String get navExperience => 'Expérience';

  @override
  String get navProjects => 'Projets';

  @override
  String get navContact => 'Contact';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Disponible pour de nouveaux projets';

  @override
  String get homeTitle1 => 'Développeur Full Stack';

  @override
  String get homeTitle2 => 'Créer des solutions numériques';

  @override
  String get homeDescription =>
      "Spécialisé dans le développement web moderne, transformant les idées en applications évolutives et performantes axées sur l'expérience utilisateur.";

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => "Années d'expérience";

  @override
  String get kpiProjectsLabel => 'Projets réalisés';

  @override
  String get kpiClientsLabel => 'Clients satisfaits';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'Voir les projets';

  @override
  String get actionContact => 'Me contacter';

  @override
  String get actionDownloadCV => 'Télécharger CV';

  @override
  String get skillsTitle => 'Compétences';
}

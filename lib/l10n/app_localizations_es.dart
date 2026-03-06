import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Inicio';

  @override
  String get navSkills => 'Habilidades';

  @override
  String get navExperience => 'Experiencia';

  @override
  String get navProjects => 'Proyectos';

  @override
  String get navContact => 'Contacto';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Disponible para nuevos proyectos';

  @override
  String get homeTitle1 => 'Desarrollador Full Stack';

  @override
  String get homeTitle2 => 'Creando soluciones digitales';

  @override
  String get homeDescription =>
      'Especializado en desarrollo web moderno, transformando ideas en aplicaciones escalables y eficientes enfocadas en la experiencia del usuario.';

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => 'Años de experiencia';

  @override
  String get kpiProjectsLabel => 'Proyectos completados';

  @override
  String get kpiClientsLabel => 'Clientes satisfechos';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'Ver proyectos';

  @override
  String get actionContact => 'Ponerse en contacto';

  @override
  String get actionDownloadCV => 'Descargar CV';

  @override
  String get skillsTitle => 'Habilidades';
}

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  // --- Navigation ---
  @override
  String get navHome => 'Home';

  @override
  String get navSkills => 'Habilidades';

  @override
  String get navExperience => 'Experiências';

  @override
  String get navProjects => 'Projetos';

  @override
  String get navContact => 'Contato';

  // --- Home Page ---
  @override
  String get homeAvailable => 'Disponível para novos projetos';

  @override
  String get homeTitle1 => 'Desenvolvedor Full Stack';

  @override
  String get homeTitle2 => 'Criando soluções digitais';

  @override
  String get homeDescription =>
      'Especializado em desenvolvimento web moderno, transformando ideias em aplicações escaláveis e performáticas com foco em experiência do usuário.';

  // --- KPI Metrics ---
  @override
  String get kpiYearsLabel => 'Anos de experiência';

  @override
  String get kpiProjectsLabel => 'Projetos concluídos';

  @override
  String get kpiClientsLabel => 'Clientes satisfeitos';

  // --- Action Buttons ---
  @override
  String get actionViewProjects => 'Ver projetos';

  @override
  String get actionContact => 'Entre em contato';

  @override
  String get actionDownloadCV => 'Baixar CV';
}

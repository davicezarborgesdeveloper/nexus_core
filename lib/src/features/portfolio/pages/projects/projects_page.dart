import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/features/portfolio/pages/projects/widgets/github_button_projects.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../models/menu_item.dart';
import 'widgets/project_card.dart';
import 'widgets/projects_header.dart';

class ProjectsPage extends StatefulWidget {
  final MenuItem menu;
  ProjectsPage(this.menu, {Key? key}) : super(key: key ?? menu.key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: ColorManager.background,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 24
            : context.isTablet
            ? 48
            : 128,
        vertical: context.isMobile ? 48 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProjectsHeader(),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              ProjectCard(
                imageUrl: 'https://picsum.photos/590/256',
                title: l10n.projectCardTitle,
                description: l10n.projectCardDescription,
                technologies: const ['Flutter', 'Dart', 'Firebase', 'REST API'],
              ),
              ProjectCard(
                imageUrl: 'https://picsum.photos/590/256',
                title: l10n.projectCardTitle,
                description: l10n.projectCardDescription,
                technologies: const ['Flutter', 'Firebase'],
              ),
              ProjectCard(
                imageUrl: 'https://picsum.photos/590/256',
                title: l10n.projectCardTitle,
                description: l10n.projectCardDescription,
                technologies: const ['Flutter', 'Dart', 'Firebase', 'REST API'],
              ),
              ProjectCard(
                imageUrl: 'https://picsum.photos/590/256',
                title: l10n.projectCardTitle,
                description: l10n.projectCardDescription,
                technologies: const ['Flutter', 'Firebase'],
              ),
            ],
          ),
          SizedBox(height: 48),
          GithubButtonProjects(),
          SizedBox(height: 64),
        ],
      ),
    );
  }
}

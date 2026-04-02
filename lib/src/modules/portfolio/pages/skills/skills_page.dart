import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/modules/portfolio/pages/skills/widgets/skills_tiles.dart';
import 'package:nexus_core/src/modules/portfolio/widgets/section_header.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../models/menu_item.dart';

class SkillsPage extends StatelessWidget {
  final MenuItem menu;
  SkillsPage(this.menu, {Key? key}) : super(key: key ?? menu.key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ColoredBox(
      color: ColorManager.neutral.shade50,
      child: Padding(
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
            SectionHeader(
              badge: l10n.skillsTitle,
              title: l10n.skillsSubtitle,
              description: l10n.skillsDescription,
            ),
            const SizedBox(height: 64),
            const _SkillsGrid(),
          ],
        ),
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tiles = [
      (
        icon: Icons.code,
        title: l10n.skillsFrontend,
        itens: ['React', 'TypeScript', 'Next.js', 'Tailwind CSS', 'Flutter'],
      ),
      (
        icon: Icons.terminal_outlined,
        title: l10n.skillsBackend,
        itens: ['Node.js', 'Python', 'PostgreSQL', 'Rest APIs', 'GraphQL'],
      ),
      (
        icon: Icons.rocket_launch_outlined,
        title: l10n.skillsDevOps,
        itens: ['Docker', 'AWS', 'CI/CD', 'Git', 'Firebase'],
      ),
      (
        icon: Icons.bolt,
        title: l10n.skillsSoftSkills,
        itens: [
          l10n.softSkillTeamwork,
          l10n.softSkillCommunication,
          l10n.softSkillProblemSolving,
          l10n.softSkillTimeManagement,
          l10n.softSkillAdaptability,
        ],
      ),
    ];

    final crossAxisCount = context.isMobile
        ? 1
        : context.isTablet
        ? 2
        : 4;
    final spacing = 24.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final tileWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
            crossAxisCount;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: tiles
              .map(
                (t) => SizedBox(
                  width: tileWidth,
                  child: SkillsTiles(
                    icon: t.icon,
                    title: t.title,
                    itens: t.itens,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

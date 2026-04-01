import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/features/portfolio/widgets/section_header.dart';
import '../../../../../core/resources/color_manager.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SectionHeader(
      badge: l10n.projectsBadge,
      title: l10n.projectsTitle,
      description: l10n.projectsDescription,
      badgeColor: ColorManager.accent,
    );
  }
}

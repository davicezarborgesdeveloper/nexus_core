import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/pages/skills/widgets/skills_tiles.dart';

import '../../../../../l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
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
            Container(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                l10n.skillsTitle,
                style: getMediumStyle(
                  color: ColorManager.background,
                  fontSize: FontSize.s14,
                ).inter,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: context.isMobile ? double.infinity : context.percentWidth(.5),
              child: Text(
                'Expertise técnica e competências',
                style: getBoldStyle(
                  color: ColorManager.neutral.shade900,
                  fontSize: context.isMobile ? FontSize.s32 : FontSize.s48,
                ).inter,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: context.isMobile ? double.infinity : context.percentWidth(.5),
              child: Text(
                'Conjunto abrangente de tecnologias e habilidades para entregar soluções completas de alta qualidade.',
                style: getRegularStyle(
                  color: ColorManager.secondary,
                  fontSize: context.isMobile ? FontSize.s16 : FontSize.s18,
                ).inter,
              ),
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
  static const _tiles = [
    (icon: Icons.code, title: 'Frontend', itens: ['React', 'TypeScript', 'Next.js', 'Tailwind CSS', 'Flutter']),
    (icon: Icons.terminal_outlined, title: 'Backend', itens: ['Node.js', 'Python', 'PostgreSQL', 'Rest APIs', 'GraphQL']),
    (icon: Icons.rocket_launch_outlined, title: 'DevOps', itens: ['Docker', 'AWS', 'CI/CD', 'Git', 'Firebase']),
    (icon: Icons.bolt, title: 'Soft Skills', itens: ['Trabalho em equipe', 'Comunicação', 'Resolução de problemas', 'Gestão de tempo', 'Adaptabilidade']),
  ];

  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = context.isMobile ? 1 : context.isTablet ? 2 : 4;
    final spacing = 24.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final tileWidth = (constraints.maxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: _tiles.map((t) => SizedBox(
            width: tileWidth,
            child: SkillsTiles(icon: t.icon, title: t.title, itens: t.itens),
          )).toList(),
        );
      },
    );
  }
}

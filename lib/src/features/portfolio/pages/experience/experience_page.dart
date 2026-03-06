import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../models/menu_item.dart';

class ExperiencePage extends StatefulWidget {
  final MenuItem menu;
  ExperiencePage(this.menu, {Key? key}) : super(key: key ?? menu.key);
  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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
              'Trajetória',
              style: getRegularStyle(
                color: ColorManager.neutral.shade700,
                fontSize: FontSize.s14,
              ).inter,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: context.isMobile
                ? double.infinity
                : context.percentWidth(.5),
            child: Text(
              'Experiência profissional',
              style: getBoldStyle(
                color: ColorManager.neutral.shade900,
                fontSize: context.isMobile ? FontSize.s32 : FontSize.s48,
              ).inter,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: context.isMobile
                ? double.infinity
                : context.percentWidth(.5),
            child: Text(
              'Mais de 6 anos construindo soluções digitais inovadoras e liderando projetos de alto impacto.',
              style: getRegularStyle(
                color: ColorManager.secondary,
                fontSize: context.isMobile ? FontSize.s16 : FontSize.s18,
              ).inter,
            ),
          ),
          const SizedBox(height: 64),
          const _ExperienceGrid(),
        ],
      ),
    );
  }
}

class _ExperienceGrid extends StatelessWidget {
  const _ExperienceGrid();

  static final _tiles = [
    Timeline(
      experiences: [
        Experience(
          title: "Senior Full Stack Developer",
          company: "TechCorp Solutions",
          period: "Jan 2023 - Presente",
          description: "Liderança técnica no desenvolvimento...",
          techs: ["React", "Node.js", "AWS", "Docker"],
        ),
        Experience(
          title: "Full Stack Developer",
          company: "StartupX",
          period: "Mar 2021 - Dez 2022",
          description: "Desenvolvimento SaaS...",
          techs: ["Next.js", "Python", "MongoDB"],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(color: ColorManager.background);
  }
}

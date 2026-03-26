import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/section_label.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/tech_chip.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/bullet_item.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import 'package:nexus_core/l10n/app_localizations.dart';

class TimelineExperience extends StatelessWidget {
  const TimelineExperience({
    super.key,
    this.isFirst = false,
    this.isLast = false,
  });

  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: ColorManager.neutral.shade200,
        thickness: 1,
      ),
      afterLineStyle: LineStyle(
        color: ColorManager.neutral.shade200,
        thickness: 1,
      ),
      indicatorStyle: isFirst
          ? IndicatorStyle(
              width: 20,
              indicator: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primaryLight,
                  border: Border.all(color: ColorManager.primary, width: 4),
                ),
              ),
            )
          : IndicatorStyle(
              width: 20,
              indicator: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.background,
                  border: Border.all(
                    color: ColorManager.neutral.shade300,
                    width: 2,
                  ),
                ),
              ),
            ),
      endChild: Container(
        margin: EdgeInsets.only(left: 30, bottom: isLast ? 0 : 48),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: ColorManager.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.neutral.shade200, width: 2),
        ),
        constraints: const BoxConstraints(minHeight: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.neutral.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Icon(
                    Icons.business_center_outlined,
                    color: ColorManager.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senior Full Stack Developer',
                        style: getBoldStyle(
                          color: ColorManager.foreground,
                          fontSize: context.isMobile ? FontSize.s18 : FontSize.s24,
                        ).spaceGrotesk,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'TechCorp Solutions',
                        style: getMediumStyle(
                          color: ColorManager.primary,
                          fontSize: context.isMobile ? FontSize.s16 : FontSize.s18,
                        ).inter,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 14,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: ColorManager.secondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Jan 2020 - Present',
                      style: getRegularStyle(
                        fontSize: 14,
                        color: ColorManager.secondary,
                      ).inter,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.accent,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.expCurrentLabel,
                    style: getMediumStyle(
                      color: ColorManager.foreground,
                      fontSize: FontSize.s12,
                    ).inter,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: ColorManager.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'São Paulo, SP',
                      style: getRegularStyle(
                        fontSize: 14,
                        color: ColorManager.secondary,
                      ).inter,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Responsável por liderar o desenvolvimento de soluções web e mobile, utilizando tecnologias como Flutter, React e Node.js. Implementação de APIs RESTful, integração com bancos de dados e otimização de performance. Colaboração com equipes multidisciplinares para garantir a entrega de projetos dentro do prazo e com alta qualidade.',
              style: getRegularStyle(
                fontSize: 16,
                color: ColorManager.secondary,
              ).inter,
            ),
            const SizedBox(height: 20),
            SectionLabel(AppLocalizations.of(context)!.expAchievementsLabel),
            const SizedBox(height: 8),
            const Column(
              children: [
                BulletItem(
                  'Reduzi o tempo de carregamento da aplicação principal em 60% através de otimizações',
                ),
                SizedBox(height: 8),
                BulletItem(
                  'Implementei pipeline CI/CD completo reduzindo tempo de deploy de 2h para 15min',
                ),
                SizedBox(height: 8),
                BulletItem(
                  'Liderei equipe de 5 desenvolvedores em projeto de migração de monolito para microserviços',
                ),
              ],
            ),
            const SizedBox(height: 16),
            SectionLabel(AppLocalizations.of(context)!.expTechnologiesLabel),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TechChip('Flutter'),
                TechChip('React'),
                TechChip('Node.js'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

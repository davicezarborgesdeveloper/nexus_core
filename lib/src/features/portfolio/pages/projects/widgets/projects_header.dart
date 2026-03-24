import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: ColorManager.accent,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Text(
            'Portifólio',
            style: getRegularStyle(
              color: ColorManager.background,
              fontSize: FontSize.s14,
            ).inter,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: context.isMobile ? double.infinity : context.percentWidth(.5),
          child: Text(
            'Projetos em destaque',
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
            'Uma seleção de projetos que demonstram minha capacidade de criar soluções completas e escaláveis.',
            style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: context.isMobile ? FontSize.s16 : FontSize.s18,
            ).inter,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nexus_core/src/features/portfolio/widgets/section_header.dart';
import '../../../../../core/resources/color_manager.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      badge: 'Portifólio',
      title: 'Projetos em destaque',
      description:
          'Uma seleção de projetos que demonstram minha capacidade de criar soluções completas e escaláveis.',
      badgeColor: ColorManager.accent,
    );
  }
}

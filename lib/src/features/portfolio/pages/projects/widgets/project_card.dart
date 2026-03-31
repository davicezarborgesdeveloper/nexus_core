import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import 'tech_badge.dart';

class ProjectCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder(
        valueListenable: isHovered,
        builder: (context, hovered, _) => Material(
          elevation: hovered ? 16 : 4,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: () {
              // ação do clique
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: context.isMobile ? double.infinity : 590,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                    child: AnimatedScale(
                      scale: hovered ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 256,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: getBoldStyle(
                            color: ColorManager.foreground,
                            fontSize: context.isMobile
                                ? FontSize.s20
                                : FontSize.s24,
                          ).spaceGrotesk,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.description,
                          style: getRegularStyle(
                            color: ColorManager.secondary,
                            fontSize: FontSize.s16,
                          ).inter,
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: widget.technologies
                              .map((tech) => TechBadge(label: tech))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

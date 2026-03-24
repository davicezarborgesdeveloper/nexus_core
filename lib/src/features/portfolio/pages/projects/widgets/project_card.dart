import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import 'tech_badge.dart';

class ProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: Colors.white,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: () {
          // ação do clique
        },
        child: Container(
          width: 590,
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
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 256,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: getBoldStyle(
                        color: ColorManager.foreground,
                        fontSize: FontSize.s24,
                      ).spaceGrotesk,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: getRegularStyle(
                        color: ColorManager.secondary,
                        fontSize: FontSize.s16,
                      ).inter,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: technologies
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
    );
  }
}

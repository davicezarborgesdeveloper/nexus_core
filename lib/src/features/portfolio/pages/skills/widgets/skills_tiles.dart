import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

import '../../../../../core/resources/font_manager.dart';

class SkillsTiles extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> itens;
  const SkillsTiles({
    super.key,
    required this.icon,
    required this.title,
    required this.itens,
  });

  @override
  Widget build(BuildContext context) {
    final hovered = ValueNotifier<bool>(false);

    return MouseRegion(
      onEnter: (_) => hovered.value = true,
      onExit: (_) => hovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: hovered,
        builder: (context, isHovered, _) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: ColorManager.background,
            border: Border.all(color: ColorManager.neutral.shade200, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: ColorManager.shadow.withValues(alpha: isHovered ? 0.15 : 0.1),
                blurRadius: isHovered ? 24 : 3,
                spreadRadius: isHovered ? 4 : 0,
                offset: isHovered ? const Offset(0, 8) : const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: ColorManager.neutral.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Icon(icon, color: ColorManager.primary),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: getBoldStyle(
                  color: ColorManager.neutral.shade900,
                  fontSize: context.isMobile ? FontSize.s18 : FontSize.s20,
                ).spaceGrotesk,
              ),
              const SizedBox(height: 12),
              ...itens.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: ColorManager.accent,
                          borderRadius: const BorderRadius.all(Radius.circular(3)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item,
                          style: getRegularStyle(
                            color: ColorManager.neutral.shade600,
                            fontSize: FontSize.s16,
                          ).inter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

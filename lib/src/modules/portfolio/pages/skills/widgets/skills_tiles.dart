import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

import '../../../../../core/resources/font_manager.dart';

class SkillsTiles extends StatefulWidget {
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
  State<SkillsTiles> createState() => _SkillsTilesState();
}

class _SkillsTilesState extends State<SkillsTiles> {
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
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, hovered ? -4 : 0, 0),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: ColorManager.background,
              border: Border.all(
                color: hovered
                    ? ColorManager.foreground
                    : ColorManager.neutral.shade200,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.shadow.withValues(
                    alpha: hovered ? 0.18 : 0.08,
                  ),
                  blurRadius: hovered ? 24 : 6,
                  spreadRadius: hovered ? 2 : 0,
                  offset: hovered ? const Offset(0, 10) : const Offset(0, 2),
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
                  child: Icon(widget.icon, color: ColorManager.primary),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: getBoldStyle(
                    color: ColorManager.neutral.shade900,
                    fontSize: context.isMobile ? FontSize.s18 : FontSize.s20,
                  ).spaceGrotesk,
                ),
                const SizedBox(height: 12),
                ...widget.itens.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: ColorManager.accent,
                            borderRadius: BorderRadius.all(Radius.circular(3)),
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
          );
        },
      ),
    );
  }
}

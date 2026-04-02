import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class ViewProjectsButton extends StatelessWidget {
  ViewProjectsButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: hovered ? 1 : 0),
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            builder: (context, value, _) {
              final spacing = lerpDouble(8, 16, value)!;
              final rightPadding = lerpDouble(24, 16, value)!;

              return SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    animationDuration: const Duration(milliseconds: 220),
                    elevation: WidgetStateProperty.resolveWith<double>((
                      states,
                    ) {
                      return states.contains(WidgetState.hovered) ? 10 : 0;
                    }),
                    shadowColor: WidgetStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      return states.contains(WidgetState.hovered)
                          ? ColorManager.accent
                          : Colors.transparent;
                    }),
                    backgroundColor: const WidgetStatePropertyAll(
                      ColorManager.accent,
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(24, 12, rightPadding, 12),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: getMediumStyle(
                          color: ColorManager.neutral.shade900,
                          fontSize: FontSize.s16,
                        ).inter,
                      ),
                      SizedBox(width: spacing),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: ColorManager.neutral.shade900,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

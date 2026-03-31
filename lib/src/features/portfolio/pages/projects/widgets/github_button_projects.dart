import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class GithubButtonProjects extends StatelessWidget {
  const GithubButtonProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return ColorManager.primaryLight.withValues(alpha: 0.08);
              }
              return Colors.transparent;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return ColorManager.primaryLight.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.pressed)) {
                return ColorManager.primaryLight.withValues(alpha: 0.15);
              }
              return Colors.transparent;
            }),
            side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return BorderSide(
                  color: ColorManager.primaryLight.withValues(alpha: 0.4),
                );
              }
              return BorderSide(color: ColorManager.neutral.shade200);
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ver todos os projetos no GitHub',
                style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.foreground,
                ).inter,
              ),
              const SizedBox(width: 8),
              Icon(Icons.open_in_new, size: 18, color: ColorManager.foreground),
            ],
          ),
        ),
      ),
    );
  }
}

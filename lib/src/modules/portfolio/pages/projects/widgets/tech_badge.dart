import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class TechBadge extends StatelessWidget {
  final String label;

  const TechBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorManager.neutral.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        label,
        style: getRegularStyle(
          color: ColorManager.neutral.shade700,
          fontSize: FontSize.s14,
        ).inter,
      ),
    );
  }
}

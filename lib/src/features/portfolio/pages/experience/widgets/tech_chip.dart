import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class TechChip extends StatelessWidget {
  const TechChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorManager.neutral.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        label,
        style: getMediumStyle(
          color: ColorManager.neutral.shade700,
          fontSize: FontSize.s14,
        ).inter,
      ),
    );
  }
}

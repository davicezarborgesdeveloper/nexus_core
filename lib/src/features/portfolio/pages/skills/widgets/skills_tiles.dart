import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';

class SkillsTiles extends StatelessWidget {
  const SkillsTiles({
    super.key,
    required IconData icon,
    required String title,
    required List itens,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorManager.background,
        border: Border.all(color: ColorManager.neutral.shade200, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow.withValues(alpha: 0.1),
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/size_screen_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class KpiMetric extends StatelessWidget {
  final String value;
  final String label;
  const KpiMetric({required this.value, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: getBoldStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s32,
          ).inter,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          maxLines: context.isMobile ? 2 : 1,
          style: getRegularStyle(
            color: ColorManager.neutral.shade600,
            fontSize: FontSize.s14,
          ).inter,
        ),
      ],
    );
  }
}

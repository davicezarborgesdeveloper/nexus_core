import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class ContactTile extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  const ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.neutral.shade200),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.neutral.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                ColorManager.primary,
                BlendMode.srcIn,
              ),
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: getRegularStyle(
                    color: ColorManager.secondary,
                    fontSize: FontSize.s14,
                  ).inter,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: getMediumStyle(
                    color: ColorManager.foreground,
                    fontSize: FontSize.s16,
                  ).inter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

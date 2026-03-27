import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorManager.neutral.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 8, color: ColorManager.accent),
          const SizedBox(width: 8),
          Text(
            l10n.homeAvailable,
            style: getRegularStyle(
              color: ColorManager.neutral.shade700,
              fontSize: FontSize.s14,
            ).inter,
          ),
        ],
      ),
    );
  }
}

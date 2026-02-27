import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart' show FontSize;

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Wrap(
      runSpacing: 16,
      children: [
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.accent,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.actionViewProjects,
                  style: getMediumStyle(
                    color: ColorManager.neutral.shade900,
                    fontSize: FontSize.s16,
                  ).inter,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: ColorManager.neutral.shade900,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.background,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorManager.neutral.shade200,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              l10n.actionContact,
              style: getMediumStyle(
                color: ColorManager.neutral.shade900,
                fontSize: FontSize.s16,
              ).inter,
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 48,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: ColorManager.background,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.file_download_outlined,
                  size: 20,
                  color: ColorManager.neutral.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.actionDownloadCV,
                  style: getMediumStyle(
                    color: ColorManager.neutral.shade600,
                    fontSize: FontSize.s16,
                  ).inter,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

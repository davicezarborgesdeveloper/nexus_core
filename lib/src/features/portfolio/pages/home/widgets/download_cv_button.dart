import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class DownloadCvButton extends StatelessWidget {
  const DownloadCvButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              label,
              style: getMediumStyle(
                color: ColorManager.neutral.shade600,
                fontSize: FontSize.s16,
              ).inter,
            ),
          ],
        ),
      ),
    );
  }
}

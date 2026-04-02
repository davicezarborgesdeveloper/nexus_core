import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class DownloadResumeButton extends StatefulWidget {
  const DownloadResumeButton({super.key});

  @override
  State<DownloadResumeButton> createState() => _DownloadResumeButtonState();
}

class _DownloadResumeButtonState extends State<DownloadResumeButton> {
  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return AnimatedScale(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            scale: hovered ? 1.03 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.shadow.withValues(
                      alpha: hovered ? 0.20 : 0.10,
                    ),
                    blurRadius: hovered ? 18 : 8,
                    spreadRadius: hovered ? 1 : 0,
                    offset: hovered ? const Offset(0, 8) : const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: AnimatedSlide(
                    duration: const Duration(milliseconds: 180),
                    offset: hovered ? const Offset(0.08, 0) : Offset.zero,
                    child: const Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                    ),
                  ),
                  label: Text(
                    l10n.expDownloadResume,
                    style: getBoldStyle(
                      color: Colors.white,
                      fontSize: FontSize.s16,
                    ).inter,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: hovered
                        ? ColorManager.primary.withValues(alpha: 0.92)
                        : ColorManager.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

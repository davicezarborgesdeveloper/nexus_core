import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/section_label.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/tech_chip.dart';
import 'package:nexus_core/src/features/portfolio/pages/experience/widgets/bullet_item.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import 'package:nexus_core/l10n/app_localizations.dart';

class TimelineExperience extends StatefulWidget {
  const TimelineExperience({
    super.key,
    this.isFirst = false,
    this.isLast = false,
  });

  final bool isFirst;
  final bool isLast;

  @override
  State<TimelineExperience> createState() => _TimelineExperienceState();
}

class _TimelineExperienceState extends State<TimelineExperience> {
  final ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return TimelineTile(
            isFirst: widget.isFirst,
            isLast: widget.isLast,
            beforeLineStyle: LineStyle(
              color: ColorManager.neutral.shade200,
              thickness: 1,
            ),
            afterLineStyle: LineStyle(
              color: ColorManager.neutral.shade200,
              thickness: 1,
            ),
            indicatorStyle: IndicatorStyle(
              width: 20,
              height: 20,
              indicator: AnimatedScale(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                scale: hovered ? 1.2 : 1.08,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isFirst
                        ? ColorManager.primaryLight
                        : ColorManager.background,
                    border: Border.all(
                      color: widget.isFirst
                          ? ColorManager.primary
                          : ColorManager.neutral.shade300,
                      width: widget.isFirst ? 4 : (hovered ? 3 : 2),
                    ),
                  ),
                ),
              ),
            ),
            endChild: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(hovered ? 6 : 0, 0, 0),
              margin: EdgeInsets.only(left: 30, bottom: widget.isLast ? 0 : 48),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorManager.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: hovered
                      ? ColorManager.foreground
                      : ColorManager.neutral.shade200,
                  width: hovered ? 1 : 2,
                ),
                boxShadow: hovered
                    ? [
                        BoxShadow(
                          color: ColorManager.shadow.withValues(alpha: 0.14),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: ColorManager.shadow.withValues(alpha: 0.05),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              constraints: const BoxConstraints(minHeight: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorManager.neutral.shade100,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.business_center_outlined,
                          color: ColorManager.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.expJobTitle,
                              style: getBoldStyle(
                                color: ColorManager.foreground,
                                fontSize: context.isMobile
                                    ? FontSize.s18
                                    : FontSize.s24,
                              ).spaceGrotesk,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppLocalizations.of(context)!.expCompany,
                              style: getMediumStyle(
                                color: ColorManager.primary,
                                fontSize: context.isMobile
                                    ? FontSize.s16
                                    : FontSize.s18,
                              ).inter,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 14,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: ColorManager.secondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            AppLocalizations.of(context)!.expDateRange,
                            style: getRegularStyle(
                              fontSize: 14,
                              color: ColorManager.secondary,
                            ).inter,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.accent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.expCurrentLabel,
                          style: getMediumStyle(
                            color: ColorManager.foreground,
                            fontSize: FontSize.s12,
                          ).inter,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: ColorManager.secondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!.expLocation,
                            style: getRegularStyle(
                              fontSize: 14,
                              color: ColorManager.secondary,
                            ).inter,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.expJobDescription,
                    style: getRegularStyle(
                      fontSize: 16,
                      color: ColorManager.secondary,
                    ).inter,
                  ),
                  const SizedBox(height: 20),
                  SectionLabel(
                    AppLocalizations.of(context)!.expAchievementsLabel,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      BulletItem(
                        AppLocalizations.of(context)!.expAchievement1,
                      ),
                      const SizedBox(height: 8),
                      BulletItem(
                        AppLocalizations.of(context)!.expAchievement2,
                      ),
                      const SizedBox(height: 8),
                      BulletItem(
                        AppLocalizations.of(context)!.expAchievement3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SectionLabel(
                    AppLocalizations.of(context)!.expTechnologiesLabel,
                  ),
                  const SizedBox(height: 8),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      TechChip('Flutter'),
                      TechChip('React'),
                      TechChip('Node.js'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

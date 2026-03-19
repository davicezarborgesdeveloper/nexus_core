import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class TimelineExperience extends StatelessWidget {
  const TimelineExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      // alignment: TimelineAlign.manual,
      // lineXY: 0.01,
      endChild: Container(
        margin: const EdgeInsets.only(left: 30),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: ColorManager.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.neutral.shade200, width: 2),
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
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Icon(
                    Icons.business_center_outlined,
                    color: ColorManager.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Senior Full Stack Developer',
                      style: getBoldStyle(
                        color: ColorManager.foreground,
                        fontSize: FontSize.s24,
                      ).spaceGrotesk,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'TechCorp Solutions',
                      style: getMediumStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s18,
                      ).inter,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: ColorManager.secondary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Jan 2020 - Present',
                  style: getRegularStyle(
                    fontSize: 14,
                    color: ColorManager.secondary,
                  ).inter,
                ),
                const SizedBox(width: 14),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.accent,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    'Atual',
                    style: getMediumStyle(
                      color: ColorManager.foreground,
                      fontSize: FontSize.s12,
                    ).inter,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: ColorManager.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
      // startChild: Container(color: Colors.amberAccent),
    );
  }
}
// business_center_outlined
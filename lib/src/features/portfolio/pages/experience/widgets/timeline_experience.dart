import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/resources/color_manager.dart';

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
                    const Text(
                      'Senior Full Stack Developer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'TechCorp Solutions',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorManager.neutral.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
      // startChild: Container(color: Colors.amberAccent),
    );
  }
}
// business_center_outlined
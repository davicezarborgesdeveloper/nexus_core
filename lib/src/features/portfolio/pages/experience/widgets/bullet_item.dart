import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class BulletItem extends StatelessWidget {
  const BulletItem(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 6, color: ColorManager.accent),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: getRegularStyle(
              fontSize: FontSize.s16,
              color: ColorManager.secondary,
            ).inter,
          ),
        ),
      ],
    );
  }
}

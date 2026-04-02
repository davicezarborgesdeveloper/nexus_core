import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: getBoldStyle(
        color: ColorManager.foreground,
        fontSize: FontSize.s14,
      ).spaceGrotesk,
    );
  }
}

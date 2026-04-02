import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class GetInButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const GetInButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorManager.background,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorManager.neutral.shade200, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: getMediumStyle(
            color: ColorManager.neutral.shade900,
            fontSize: FontSize.s16,
          ).inter,
        ),
      ),
    );
  }
}

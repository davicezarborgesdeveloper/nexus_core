import 'package:flutter/material.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/style_manager.dart';

class ProfileTextField extends StatefulWidget {
  final String label;
  const ProfileTextField({super.key, required this.label});

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: getMediumStyle(
            color: ColorManager.foreground,
            fontSize: FontSize.s14,
          ).inter,
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: getRegularStyle(
            color: ColorManager.foreground,
            fontSize: FontSize.s14,
          ).inter,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';




class NexusCoreTextField extends StatefulWidget {
  final String label;
  const NexusCoreTextField({super.key, required this.label});

  @override
  State<NexusCoreTextField> createState() => _NexusCoreTextFieldState();
}

class _NexusCoreTextFieldState extends State<NexusCoreTextField> {
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

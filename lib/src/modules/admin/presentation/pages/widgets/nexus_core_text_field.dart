import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class NexusCoreTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? initialValue;

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const NexusCoreTextField({
    super.key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    this.onChanged,
  });

  @override
  State<NexusCoreTextField> createState() => _NexusCoreTextFieldState();
}

class _NexusCoreTextFieldState extends State<NexusCoreTextField> {
  late final TextEditingController _internalController;

  TextEditingController get _controller =>
      widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();

    _internalController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    // ⚠️ Só descarta se for interno
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

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
          controller: _controller,
          style: getRegularStyle(
            color: ColorManager.foreground,
            fontSize: FontSize.s14,
          ).inter,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}

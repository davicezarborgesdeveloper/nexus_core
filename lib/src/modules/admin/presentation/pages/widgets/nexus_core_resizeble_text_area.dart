import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';

class NexusCoreResizebleTextArea extends StatefulWidget {
  final String label;
  const NexusCoreResizebleTextArea({super.key, required this.label});

  @override
  State<NexusCoreResizebleTextArea> createState() =>
      _NexusCoreResizebleTextAreaState();
}

class _NexusCoreResizebleTextAreaState
    extends State<NexusCoreResizebleTextArea> {
  double height = 120;

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
          // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: const TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                ),
              ),
            ),

            /// 🔽 Handle de resize (canto inferior direito)
            Positioned(
              right: 4,
              bottom: 4,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    height += details.delta.dy;

                    if (height < 80) height = 80; // mínimo
                    if (height > 400) height = 400; // máximo (opcional)
                  });
                },
                child: const Icon(
                  Icons.drag_handle,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

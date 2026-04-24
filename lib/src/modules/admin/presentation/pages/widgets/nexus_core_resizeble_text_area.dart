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

  static const double minHeight = 80;
  static const double maxHeight = 400;

  void _resize(double deltaY) {
    setState(() {
      height = (height + deltaY).clamp(minHeight, maxHeight);
    });
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
                  contentPadding: EdgeInsets.fromLTRB(16, 16, 36, 16),
                  border: InputBorder.none,
                ),
              ),
            ),

            /// 🔽 Handle de resize (canto inferior direito)
            Positioned(
              right: 8,
              bottom: 8,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeUpLeftDownRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanUpdate: (details) {
                    _resize(details.delta.dy);
                  },
                  child: const SizedBox(
                    width: 18,
                    height: 18,
                    child: CustomPaint(painter: _ResizeHandlePainter()),
                  ),
                ),
              ),
              // child: GestureDetector(
              //   onPanUpdate: (details) {
              //     setState(() {
              //       height += details.delta.dy;

              //       if (height < 80) height = 80; // mínimo
              //       if (height > 400) height = 400; // máximo (opcional)
              //     });
              //   },
              //   child: const Icon(
              //     Icons.drag_handle,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              // ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ResizeHandlePainter extends CustomPainter {
  const _ResizeHandlePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade500
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    const double margin = 2;

    canvas.drawLine(
      Offset(size.width - 4, size.height - 14),
      Offset(size.width - 14, size.height - 4),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - 4, size.height - 9),
      Offset(size.width - 9, size.height - 4),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - 4, size.height - 4),
      Offset(size.width - 4 - margin, size.height - 4 + margin),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

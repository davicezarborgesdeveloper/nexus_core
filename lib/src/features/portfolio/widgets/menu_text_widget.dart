import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';

class MenuTextWidget extends StatelessWidget {
  final MenuItem item;
  MenuTextWidget(this.item, {super.key});
  final ValueNotifier<bool> isHovering = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Scrollable.ensureVisible(item.key.currentContext!),
        onHover: (hovering) {
          isHovering.value = hovering;
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: isHovering,
          builder: (context, hovering, child) {
            return Text(
              item.label,
              style: getRegularStyle(
                color: hovering
                    ? ColorManager.primary
                    : ColorManager.textPrimary,
                fontSize: FontSize.s16,
              ).inter,
            );
          },
        ),
      ),
    );
  }
}

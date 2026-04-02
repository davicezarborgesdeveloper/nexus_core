import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class ContactTile extends StatefulWidget {
  final String icon;
  final String label;
  final String value;
  const ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  final ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(hovered ? 4 : 0, 0, 0),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ColorManager.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hovered
                    ? ColorManager.primary
                    : ColorManager.neutral.shade200,
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.neutral.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    widget.icon,
                    colorFilter: const ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: getRegularStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s14,
                        ).inter,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.value,
                        style: getMediumStyle(
                          color: ColorManager.foreground,
                          fontSize: FontSize.s16,
                        ).inter,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

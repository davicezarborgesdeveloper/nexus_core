import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/modules/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/menu_text_widget.dart';

class Footer extends StatelessWidget {
  final List<MenuItem> menus;
  const Footer({required this.menus, super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final textStyle = getRegularStyle(
      color: ColorManager.textSecondary,
      fontSize: FontSize.s14,
    ).inter;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 1, thickness: 1, color: ColorManager.neutral.shade200),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isMobile
                ? 24
                : context.isTablet
                ? 48
                : 128,
            vertical: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: textStyle,
                    children: [
                      TextSpan(text: '© $year Davi Cezário. Desenvolvido com '),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.favorite,
                          size: 14,
                          color: Color(0xFFf97316),
                        ),
                      ),
                      const TextSpan(text: ' e Flutter'),
                    ],
                  ),
                ),
              ),
              if (!context.isMobile)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: menus
                      .asMap()
                      .entries
                      .map(
                        (item) => Padding(
                          padding: EdgeInsets.only(
                            left: item.key == 0 ? 0 : 16,
                          ),
                          child: MenuTextWidget(item.value),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

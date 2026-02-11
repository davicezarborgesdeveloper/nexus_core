import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';

class AppBarWeb extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final List<MenuItem> menus;
  const AppBarWeb(this.name, this.menus, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.background,
      centerTitle: true,
      leadingWidth: context.screenWidth < 1200 ? 240 : 300,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: getBoldStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSize.s20,
            ).spaceGrotesk,
          ),
        ),
      ),
      title: Row(children: []),
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

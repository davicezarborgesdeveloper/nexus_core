import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/language/language_switcher.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/menu_text_widget.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/social/social_button.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/social/social_enum.dart';

class AppBarNexusCore extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final List<MenuItem> menus;
  final bool isDrawerOpen;
  const AppBarNexusCore(
    this.name,
    this.menus, {
    this.isDrawerOpen = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.background,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: true,
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: kIsWeb ? 24 : 16),
        width: context.screenWidth < 1200 ? null : 1200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: context.screenWidth < 955 && context.screenWidth > 883
                    ? 120
                    : null,
                child: Text(
                  name,
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontSize: FontSize.s20,
                  ).spaceGrotesk,
                  softWrap: true,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            Offstage(
              offstage: context.screenWidth < 883,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: menus
                    .asMap()
                    .entries
                    .map(
                      (item) => Padding(
                        padding: EdgeInsets.only(left: item.key == 0 ? 0 : 16),
                        child: MenuTextWidget(item.value),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              children: [
                const LanguageSwitcher(),
                const SizedBox(width: 16),
                Visibility(
                  visible: context.screenWidth > 885,
                  replacement: GestureDetector(
                    onTap: () {
                      if (isDrawerOpen) {
                        Navigator.of(context).pop();
                      } else {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                    child: Icon(
                      isDrawerOpen ? Icons.close : Icons.menu,
                      color: ColorManager.secondary,
                    ),
                  ),
                  // replacement: IconButton(
                  // icon: Icon(
                  //   isDrawerOpen ? Icons.close : Icons.menu,
                  //   color: ColorManager.secondary,
                  // ),
                    // onPressed: () {
                    //   if (isDrawerOpen) {
                    //     Navigator.of(context).pop();
                    //   } else {
                    //     Scaffold.of(context).openDrawer();
                    //   }
                    // },
                  // ),
                  child: Row(
                    children: [
                      const SocialButton(
                        link: 'https://github.com/davicezarborgesdeveloper',
                        tipo: SocialEnum.github,
                      ),
                      const SizedBox(width: 16),
                      const SocialButton(
                        link:
                            'https://www.linkedin.com/in/daviborgesdeveloper/',
                        tipo: SocialEnum.linkedin,
                      ),
                      const SizedBox(width: 16),
                      const SocialButton(
                        link: 'daviborges.sistemas@gmail.com',
                        tipo: SocialEnum.email,
                      ),
                      SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          color: ColorManager.neutral[300]!,
                          thickness: 1,
                          width: 32,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.settings_outlined,
                          color: ColorManager.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

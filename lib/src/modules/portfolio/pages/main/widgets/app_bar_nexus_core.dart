import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/modules/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/language/language_switcher.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/menu_text_widget.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/social/social_button.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/social/social_enum.dart';

class AppBarNexusCore extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final List<MenuItem> menus;
  final bool isDrawerOpen;
  final VoidCallback? onSettingsTap;
  const AppBarNexusCore(
    this.name,
    this.menus, {
    this.isDrawerOpen = false,
    this.onSettingsTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.background,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: ColorManager.neutral.shade200,
        ),
      ),
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: kIsWeb ? 24 : 16),
        width: context.screenWidth < 1200 ? null : 1200,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final nameStyle = getBoldStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSize.s20,
            ).spaceGrotesk;
            final namePainter = TextPainter(
              text: TextSpan(text: name, style: nameStyle),
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout();
            final nameWidth = namePainter.width + 32; // + margem

            // Mede cada item do menu
            final menuStyle = getRegularStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSize.s16,
            ).inter;
            var menuWidth = 0.0;
            for (var i = 0; i < menus.length; i++) {
              final painter = TextPainter(
                text: TextSpan(text: menus[i].label, style: menuStyle),
                maxLines: 1,
                textDirection: TextDirection.ltr,
              )..layout();
              menuWidth +=
                  painter.width + (i > 0 ? 16 : 0); // padding entre itens
            }
            menuWidth += 48; // margem extra do InkWell/Material

            // Tamanhos fixos do lado direito (ícones)
            const rightCompactWidth =
                90.0; // language(~50) + gap(16) + hamburger(24)
            const rightFullWidth =
                270.0; // language + gap + 3 socials + divider + settings

            final showSocials =
                availableWidth >= nameWidth + menuWidth + rightFullWidth;
            final showMenu =
                availableWidth >= nameWidth + menuWidth + rightCompactWidth;

            return Row(
              children: [
                Text(
                  name,
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontSize: FontSize.s20,
                  ).spaceGrotesk,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                if (showMenu) ...[
                  const Spacer(),
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
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LanguageSwitcher(),
                    const SizedBox(width: 16),
                    if (showSocials) ...[
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
                          color: ColorManager.neutral.shade300,
                          thickness: 1,
                          width: 32,
                        ),
                      ),
                      GestureDetector(
                        onTap: onSettingsTap,
                        child: const Icon(
                          Icons.settings_outlined,
                          color: ColorManager.secondary,
                        ),
                      ),
                    ] else
                      GestureDetector(
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
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

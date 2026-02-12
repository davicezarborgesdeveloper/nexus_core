import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/widgets/language/language_switcher.dart';
import 'package:nexus_core/src/features/portfolio/widgets/social/social_button.dart';
import 'package:nexus_core/src/features/portfolio/widgets/social/social_enum.dart';

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
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: menus.map((m) => _buildNavButton(m)).toList(),
      ),
      actions: [
        const LanguageSwitcher(),
        const SizedBox(width: 8),
        const SocialButton(
          link: 'https://github.com/davicezarborgesdeveloper',
          tipo: SocialEnum.github,
        ),
        const SizedBox(width: 16),
        const SocialButton(
          link: 'https://www.linkedin.com/in/daviborgesdeveloper/',
          tipo: SocialEnum.linkedin,
        ),
        const SizedBox(width: 16),
        const SocialButton(
          link: 'daviborges.sistemas@gmail.com',
          tipo: SocialEnum.email,
        ),
        VerticalDivider(
          color: ColorManager.neutral[300]!,
          thickness: 0.5,
          indent: 16,
          endIndent: 16,
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.settings_outlined, color: ColorManager.secondary),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavButton(MenuItem item) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.red;
          }
          return ColorManager.textPrimary;
        }),
      ),
      onPressed: () => Scrollable.ensureVisible(item.key.currentContext!),
      child: Text(
        item.label,
        style: const TextStyle(
          fontFamily: FontConstants.inter,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.regular,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

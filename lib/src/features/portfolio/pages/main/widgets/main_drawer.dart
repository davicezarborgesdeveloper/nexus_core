import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/social/social_button.dart';
import 'package:nexus_core/src/features/portfolio/pages/main/widgets/social/social_enum.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.menu,
  });

  final List<MenuItem> menu;

  @override
  Widget build(BuildContext context) {
    return  Transform.translate(
        offset: Offset(0, context.appbarHeight),
      child: SizedBox(
            width:kIsWeb?context.screenWidth:null,
        child: Drawer(
          backgroundColor: ColorManager.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: ListView(
            children: [
              ...menu.map(
                (m) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Text(
                      m.label,
                      style: getRegularStyle(
                        color: ColorManager.textPrimary,
                        fontSize: FontSize.s16,
                      ).inter,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 24,
                endIndent: 24,
                color: ColorManager.secondary,
              ),
              Row(
                children: [
                  const SizedBox(width: 24),
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
                  SizedBox(
                    height: 24,
                    child: VerticalDivider(
                      color: ColorManager.neutral[800]!,
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
            ],
          ),
        ),
      ),
    );
  }
}
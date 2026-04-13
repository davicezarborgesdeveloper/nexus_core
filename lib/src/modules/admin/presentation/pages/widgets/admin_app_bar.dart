import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback? onViewPortfolio;
  final VoidCallback? onSignOut;
  const AdminAppBar({
    super.key,
    required this.userName,
    this.onViewPortfolio,
    this.onSignOut,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final scaffold = Scaffold.maybeOf(context);
    final hasDrawer = scaffold?.hasDrawer ?? false;

    return AppBar(
      backgroundColor: ColorManager.background,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: hasDrawer
          ? IconButton(
              icon: const Icon(Icons.menu),
              color: ColorManager.textSecondary,
              onPressed: () => scaffold!.openDrawer(),
            )
          : null,
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
        child: Row(
          children: [
            Text(
              'Painel Administrativo',
              style: getBoldStyle(
                color: ColorManager.textPrimary,
                fontSize: isMobile ? FontSize.s16 : FontSize.s20,
              ).spaceGrotesk,
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Admin',
                style: getRegularStyle(
                  color: Colors.white,
                  fontSize: FontSize.s12,
                ).inter,
              ),
            ),
            const Spacer(),
            if (!isMobile)
              TextButton.icon(
                onPressed: onViewPortfolio,
                icon: const Icon(Icons.open_in_new, size: 16),
                label: const Text('Ver portfólio'),
                style: TextButton.styleFrom(
                  foregroundColor: ColorManager.textSecondary,
                  textStyle: getMediumStyle(
                    color: ColorManager.textSecondary,
                    fontSize: FontSize.s14,
                  ).inter,
                ),
              ),
            TextButton.icon(
              onPressed: onSignOut,
              icon: const Icon(Icons.logout, size: 16),
              label: isMobile ? const SizedBox.shrink() : const Text('Sair'),
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.textSecondary,
                textStyle: getMediumStyle(
                  color: ColorManager.textSecondary,
                  fontSize: FontSize.s14,
                ).inter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

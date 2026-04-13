import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}

class AdminSideNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  static const _items = [
    _NavItem(Icons.person_outline, 'Perfil'),
    _NavItem(Icons.folder_outlined, 'Projetos'),
    _NavItem(Icons.work_outline, 'Experiências'),
    _NavItem(Icons.bolt_outlined, 'Habilidades'),
    _NavItem(Icons.settings_outlined, 'Configurações'),
    _NavItem(Icons.shield_outlined, 'Segurança'),
  ];

  const AdminSideNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: 240,
      decoration: BoxDecoration(
        color: ColorManager.background,
        border: Border(
          right: BorderSide(color: ColorManager.neutral.shade200, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Material(
              color: isSelected ? ColorManager.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onItemSelected(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        size: 18,
                        color: isSelected
                            ? Colors.white
                            : ColorManager.textSecondary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.label,
                        style: getMediumStyle(
                          color: isSelected
                              ? Colors.white
                              : ColorManager.textSecondary,
                          fontSize: FontSize.s14,
                        ).inter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

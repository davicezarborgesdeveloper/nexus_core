import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/pages/home/widgets/action_buttons.dart';
import 'widgets/kpi_metric.dart';

class HomePage extends StatefulWidget {
  final MenuItem menu;
  HomePage(this.menu, {Key? key}) : super(key: key ?? menu.key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: ColorManager.background,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 24
            : context.isTablet
            ? 48
            : 128,
        vertical: context.isMobile ? 48 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: ColorManager.neutral.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 8, color: ColorManager.accent),
                const SizedBox(width: 8),
                Text(
                  l10n.homeAvailable,
                  style: getRegularStyle(
                    color: ColorManager.neutral.shade700,
                    fontSize: FontSize.s14,
                  ).inter,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.homeTitle1,
              maxLines: context.screenWidth < 540 ? 2 : 1,
              style: getBoldStyle(
                color: ColorManager.textPrimary,
                fontSize: FontSize.s72,
              ).spaceGrotesk,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.homeTitle2,
              maxLines: context.screenWidth < 540 ? 2 : 1,
              style: getBoldStyle(
                color: ColorManager.primary,
                fontSize: FontSize.s72,
              ).spaceGrotesk,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(right: context.percentWidth(0.15)),
            child: Text(
              l10n.homeDescription,
              style: getRegularStyle(
                color: ColorManager.secondary,
                fontSize: FontSize.s20,
              ).inter,
            ),
          ),
          const SizedBox(height: 48),
          const ActionButtons(),
          Divider(
            thickness: 1,
            color: ColorManager.neutral.shade200,
            height: 128,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: KpiMetric(value: '5+', label: l10n.kpiYearsLabel),
              ),
              Expanded(
                child: KpiMetric(value: '50+', label: l10n.kpiProjectsLabel),
              ),
              Expanded(
                child: KpiMetric(value: '20+', label: l10n.kpiClientsLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

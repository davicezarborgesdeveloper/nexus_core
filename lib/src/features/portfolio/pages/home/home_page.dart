import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/pages/home/widgets/action_buttons.dart';
import 'package:nexus_core/src/features/portfolio/pages/home/widgets/header_home_page.dart';
import 'widgets/kpi_metric.dart';

class HomePage extends StatefulWidget {
  final MenuItem menu;
  final GlobalKey? projectsKey;
  final GlobalKey? contactKey;
  HomePage(this.menu, {this.projectsKey, this.contactKey, Key? key})
    : super(key: key ?? menu.key);

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
          const HeaderHomePage(),
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
                fontSize: context.isMobile ? FontSize.s16 : FontSize.s20,
              ).inter,
            ),
          ),
          const SizedBox(height: 48),
          ActionButtons(
            onViewProjects: widget.projectsKey == null
                ? null
                : () {
                    print('overthere');
                    // final ctx = widget.projectsKey!.currentContext;
                    // if (ctx == null) return;
                    // Scrollable.ensureVisible(
                    //   ctx,
                    //   duration: const Duration(milliseconds: 600),
                    //   curve: Curves.easeInOut,
                    // );
                  },
            onContact: widget.contactKey == null
                ? () {
                    print('onContact: contactKey is NULL');
                  }
                : () {
                    final ctx = widget.contactKey!.currentContext;
                    print('onContact: ctx=$ctx');
                    if (ctx == null) return;
                    Scrollable.ensureVisible(
                      ctx,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
          ),
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

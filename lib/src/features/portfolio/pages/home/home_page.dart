import 'package:flutter/material.dart';
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
    return Container(
      color: ColorManager.background,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile
            ? 24
            : context.isTablet
            ? 48
            : 128,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.isMobile ? 48 : 100),
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
                  'Disponível para novos projetos',
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
              'Desenvolvedor Full Stack',
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
              'Criando soluções digitais',
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
              'Especializado em desenvolvimento web moderno, transformando ideias em aplicações escaláveis e performáticas com foco em experiência do usuário.',
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: KpiMetric(value: '5+', label: 'Anos de experiência'),
              ),
              Expanded(
                child: KpiMetric(value: '50+', label: 'Projetos concluídos'),
              ),
              Expanded(
                child: KpiMetric(value: '20+', label: 'Clientes satisfeitos'),
              ),
            ],
          ),
          SizedBox(height: context.isMobile ? 48 : 100),
        ],
      ),
    );
  }
}

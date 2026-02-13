import 'package:flutter/material.dart';
import 'package:nexus_core/l10n/app_localizations.dart';
import 'package:nexus_core/src/features/portfolio/models/menu_item.dart';
import 'package:nexus_core/src/features/portfolio/widgets/app_bar_web.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MenuItem>? _menu;
  List<MenuItem> get menu => _menu!;

  final String name = 'Davi Cezário Borges';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menu = [
      MenuItem(AppLocalizations.of(context)!.navHome, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navAbout, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navExperience, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navKnowledge, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navPortfolio, GlobalKey()),
      MenuItem(AppLocalizations.of(context)!.navContact, GlobalKey()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWeb(name, menu),
      drawer: Drawer(),

      body: Container(),
    );
  }
}

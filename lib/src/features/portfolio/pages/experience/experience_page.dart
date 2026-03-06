import 'package:flutter/material.dart';

import '../../models/menu_item.dart';

class ExperiencePage extends StatefulWidget {
  final MenuItem menu;
  ExperiencePage(this.menu, {Key? key}) : super(key: key ?? menu.key);
  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

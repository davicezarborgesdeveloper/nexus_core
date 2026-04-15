import 'package:flutter/material.dart';

import 'projetos_controller.dart';
import 'projetos_state.dart';

class ProjetosPage extends StatefulWidget {
  final ProjetosController controller;
  final String title;

  const ProjetosPage({
    super.key,
    required this.controller,
    this.title = 'Projetos',
  });

  @override
  State<ProjetosPage> createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<ProjetosState>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is ProjetosLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('Content for Projetos'));
          },
        ),
      ),
    );
  }
}

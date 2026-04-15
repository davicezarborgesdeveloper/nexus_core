import 'package:flutter/material.dart';

import 'configuracoes_controller.dart';
import 'configuracoes_state.dart';

class ConfiguracoesPage extends StatefulWidget {
  final ConfiguracoesController controller;
  final String title;

  const ConfiguracoesPage({
    super.key,
    required this.controller,
    this.title = 'Configuracoes',
  });

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<ConfiguracoesState>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is ConfiguracoesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('Content for Configuracoes'));
          },
        ),
      ),
    );
  }
}

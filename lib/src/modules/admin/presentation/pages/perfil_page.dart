import 'package:flutter/material.dart';

import '../controllers/perfil_controller.dart';
import '../states/perfil_state.dart';

class PerfilPage extends StatefulWidget {
  final PerfilController controller;
  final String title;

  const PerfilPage({
    super.key,
    required this.controller,
    this.title = 'Perfil',
  });

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ValueListenableBuilder<PerfilState>(
          valueListenable: widget.controller,
          builder: (context, state, _) {
            if (state is PerfilLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PerfilError) {
              return Center(child: Text(state.message));
            }

            return const Center(
              child: Text('Perfil'),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'habilidades_controller.dart';
import 'habilidades_state.dart';

class HabilidadesPage extends StatefulWidget {
  final HabilidadesController controller;
  final String title;

  const HabilidadesPage({
    super.key,
    required this.controller,
    this.title = 'Habilidades',
  });

  @override
  State<HabilidadesPage> createState() => _HabilidadesPageState();
}

class _HabilidadesPageState extends State<HabilidadesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder<HabilidadesState>(
            valueListenable: widget.controller,
            builder: (context, state, _) {
              if (state is HabilidadesLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Center(child: Text('Content for Habilidades'));
            },
          ),
        ],
      ),
    );
  }
}

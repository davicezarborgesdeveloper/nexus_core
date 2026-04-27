import 'package:flutter/material.dart';

import 'experiencias_controller.dart';
import 'experiencias_state.dart';

class ExperienciasPage extends StatefulWidget {
  final ExperienciasController controller;
  final String title;

  const ExperienciasPage({
    super.key,
    required this.controller,
    this.title = 'Experiencias',
  });

  @override
  State<ExperienciasPage> createState() => _ExperienciasPageState();
}

class _ExperienciasPageState extends State<ExperienciasPage> {
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
          ValueListenableBuilder<ExperienciasState>(
            valueListenable: widget.controller,
            builder: (context, state, _) {
              if (state is ExperienciasLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Center(child: Text('Content for Experiencias'));
            },
          ),
        ],
      ),
    );
  }
}

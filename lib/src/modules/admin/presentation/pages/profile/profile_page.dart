import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import '../widgets/nexus_core_resizeble_text_area.dart';
import '../widgets/nexus_core_text_field.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController controller;
  final String title;

  const ProfilePage({
    super.key,
    required this.controller,
    this.title = 'Perfil',
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final c = widget.controller;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: getBoldStyle(
                    color: ColorManager.foreground,
                    fontSize: FontSize.s24,
                  ).spaceGrotesk,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  final data = {
                    'name': c.nameController.text,
                    'title': c.titleController.text,
                    'tagline': c.taglineController.text,
                    'description': c.descriptionController.text,
                    'github': c.githubController.text,
                    'linkedin': c.linkedinController.text,
                    'email': c.emailController.text,
                    'location': c.locationController.text,
                    'available': c.available,
                  };
                  print(data);
                  // salvar dados
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.save_outlined, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Salvar',
                      style: getSemiBoldStyle(
                        color: ColorManager.background,
                        fontSize: FontSize.s14,
                      ).inter,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          NexusCoreTextField(label: 'Nome', controller: c.nameController),
          const SizedBox(height: 24),
          NexusCoreTextField(
            label: 'Título Principal',
            controller: c.titleController,
          ),
          const SizedBox(height: 24),
          NexusCoreTextField(
            label: 'Frase de impacto',
            controller: c.taglineController,
          ),
          const SizedBox(height: 24),
          NexusCoreResizebleTextArea(
            label: 'Descrição',
            controller: c.descriptionController,
          ),
          const SizedBox(height: 24),
          NexusCoreTextField(
            label: 'GitHub URL',
            controller: c.githubController,
          ),
          const SizedBox(height: 24),
          NexusCoreTextField(
            label: 'LinkedIn URL',
            controller: c.linkedinController,
          ),
          const SizedBox(height: 24),
          NexusCoreTextField(label: 'E-mail', controller: c.emailController),
          const SizedBox(height: 24),
          NexusCoreTextField(
            label: 'Localização',
            controller: c.locationController,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                'Disponível para projetos',
                style: getMediumStyle(
                  color: ColorManager.foreground,
                  fontSize: FontSize.s14,
                ).inter,
              ),
              const SizedBox(width: 12),
              Switch(
                value: c.available,
                onChanged: (value) {
                  setState(() {
                    c.available = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Stats',
            style: getMediumStyle(
              color: ColorManager.foreground,
              fontSize: FontSize.s14,
            ).inter,
          ),
          const SizedBox(height: 12),
          _buildStatsRow(),
          const SizedBox(height: 8),
          _buildStatsRow(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index < 2 ? 16 : 0),
            child: TextFormField(
              style: getRegularStyle(
                color: ColorManager.foreground,
                fontSize: FontSize.s14,
              ).inter,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

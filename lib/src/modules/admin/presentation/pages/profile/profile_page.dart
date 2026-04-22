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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 256, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: getBoldStyle(
                    color: ColorManager.foreground,
                    fontSize: FontSize.s24,
                  ).spaceGrotesk,
                ),
                SizedBox(
                  child: ElevatedButton(
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
                    onPressed: () {},
                    child: Row(
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
                ),
              ],
            ),
            const SizedBox(height: 26),
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth > 600
                      ? constraints.maxWidth * 0.53
                      : double.infinity,
                  child: const Column(
                    children: [
                      NexusCoreTextField(label: 'Nome'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'Título Principal'),
                      SizedBox(height: 16),
                      NexusCoreResizebleTextArea(label: 'Título Principal'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'Subtítulo'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'GitHub URL'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'LinkedIn URL'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'E-mail'),
                      SizedBox(height: 16),
                      NexusCoreTextField(label: 'Localização'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

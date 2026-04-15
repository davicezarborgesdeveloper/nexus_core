import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/profile/widgets/profile_text_field.dart';

import '../../../../../core/resources/color_manager.dart';
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
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
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
          ProfileTextField(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

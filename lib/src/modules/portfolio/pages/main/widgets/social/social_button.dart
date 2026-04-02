import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/modules/portfolio/pages/main/widgets/social/social_enum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String? link;
  final SocialEnum? tipo;
  const SocialButton({this.link, this.tipo, super.key});

  Future<void> _launch(BuildContext context) async {
    try {
      final Uri uri = tipo == SocialEnum.email
          ? Uri(scheme: 'mailto', path: link)
          : Uri.parse(link ?? '');
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $uri');
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Não foi possível abrir o link.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launch(context),
      child: SvgPicture.asset(
        switch (tipo) {
          SocialEnum.github => 'assets/icons/github.svg',
          SocialEnum.linkedin => 'assets/icons/linkedin.svg',
          SocialEnum.email => 'assets/icons/mail.svg',
          _ => 'assets/icons/github.svg',
        },
        colorFilter: const ColorFilter.mode(
          ColorManager.secondary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

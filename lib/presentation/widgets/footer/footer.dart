import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/footer/components/footer_logo_area.dart';
import 'package:meta_app/presentation/widgets/footer/components/footer_navigation.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.footerBackground,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Column(
          children: const [
            FooterNavigation(),
            SizedBox(height: 50),
            FooterLogoArea(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

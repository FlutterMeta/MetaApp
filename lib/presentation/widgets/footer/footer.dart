import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/widgets/media_buttons.dart';

part 'components/footer_navigation.dart';
part 'components/footer_logo_area.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.footerBackground,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: const Column(
          children: [
            _FooterNavigation(),
            SizedBox(height: 50),
            _FooterLogoArea(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

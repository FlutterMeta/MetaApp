import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/auth_section.dart';
import 'package:meta_app/presentation/widgets/locale_dropdown_menu.dart';
import 'package:meta_app/presentation/widgets/nav_bar_button.dart';
import 'package:meta_app/presentation/widgets/social_section.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _InfoButton(),
                const Spacer(),
                AuthSection(onTap: () => _goToLoginPage(context)),
                const SizedBox(width: 24),
                const LocaleDropdownMenu(),
                const SizedBox(width: 90),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.logo, height: 76),
                const _NavigationSubSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  const _InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      hoverColor: context.color.infoCardBackground,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(context.localizations.moreFactsAbout),
            const SizedBox(width: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: context.color.roadmapCardBackground,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.localizations.roadmap,
                  style: context.text.darkBackgroundText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationSubSection extends StatelessWidget {
  const _NavigationSubSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavBarButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(width: 6),
        NavBarButton(
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(width: 6),
        NavBarButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
        const SocialSection(),
      ],
    );
  }
}

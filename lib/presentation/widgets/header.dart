import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/web_button.dart';

import 'on_hover.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.only(top: 4, bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _RoadmapButton(),
                _AuthLocaleSubSection(onTap: () => _goToLoginPage(context)),
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

class HeaderCompact extends StatelessWidget {
  const HeaderCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.logo, height: 76),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    splashRadius: 26,
                  ),
                  const _SocialSection(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoadmapButton extends StatelessWidget {
  const _RoadmapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      hoverColor: context.color.itemsGreyBackground,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(context.localizations.moreFactsAbout),
            const SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ColoredBox(
                color: context.color.mainPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.localizations.roadmap,
                    style: context.text.smallerBodyTextWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthLocaleSubSection extends StatelessWidget {
  final VoidCallback onTap;

  const _AuthLocaleSubSection({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WebButton(
          onTap: onTap,
          child: Text(
            context.localizations.account,
            style: context.text.purpleBoldText,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        const Icon(Icons.language),
        const SizedBox(width: 90),
      ],
    );
  }
}

class _NavigationSubSection extends StatelessWidget {
  const _NavigationSubSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavBarButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(width: 5),
        _NavBarButton(
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(width: 5),
        _NavBarButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
        const _SocialSection(),
      ],
    );
  }
}

class _NavBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      hoverColor: context.color.navButtonHover,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(title),
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        _SocialMediaButton(asset: AppAssets.tlIco, onTap: () {}),
        const SizedBox(width: 10),
        _SocialMediaButton(
          asset: AppAssets.youtubeIco,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  const _SocialMediaButton({
    required this.asset,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (_) {
        return WebButton(
          onTap: onTap,
          child: Image.asset(asset, height: 30),
        );
      },
    );
  }
}

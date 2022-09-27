import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/login_page.dart';
import 'package:meta_app/presentation/widgets/auth_section.dart';
import 'package:meta_app/presentation/widgets/locale_dropdown_menu.dart';
import 'package:meta_app/presentation/widgets/nav_bar_button.dart';
import 'package:meta_app/presentation/widgets/social_section.dart';

class MobileHeader extends StatefulWidget {
  final bool? isMenuOpened;

  const MobileHeader({
    this.isMenuOpened = false,
    Key? key,
  }) : super(key: key);

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
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
              widget.isMenuOpened as bool
                  ? const _MenuSectionWithCloseButton()
                  : const _MenuSection(),
            ],
          ),
        ),
      ],
    );
  }
}

Route _openMobileMenu() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const _FullscreenMenu(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curveTween = CurveTween(curve: Curves.easeIn);
      return FadeTransition(
        opacity: animation.drive(curveTween),
        child: child,
      );
    },
  );
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(_openMobileMenu());
          },
          icon: const Icon(Icons.menu),
          iconSize: 30,
          splashRadius: 26,
        ),
        const SocialSection(),
      ],
    );
  }
}

class _MenuSectionWithCloseButton extends StatelessWidget {
  const _MenuSectionWithCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          iconSize: 30,
          splashRadius: 26,
        ),
        const SocialSection(),
      ],
    );
  }
}

class _FullscreenMenu extends StatefulWidget {
  const _FullscreenMenu({Key? key}) : super(key: key);

  @override
  State<_FullscreenMenu> createState() => _FullscreenMenuState();
}

class _FullscreenMenuState extends State<_FullscreenMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              MobileHeader(isMenuOpened: true),
              SizedBox(height: 100),
              _NavigationSubSection(),
              SizedBox(height: 50),
              LocaleDropdownMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationSubSection extends StatelessWidget {
  const _NavigationSubSection({Key? key}) : super(key: key);

  void _goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(height: 26),
        NavBarButton(
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(height: 26),
        NavBarButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
        const SizedBox(height: 50),
        AuthSection(onTap: () {
          _goToLoginPage(context);
        }),
      ],
    );
  }
}

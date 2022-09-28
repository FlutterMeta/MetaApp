part of '../header.dart';

class _MobileMenuNavigation extends StatelessWidget {
  const _MobileMenuNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _pushMobileMenu(context),
          icon: const Icon(Icons.menu),
          iconSize: 30,
          splashRadius: 26,
        ),
        const _SocialComponent(),
      ],
    );
  }
}

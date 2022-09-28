part of '../header.dart';

class _OpenedMobileMenuNavigation extends StatelessWidget {
  const _OpenedMobileMenuNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _popMobileMenu(context),
          icon: const Icon(Icons.close),
          iconSize: 30,
          splashRadius: 26,
        ),
        const _SocialComponent(),
      ],
    );
  }
}

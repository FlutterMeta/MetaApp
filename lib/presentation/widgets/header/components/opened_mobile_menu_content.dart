part of '../header.dart';

class _OpenedMobileMenuContent extends StatelessWidget {
  const _OpenedMobileMenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NavigationButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
      ],
    );
  }
}

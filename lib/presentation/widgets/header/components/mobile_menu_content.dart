part of '../header.dart';

class _MobileMenuContent extends StatelessWidget {
  const _MobileMenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(height: 26),
        const _AuthButton(),
        const SizedBox(height: 26),
        const _LocaleDropdownMenu(),
        const SizedBox(height: 100),
      ],
    );
  }
}

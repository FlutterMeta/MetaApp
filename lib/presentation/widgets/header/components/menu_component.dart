part of '../header.dart';

class _MenuComponent extends StatelessWidget {
  const _MenuComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavigationButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
        const _SocialComponent(),
      ],
    );
  }
}

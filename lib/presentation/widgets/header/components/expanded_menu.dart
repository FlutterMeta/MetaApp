part of '../header.dart';

class _ExpandedMenu extends StatelessWidget {
  const _ExpandedMenu({Key? key}) : super(key: key);

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

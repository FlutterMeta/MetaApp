part of '../header.dart';

class _NavigationButton extends StatelessWidget {
  final String title;
  final String routeName;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.title,
    required this.routeName,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  String currentRouteName(BuildContext context) {
    final route = ModalRoute.of(context);
    final routeName = route?.settings.name ?? "";

    return routeName;
  }

  @override
  Widget build(BuildContext context) {
    return WebButton(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      hoverColor: context.color.navButtonHover,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          title,
          style: currentRouteName(context) == routeName
              ? context.text.headerNavItemHovered
              : null,
        ),
      ),
    );
  }
}

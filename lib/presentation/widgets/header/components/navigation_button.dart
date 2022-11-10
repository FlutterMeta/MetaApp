part of '../header.dart';

class _NavigationButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  String currentPageName(BuildContext context) {
    var route = ModalRoute.of(context);
    String currentPageName = "";
    if (route != null) {
      currentPageName = route.settings.name?.replaceAll('Route', '') ?? "";
    }

    return currentPageName;
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
          style: currentPageName(context) == title
              ? context.text.headerNavItemHovered
              : null,
        ),
      ),
    );
  }
}

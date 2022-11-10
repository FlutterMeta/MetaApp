part of '../header.dart';

class _ExpandedMenu extends StatelessWidget {
  const _ExpandedMenu({Key? key}) : super(key: key);

  void _goToPartnersPage(BuildContext context) {
    context.router.navigate(PartnersRoute());
  }

  void _goToProductsPage(BuildContext context) {
    context.router.navigate(ProductsRoute());
  }

  void _goToDirectionsPage(BuildContext context) {
    context.router.navigate(DirectionsRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavigationButton(
          onTap: () => _goToDirectionsPage(context),
          title: context.localizations.directions,
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          onTap: () => _goToProductsPage(context),
          title: context.localizations.products,
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          onTap: () => _goToPartnersPage(context),
          title: context.localizations.partners,
        ),
        const MediaButtons(),
      ],
    );
  }
}

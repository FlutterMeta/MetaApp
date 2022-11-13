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
          title: context.localizations.directions,
          routeName: DirectionsRoute.name,
          onTap: () => _goToDirectionsPage(context),
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          title: context.localizations.products,
          routeName: ProductsRoute.name,
          onTap: () => _goToProductsPage(context),
        ),
        const SizedBox(width: 6),
        _NavigationButton(
          title: context.localizations.partners,
          routeName: PartnersRoute.name,
          onTap: () => _goToPartnersPage(context),
        ),
        const MediaButtons(),
      ],
    );
  }
}

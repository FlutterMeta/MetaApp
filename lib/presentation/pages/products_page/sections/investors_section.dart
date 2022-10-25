part of '../products_page.dart';

class _InvestorsSection extends StatelessWidget {
  const _InvestorsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          if (constraints.maxWidth > 780) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _investors(context),
            );
          } else {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _investors(context),
                ),
                const Spacer(),
              ],
            );
          }
        }),
      ),
    );
  }
}

List<_InvestorComponent> _investors(BuildContext context) {
  return [
    _InvestorComponent(
      title: context.localizations.horrowitz,
      subtitle: context.localizations.horrowitzDescription,
    ),
    _InvestorComponent(
      title: context.localizations.sequoia,
      subtitle: context.localizations.sequoiaDescription,
    ),
    _InvestorComponent(
      title: context.localizations.indexVentures,
      subtitle: context.localizations.indexVenturesDescription,
    ),
  ];
}

class _InvestorComponent extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InvestorComponent({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.productsInvestorSectionTitle,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: context.screenWidth < 780
                ? context.screenWidth * 0.66
                : context.screenWidth * 0.21,
            child: Text(
              subtitle,
              style: context.text.productsInvestorSectionDescription,
            ),
          ),
        ],
      ),
    );
  }
}

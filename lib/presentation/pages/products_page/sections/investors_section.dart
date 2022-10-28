part of '../products_page.dart';

class _InvestorsSection extends StatelessWidget {
  const _InvestorsSection({Key? key}) : super(key: key);

  List<Widget> _investors(BuildContext context) {
    return [
      _InvestorComponent(
        title: context.localizations.horowitz,
        subtitle: context.localizations.horowitzDescription,
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

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Wrap(
          spacing: 80,
          runSpacing: 16,
          children: _investors(context),
        ),
      ),
    );
  }
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
      width: context.screenWidth < 780
          ? context.screenWidth * 0.66
          : context.screenWidth * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.productsInvestorSectionTitle,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: context.text.productsInvestorSectionDescription,
          ),
        ],
      ),
    );
  }
}

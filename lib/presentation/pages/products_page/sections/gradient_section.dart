part of '../products_page.dart';

class _GradientSection extends StatelessWidget {
  const _GradientSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: context.gradient.purple,
      ),
      alignment: Alignment.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 20,
        spacing: 20,
        children: [
          _InfoBlock(title: context.localizations.weAreTrusted),
          ..._statsInfoBlocks(context),
        ],
      ),
    );
  }
}

List<Widget> _statsInfoBlocks(BuildContext context) {
  return [
    _InfoBlock(
      title: context.localizations.investmentPatrnersNumber,
      description: context.localizations.investmentPatrners,
    ),
    _InfoBlock(
      title: context.localizations.financialCapitalNumber,
      description: context.localizations.financialCapital,
    ),
    _InfoBlock(
      title: context.localizations.partnersMultimetaNumber,
      description: context.localizations.partnersMultimeta,
    ),
  ];
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String? description;

  const _InfoBlock({
    required this.title,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.productsGradientSectionTitle,
          ),
          const SizedBox(height: 10),
          Text(
            description ?? "",
            style: context.text.productsGradientSectionDescription,
          ),
        ],
      ),
    );
  }
}

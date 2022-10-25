part of '../products_page.dart';

class _ComponentsSection extends StatelessWidget {
  const _ComponentsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [
        Text(
          context.localizations.components,
          textAlign: TextAlign.center,
          style: context.text.productsComponentsSectionTitle,
        ),
        const SizedBox(height: 20),
        Text(
          context.localizations.mainProducts,
          textAlign: TextAlign.center,
          style: context.text.productsComponentItemDescription,
        ),
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Align(
            child: Wrap(
              spacing: 80,
              runSpacing: 16,
              children: _components(context),
            ),
          ),
        ),
      ]),
    );
  }
}

List<Widget> _components(BuildContext context) {
  return [
    _Component(
      imageAsset: "",
      title: context.localizations.equipment,
      description: context.localizations.equipmentDescription,
    ),
    _Component(
      imageAsset: "",
      title: context.localizations.artificialIntelligence,
      description: context.localizations.artificialIntelligenceDescription,
    ),
    _Component(
      imageAsset: "",
      title: context.localizations.ventureInvestments,
      description: context.localizations.ventureInvestmentsDescription,
    ),
    _Component(
      imageAsset: "",
      title: context.localizations.software,
      description: context.localizations.softwareDescription,
    ),
    _Component(
      imageAsset: "",
      title: context.localizations.dataCenters,
      description: context.localizations.dataCentersDescription,
    ),
    _Component(
      imageAsset: "",
      title: context.localizations.blockchain,
      description: context.localizations.blockchainDescription,
    ),
  ];
}

class _Component extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  const _Component({
    required this.imageAsset,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
          width: 80,
          child: Placeholder(),
        ),
        const SizedBox(height: 30),
        Text(title, style: context.text.productsComponentItemTitle),
        const SizedBox(height: 14),
        SizedBox(
          width: 250,
          child: Text(
            description,
            style: context.text.productsComponentItemDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

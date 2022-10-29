part of '../products_page.dart';

class _ComponentsSection extends StatelessWidget {
  const _ComponentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1020),
        child: Column(
          children: [
            Text(
              context.localizations.metaverseComponents,
              style: context.text.productsComponentsSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              context.localizations.mainProducts,
              style: context.text.productsComponentItemDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 110,
              runSpacing: 80,
              children: _components(context),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _components(BuildContext context) {
  return [
    _Component(
      imageAsset: AppAssets.blockchainComponent,
      title: context.localizations.equipment,
      description: context.localizations.equipmentDescription,
    ),
    _Component(
      imageAsset: AppAssets.blockchainComponent,
      title: context.localizations.artificialIntelligence,
      description: context.localizations.artificialIntelligenceDescription,
    ),
    _Component(
      imageAsset: AppAssets.blockchainComponent,
      title: context.localizations.ventureInvestments,
      description: context.localizations.ventureInvestmentsDescription,
    ),
    _Component(
      imageAsset: AppAssets.blockchainComponent,
      title: context.localizations.software,
      description: context.localizations.softwareDescription,
    ),
    _Component(
      imageAsset: AppAssets.blockchainComponent,
      title: context.localizations.dataCenters,
      description: context.localizations.dataCentersDescription,
    ),
    _Component(
      imageAsset: AppAssets.blockchainComponent,
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
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            height: 80,
          ),
          Text(
            title,
            style: context.text.productsComponentItemTitle,
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: context.text.productsComponentItemDescription,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

part of '../directions_page.dart';

class _CardsSection extends StatelessWidget {
  const _CardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.directionsCardsSectionBackground,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Wrap(
          runSpacing: 20,
          spacing: 150,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            _DirectionCards(),
            _InfoBlock(),
          ],
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizations.keyBusinessLines,
          style: context.text.metaverseThatUnitesTitle,
        ),
        const SizedBox(height: 20),
        Text(context.localizations.usingSeveralBusiness),
      ],
    );
  }
}

class _DirectionCards extends StatelessWidget {
  const _DirectionCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          const StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 40,
            child: SizedBox(),
          ),
          StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 320,
            child: _DirectionCard(
              icon: Icons.wallet,
              title: context.localizations.hedgeFund,
              subtitle: context.localizations.moreThanFifty,
            ),
          ),
          StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 320,
            child: _DirectionCard(
              icon: Icons.circle,
              title: context.localizations.metaverse,
              subtitle: context.localizations.virtualSpace,
            ),
          ),
          StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 320,
            child: _DirectionCard(
              icon: Icons.group,
              title: context.localizations.nftMarketplace,
              subtitle: context.localizations.tradePopularNFT,
            ),
          ),
          StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 320,
            child: _DirectionCard(
              icon: Icons.shield_outlined,
              title: context.localizations.technology,
              subtitle: context.localizations.virtualRealityTechnologies,
            ),
          ),
          const StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent: 40,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _DirectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _DirectionCard({
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      decoration: BoxDecoration(
        color: context.color.directionsCardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: context.color.directionCardIconBackground,
            ),
            child: Icon(
              icon,
              size: 36,
              color: context.color.directionCardIcon,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: context.text.directionCardTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          AutoSizeText(
            subtitle,
            style: context.text.directionCardDescription,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

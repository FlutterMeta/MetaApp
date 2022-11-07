part of '../home_page.dart';

class _CardsSection extends StatelessWidget {
  const _CardsSection({Key? key}) : super(key: key);

  List<Widget> _cards(BuildContext context) {
    return [
      _Card(
        title: context.localizations.forInvestmentPartners,
        subtitle: context.localizations.marketingYieldOptions,
      ),
      _Card(
        title: context.localizations.followDateReturn,
        subtitle: context.localizations.tableWithCurrentWMA,
      ),
      _Card(
        title: context.localizations.earnTradingNFT,
        subtitle: context.localizations.offersForNFT,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Wrap(
          spacing: 30,
          runSpacing: 20,
          children: _cards(context),
        ),
      ),
    );
  }
}

class _Card extends StatefulWidget {
  final String title;
  final String subtitle;

  const _Card({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 400,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: context.gradient.lightIndigoTurquoiseVertical,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 308),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            AutoSizeText(
              widget.subtitle,
              style: context.text.homeCardSubtitle,
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            AutoSizeText(
              widget.title,
              style: context.text.homeCardTitle,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

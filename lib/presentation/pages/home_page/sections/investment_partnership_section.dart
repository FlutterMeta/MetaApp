part of '../home_page.dart';

class _InvestmentPartnershipSection extends StatelessWidget {
  const _InvestmentPartnershipSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Wrap(
          spacing: 100,
          runSpacing: 20,
          children: const [
            _InvestmentCard(),
            _InvestmentInfo(),
          ],
        ),
      ),
    );
  }
}

class _InvestmentCard extends StatelessWidget {
  const _InvestmentCard({super.key});

  List<Widget> _chips(BuildContext context) {
    return [
      _InvestmentCardChip(text: context.localizations.nftMarketplace),
      _InvestmentCardChip(text: context.localizations.technology),
      _InvestmentCardChip(text: context.localizations.metaverse),
      _InvestmentCardChip(text: context.localizations.finance),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: 600,
      decoration: BoxDecoration(
        gradient: context.gradient.indigoTurquoiseDiagonal,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.black,
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: _chips(context),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: AutoSizeText(
              context.localizations.tradePopularNFT,
              style: context.text.homePartnershipCardHeadline,
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              Text(
                context.localizations.nftMarketplace,
                style: context.text.homePartnershipCardLink,
              ),
              const Icon(Icons.arrow_right_alt_sharp, color: Colors.white),
            ],
          ),
          const Spacer(),
          const Divider(color: Colors.white),
          const SizedBox(height: 14),
          Text(
            context.localizations.readBlog,
            style: context.text.homePartnershipCardLink,
          ),
          const SizedBox(height: 14),
          Text(
            context.localizations.latestAuroraNews,
            style: context.text.homePartnershipCardLink,
          ),
          const SizedBox(height: 14),
          const Icon(Icons.arrow_right_alt_sharp, color: Colors.white),
          const Spacer(),
        ],
      ),
    );
  }
}

class _InvestmentCardChip extends StatelessWidget {
  final String text;

  const _InvestmentCardChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          text,
          style: context.text.homePartnershipCardChip,
        ),
      ),
    );
  }
}

class _InvestmentInfo extends StatelessWidget {
  const _InvestmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.financialInstruments,
            style: context.text.homePartnershipInfoPurpleTitle,
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.investmentPartnership,
            style: context.text.homePartnershipInfoHeadline,
          ),
          const Spacer(),
          Text(
            context.localizations.investmentPartnershipDescription,
            style: context.text.homePartnershipInfoDescription,
          ),
          const Spacer(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              GradientButton(
                title: context.localizations.investmentOffers,
                onTap: () {},
              ),
              _AskButton(onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _AskButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AskButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: context.color.homeAskButtonBorder),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.askQuestion,
              style: context.text.homeAskButtonText,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

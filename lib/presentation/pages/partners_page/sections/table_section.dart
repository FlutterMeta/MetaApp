part of "../partners_page.dart";

class _TableSection extends StatelessWidget {
  const _TableSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1270),
        child: Column(
          children: [
            Text(
              context.localizations.bonusProgramWithLeadership,
              style: context.text.partnerTableSectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              context.localizations.getFinancialRewards,
              style: context.text.partnerTableSectionText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                if (index % 2 == 0) {
                  return _IncomeBonusRow(
                    image: Image.asset(
                      AppAssets.earth,
                      width: 80,
                      height: 80,
                    ),
                    accountRank: "META ONE",
                    activeWmaShares: 1,
                    invitesByStructure: "1 active in 1 line",
                    structureTurnover: "1 WMA",
                    incomeBonus: "5% from 1 level",
                  );
                }
                return const _ReferralBonusRow(
                  referralBonus: 5,
                  cachback: 7,
                  numberOfLevels: 1,
                  bonus: "50 USD",
                );
              },
              separatorBuilder: (_, index) {
                if (index % 2 == 0) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(height: 1),
                  );
                }
                return const SizedBox(height: 20);
              },
              itemCount: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _IncomeBonusRow extends StatelessWidget {
  final Widget image;
  final String accountRank;
  final int activeWmaShares;
  final String invitesByStructure;
  final String structureTurnover;
  final String incomeBonus;

  const _IncomeBonusRow({
    required this.image,
    required this.accountRank,
    required this.activeWmaShares,
    required this.invitesByStructure,
    required this.structureTurnover,
    required this.incomeBonus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: [
          image,
          _IncomeBonusCell(
            title: context.localizations.accountRank,
            value: accountRank,
          ),
          _IncomeBonusCell(
            title: context.localizations.activeWmaShares,
            value: activeWmaShares.toString(),
          ),
          _IncomeBonusCell(
            title: context.localizations.inviteesByStructure,
            value: invitesByStructure,
          ),
          _IncomeBonusCell(
            title: context.localizations.structureTurnover,
            value: structureTurnover,
          ),
          _IncomeBonusCell(
            title: context.localizations.incomeBonus,
            value: incomeBonus,
          ),
        ],
      ),
    );
  }
}

class _IncomeBonusCell extends StatelessWidget {
  final String title;
  final String value;

  const _IncomeBonusCell({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.partnerTableSectionCellTitle,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: context.text.partnerTableSectionIncomeCell,
        ),
      ],
    );
  }
}

class _ReferralBonusRow extends StatelessWidget {
  final int referralBonus;
  final int cachback;
  final int numberOfLevels;
  final String bonus;

  const _ReferralBonusRow({
    required this.referralBonus,
    required this.cachback,
    required this.numberOfLevels,
    required this.bonus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.referralBonusCell,
      padding: const EdgeInsets.only(top: 6, bottom: 20, left: 20, right: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: [
          _ReferralBonusCell(
            title: context.localizations.referralBonus,
            value: "$referralBonus%",
          ),
          _ReferralBonusCell(
            title: context.localizations.monthlyCachback,
            value: "$cachback%",
          ),
          _ReferralBonusCell(
            title: context.localizations.numberOfLevels,
            value: numberOfLevels.toString(),
          ),
          _ReferralBonusCell(
            title: context.localizations.bonus,
            value: bonus,
          ),
        ],
      ),
    );
  }
}

class _ReferralBonusCell extends StatelessWidget {
  final String title;
  final String value;

  const _ReferralBonusCell({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.partnerTableSectionCellTitle,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: context.text.partnerTableSectionReferralCell,
        ),
      ],
    );
  }
}

part of '../products_page.dart';

class _InvestorsSection extends StatelessWidget {
  const _InvestorsSection({super.key});

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
              children: _investors,
            );
          } else {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _investors,
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

const _investors = [
  _InvestorComponent(
    title: "Andreessen Horowitz",
    subtitle:
        "Projects that focus on games and NFTs, namely: Dapper Labs, Roblox, Open Sea.",
  ),
  _InvestorComponent(
    title: "Sequoia Capital",
    subtitle:
        "Projects related to the social network and game mixture, namely: Gather and RecRoom.",
  ),
  _InvestorComponent(
    title: "Index Ventures",
    subtitle:
        "4 investments in metaverse projects with a focus on streaming platforms.",
  ),
];

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

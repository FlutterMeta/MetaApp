part of '../products_page.dart';

class _FaqSection extends StatelessWidget {
  const _FaqSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Column(
          children: [
            _buildTitle(context),
            const SizedBox(height: 20),
            ListView.separated(
              itemCount: _faqItems().length,
              itemBuilder: (_, index) => _faqItems()[index],
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "FAQ",
        style: context.text.productsFaqSectionTitle,
      ),
    );
  }

  List<Widget> _faqItems() {
    return [
      const _FaqItem(
        question: "When can I buy NFT from MultiMeta NFT-Marketplace?",
        answer: "NFT-Marketplace Beta Launch scheduled for September 2022",
      ),
      const _FaqItem(
        question:
            "Is it possible to buy NFT from the MultiMeta collection on other marketplaces?",
        answer:
            "You can purchase NFT from the MultiMeta Collection on Binance NFT or OpenSea.",
      ),
      const _FaqItem(
        question:
            "Where is the best place to buy NFT from the MultiMeta collection?",
        answer:
            "On the multimeta.com platform, you do not have to pay commissions, while on external marketplaces, the commission can be up to 5% for NFT. When buying NFTs on MultiMeta NFT-Marketplace, we provide 5%-10% cashback to a profitable account for Metaverse clients under the age of 21 and over 65.",
      ),
      const _FaqItem(
        question: "When can I test MultiMeta's metaverse product?",
        answer:
            "Just in March-May 2023, we will present the MultiMeta Universe Beta version product with the functionality of Online meetings, as well as payment possibility in the metaverse of purchases linked to top NFT marketplaces that sell a huge number of unique and non-interchangeable goods and services. In May 2024 we will introduce the full metaverse functionality, and in December 2024 the MultiMeta Universe official launch will be announced.",
      ),
    ];
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = !_isHovered),
      onExit: (_) => setState(() => _isHovered = !_isHovered),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered ? context.color.faqItemHoverBackground : null,
          border: _isHovered
              ? Border.all(color: context.color.faqItemBorderHovered)
              : Border.all(color: context.color.faqItemBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            animationDuration: const Duration(milliseconds: 300),
            iconColor: context.color.faqItemArrowFill,
            collapseIcon: Icons.arrow_downward,
            expandIcon: Icons.arrow_forward,
            iconRotationAngle: pi / 2,
            useInkWell: false,
          ),
          header: Text(
            widget.question,
            style: context.text.productsFaqSectionItemText,
          ),
          collapsed: const SizedBox(),
          expanded: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.answer,
                style: context.text.productsFaqAnswer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

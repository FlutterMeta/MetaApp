part of '../products_page.dart';

class _FaqSection extends StatelessWidget {
  const _FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 820),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text("FAQ", style: context.text.productsFaqSectionTitle),
          const SizedBox(height: 16),
          ..._faqItems,
        ],
      ),
    );
  }
}

const _faqItems = [
  _FaqItem(
    text: "When can I buy NFT from MultiMeta NFT-Marketplace?",
  ),
  _FaqItem(
    text:
        "Is it possible to buy NFT from the MultiMeta collection on other marketplaces?",
  ),
  _FaqItem(
    text: "Where is the best place to buy NFT from the MultiMeta collection?",
  ),
  _FaqItem(
    text: "When can I test MultiMeta's metaverse product?",
  ),
  _FaqItem(
    text:
        "Where can I buy a MultiMeta Universe-compatible headset for traveling through the Metaverse?",
  ),
];

class _FaqItem extends StatefulWidget {
  final String text;

  const _FaqItem({
    required this.text,
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
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? context.color.fagItemHoverBackground : null,
          border: _isHovered
              ? null
              : Border.all(color: context.color.fagItemBorder),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.text,
                style: context.text.productsFaqSectionItemText,
              ),
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

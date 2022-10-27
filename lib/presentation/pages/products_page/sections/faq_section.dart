part of '../products_page.dart';

class _FaqSection extends StatelessWidget {
  const _FaqSection({Key? key}) : super(key: key);

  List<Widget> _faqItems(BuildContext context) {
    return [
      Center(
        child: Text(
          "FAQ",
          style: context.text.productsFaqSectionTitle,
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 820),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: _faqItems(context).length,
        itemBuilder: (BuildContext context, int index) {
          return _faqItems(context).elementAt(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        shrinkWrap: true,
      ),
    );
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

class _FaqItemState extends State<_FaqItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isExpanded = false;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.25);

  late AnimationController _controller;
  late Animation<double> _iconTurns;

  Widget _buildRotatingIcon() {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.arrow_forward),
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebButton(
      onTap: () => _handleTap(),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = !_isHovered),
        onExit: (_) => setState(() {
          _isHovered = !_isHovered;
          _isExpanded = false;
        }),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isHovered ? context.color.faqItemHoverBackground : null,
            border: _isHovered
                ? Border.all(color: context.color.faqItemBorderHovered)
                : Border.all(color: context.color.faqItemBorder),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: context.text.productsFaqSectionItemText,
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildRotatingIcon(),
                ],
              ),
              AnimatedContainer(
                height: _isExpanded ? 100 : 0,
                padding: const EdgeInsets.all(20),
                duration: const Duration(milliseconds: 300),
                child: Text(widget.answer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

part of '../products_page.dart';

class _GradientSection extends StatelessWidget {
  const _GradientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: context.gradient.purple,
      ),
      alignment: Alignment.center,
      child: Wrap(children: const [
        _InfoBlock(title: "We are trusted"),
        SizedBox(width: 100),
        ..._statsInfoBlocks,
      ]),
    );
  }
}

const _statsInfoBlocks = [
  _InfoBlock(title: "150+ K", description: "Investment Partners"),
  _InfoBlock(title: "12+ B", description: "Financial Capital"),
  _InfoBlock(title: "28+ K", description: "Partners multimeta.com"),
];

class _InfoBlock extends StatelessWidget {
  final String title;
  final String? description;

  const _InfoBlock({
    required this.title,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.productsGradientSectionTitle,
          ),
          const SizedBox(height: 10),
          Text(
            description ?? "",
            style: context.text.productsGradientSectionDescription,
          ),
        ],
      ),
    );
  }
}

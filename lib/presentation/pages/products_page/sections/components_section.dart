part of '../products_page.dart';

class _ComponentsSection extends StatelessWidget {
  const _ComponentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [
        Text(
          "The Metaverse Components",
          textAlign: TextAlign.center,
          style: context.text.productsComponentsSectionTitle,
        ),
        const SizedBox(height: 20),
        Text(
          "The main products for the Metaverse functioning, which are developed and searched by MultiMeta Universe.",
          textAlign: TextAlign.center,
          style: context.text.productsComponentItemDescription,
        ),
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Align(
            child: Wrap(
              spacing: 80,
              runSpacing: 16,
              children: _components,
            ),
          ),
        ),
      ]),
    );
  }
}

const _components = [
  _Component(
    imageAsset: "",
    title: "Equipment",
    description:
        "VR glasses and AR gadgets for interacting with the Metaverse.",
  ),
  _Component(
    imageAsset: "",
    title: "Artificial intelligence",
    description:
        "Allow to develop the project in the early stages of development to attract large investments.",
  ),
  _Component(
    imageAsset: "",
    title: "Venture investments",
    description:
        "Allow to develop the project in the early stages of development to attract large investments.",
  ),
  _Component(
    imageAsset: "",
    title: "Software",
    description: "Virtual world projects created using 3D engines.",
  ),
  _Component(
    imageAsset: "",
    title: "Data centers",
    description: "Cloud storage for metaverse data.",
  ),
  _Component(
    imageAsset: "",
    title: "Blockchain",
    description: "Attaches each user's data and money to a digital account.",
  ),
];

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
    return Column(
      children: [
        const SizedBox(
          height: 80,
          width: 80,
          child: Placeholder(),
        ), //Image.asset(imageAsset),
        const SizedBox(height: 30),
        Text(title, style: context.text.productsComponentItemTitle),
        const SizedBox(height: 14),
        SizedBox(
          width: 250,
          child: Text(
            description,
            style: context.text.productsComponentItemDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

part of '../products_page.dart';

class _PartnersSection extends StatelessWidget {
  const _PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.productsPartnersSectionBackground,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 6),
      constraints: const BoxConstraints(maxWidth: 1270),
      child: Column(
        crossAxisAlignment: context.screenWidth > 800
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            'MultiMeta current achievements in development',
            style: context.text.productsPartnersSectionSpecialPurple,
          ),
          const _AdaptiveSectionHeadlines(),
          const SizedBox(height: 10),
          _PartnersSlider(),
        ],
      ),
    );
  }
}

class _AdaptiveSectionHeadlines extends StatelessWidget {
  const _AdaptiveSectionHeadlines({super.key});

  List<Widget> _getHeadlines(BuildContext context) {
    return [
      Text(
        'MultiMeta Partners',
        style: context.text.productsPartnersSectionTitle,
      ),
      Text(
        'MultiMeta Participation in the popular metaverses development',
        style: context.text.productsPartnersSectionDescription,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 820) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _getHeadlines(context),
          );
        } else {
          return Column(
            children: _getHeadlines(context),
          );
        }
      },
    );
  }
}

class _PartnersSlider extends StatefulWidget {
  @override
  State<_PartnersSlider> createState() => _PartnersSliderState();
}

class _PartnersSliderState extends State<_PartnersSlider> {
  late CarouselController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1270),
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          disableCenter: true,
          viewportFraction: 1,
        ),
        items: [
          _PartnerCards(
            infoCardChild: const _PartnerInfoCard(
              logo: AppAssets.logo,
              description:
                  "Welcome to Decentraland. Create, explore and trade in a virtual world owned by its users.",
            ),
            imageCardChild: _PartnerImageCard(
              image: AppAssets.decentralandImage,
              onLeftArrowTap: () => _controller.previousPage(
                duration: const Duration(milliseconds: 300),
              ),
              onRightArrowTap: () => _controller.nextPage(
                duration: const Duration(milliseconds: 300),
              ),
              partnerName: 'Decentraland',
            ),
          ),
          _PartnerCards(
            infoCardChild: const _PartnerInfoCard(
              logo: AppAssets.telegramIcon,
              description:
                  "Space exploration strategy game, territorial conquest and political domination.",
            ),
            imageCardChild: _PartnerImageCard(
              image: AppAssets.starAtlasImage,
              onLeftArrowTap: () => _controller.previousPage(
                duration: const Duration(milliseconds: 300),
              ),
              onRightArrowTap: () => _controller.nextPage(
                duration: const Duration(milliseconds: 300),
              ),
              partnerName: 'Star Atlas',
            ),
          ),
          _PartnerCards(
            infoCardChild: const _PartnerInfoCard(
              logo: AppAssets.youtubeIcon,
              description: "sdfsdfsdfffffffffffffffffsdffs.",
            ),
            imageCardChild: _PartnerImageCard(
              image: AppAssets.logo,
              onLeftArrowTap: () => _controller.previousPage(
                duration: const Duration(milliseconds: 300),
              ),
              onRightArrowTap: () => _controller.nextPage(
                duration: const Duration(milliseconds: 300),
              ),
              partnerName: 'zaaas',
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerCards extends StatelessWidget {
  final Widget infoCardChild;
  final Widget imageCardChild;

  const _PartnerCards({
    required this.infoCardChild,
    required this.imageCardChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        infoCardChild,
        imageCardChild,
      ],
    );
  }
}

class _PartnerInfoCard extends StatefulWidget {
  final String logo;
  final String description;

  const _PartnerInfoCard({
    required this.logo,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<_PartnerInfoCard> createState() => __PartnerCardState();
}

class __PartnerCardState extends State<_PartnerInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.logo, height: 60),
          const Spacer(),
          Text(
            widget.description,
            style: context.text.productsPartnersInfoCardDescription,
          ),
          const SizedBox(height: 10),
          Text(
            "Go",
            style: context.text.productsPartnersSectionSpecialPurple,
          ),
        ],
      ),
    );
  }
}

class _PartnerImageCard extends StatefulWidget {
  final String image;
  final String partnerName;
  final VoidCallback onRightArrowTap;
  final VoidCallback onLeftArrowTap;

  const _PartnerImageCard({
    required this.image,
    required this.partnerName,
    required this.onRightArrowTap,
    required this.onLeftArrowTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_PartnerImageCard> createState() => _PartnerImageCardState();
}

class _PartnerImageCardState extends State<_PartnerImageCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 470,
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 20,
          child: _PartnerImageCardArrowSection(
            onLeftArrowTap: () => widget.onLeftArrowTap(),
            onRightArrowTap: () => widget.onRightArrowTap(),
            partnerName: widget.partnerName,
          ),
        ),
      ],
    );
  }
}

class _PartnerImageCardArrowSection extends StatelessWidget {
  final VoidCallback onRightArrowTap;
  final VoidCallback onLeftArrowTap;
  final String partnerName;

  const _PartnerImageCardArrowSection({
    required this.onRightArrowTap,
    required this.onLeftArrowTap,
    required this.partnerName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 40,
              color: Colors.white,
            ),
            onPressed: onLeftArrowTap,
          ),
          Text(
            partnerName,
            style: const TextStyle(color: Colors.white),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
              color: Colors.white,
            ),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}

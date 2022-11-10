part of '../products_page.dart';

class _PartnersSection extends StatelessWidget {
  const _PartnersSection({Key? key}) : super(key: key);

  static const double _smallScreenWidth = 780;
  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.productsPartnersSectionBackground,
      padding: const EdgeInsets.symmetric(vertical: 100),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: _horizontalPadding,
        ),
        constraints: const BoxConstraints(maxWidth: 1270),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment:
              context.screenWidth - _horizontalPadding * 2 > _smallScreenWidth
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
      ),
    );
  }
}

class _AdaptiveSectionHeadlines extends StatelessWidget {
  static const double _smallScreenWidth = 780;

  const _AdaptiveSectionHeadlines({Key? key}) : super(key: key);

  List<Widget> _getAdaptiveHeadlines(BuildContext context) {
    return [
      Expanded(
        child: Text(
          context.localizations.auroraPartners,
          style: context.text.productsPartnersSectionTitle,
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Text(
          context.localizations.participationInDevelopment,
          style: context.text.productsPartnersSectionDescription,
        ),
      ),
    ];
  }

  List<Widget> _getHeadlines(BuildContext context) {
    return [
      Text(
        context.localizations.auroraPartners,
        style: context.text.productsPartnersSectionTitle,
      ),
      const SizedBox(height: 20),
      Text(
        context.localizations.participationInDevelopment,
        style: context.text.productsPartnersSectionDescription,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _smallScreenWidth) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _getAdaptiveHeadlines(context),
          );
        }
        return Column(
          children: _getHeadlines(context),
        );
      },
    );
  }
}

class _PartnersSlider extends StatefulWidget {
  @override
  State<_PartnersSlider> createState() => _PartnersSliderState();
}

class _PartnersSliderState extends State<_PartnersSlider> {
  static const double _horizontalCarouselHeight = 500;
  static const double _verticalCarouselHeight = 600;
  static const double _contentMaxWidth = 1270;
  static const double _smallScreenWidth = 780;

  late CarouselController _controller;

  void _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
    );
  }

  void _previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          height: context.screenWidth > _smallScreenWidth
              ? _horizontalCarouselHeight
              : _verticalCarouselHeight,
          viewportFraction: 1,
          disableCenter: true,
          enableInfiniteScroll: false,
        ),
        items: [
          _PartnerCards(
            infoCardChild: _PartnerInfoCard(
              logo: AppAssets.decentralandLogo,
              description: context.localizations.welcomeToDecentraland,
            ),
            imageCardChild: _PartnerImageCard(
              image: AppAssets.decentralandImage,
              onLeftArrowTap: () => _previousPage(),
              onRightArrowTap: () => _nextPage(),
              partnerName: context.localizations.decentraland,
            ),
          ),
          _PartnerCards(
            infoCardChild: _PartnerInfoCard(
              logo: AppAssets.telegramIcon,
              description: context.localizations.spaceExploration,
            ),
            imageCardChild: _PartnerImageCard(
              image: AppAssets.starAtlasImage,
              onLeftArrowTap: () => _previousPage(),
              onRightArrowTap: () => _nextPage(),
              partnerName: context.localizations.starAtlas,
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerCards extends StatelessWidget {
  static const double _smallScreenWidth = 780;
  static const double _horizontalPaddings = 32;

  final Widget infoCardChild;
  final Widget imageCardChild;

  const _PartnerCards({
    required this.infoCardChild,
    required this.imageCardChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > _smallScreenWidth - _horizontalPaddings) {
        return Hover(
          builder: (_) {
            return Row(
              children: [
                Expanded(child: infoCardChild),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: imageCardChild,
                ),
              ],
            );
          },
        );
      }
      return Hover(
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: infoCardChild),
              const SizedBox(height: 16),
              Expanded(child: imageCardChild),
            ],
          );
        },
      );
    });
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
  static const double _padding = 30;
  static const double _maxWidth = 400;
  static const double _smallScreenWidth = 780;
  static const double partnerCardMaxHeight = 470;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      constraints: BoxConstraints(
        minWidth: context.screenWidth <= _smallScreenWidth
            ? context.screenWidth - 50
            : _smallScreenWidth,
        maxHeight: partnerCardMaxHeight,
      ),
      decoration: BoxDecoration(
        color: context.color.productsPartnersSectionCardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.color.productsPartnersSectionCardShadow,
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.logo,
            height: context.screenWidth <= _smallScreenWidth ? 40 : 60,
          ),
          const Spacer(),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: _maxWidth,
            ),
            child: AutoSizeText(
              widget.description,
              style: context.text.productsPartnersInfoCardDescription,
              maxLines: context.screenWidth < _smallScreenWidth ? 3 : 6,
            ),
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
  static const double _smallScreenWidth = 780;
  static const double partnerCardMaxHeight = 470;

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
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.screenWidth < _PartnerImageCard._smallScreenWidth
            ? context.screenWidth - 50
            : _PartnerImageCard._smallScreenWidth,
        maxHeight: context.screenWidth < _PartnerImageCard._smallScreenWidth
            ? 150
            : _PartnerImageCard.partnerCardMaxHeight,
      ),
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovered = !_isHovered),
        onExit: (event) => setState(() => _isHovered = !_isHovered),
        child: Stack(
          children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                    scale: _isHovered ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: context.gradient.blackVertical,
                ),
              ),
            ]),
            Positioned(
              left: 0,
              right: 14,
              bottom: 24,
              child: _PartnerImageCardArrowSection(
                onLeftArrowTap: () => widget.onLeftArrowTap(),
                onRightArrowTap: () => widget.onRightArrowTap(),
                partnerName: widget.partnerName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnImageCardHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const _OnImageCardHover({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _OnImageCardHoverState createState() => _OnImageCardHoverState();
}

class _OnImageCardHoverState extends State<_OnImageCardHover> {
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Matrix4 _transform() {
    final hovered = Matrix4.identity()..scale(1.3);
    return _isHovered ? hovered : Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _transform(),
        child: widget.builder(_isHovered),
      ),
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
          _OnArrowHover(
            isLeftArrow: true,
            builder: (_) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 40,
                  color: context.color.productsPartnersSectionArrowButton,
                ),
                onPressed: onLeftArrowTap,
              );
            },
          ),
          Center(
            child: Text(
              partnerName,
              style: context.text.productsPartnerName,
            ),
          ),
          _OnArrowHover(
            builder: (_) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 40,
                  color: context.color.productsPartnersSectionArrowButton,
                ),
                onPressed: onRightArrowTap,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OnArrowHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final bool? isLeftArrow;

  const _OnArrowHover({
    required this.builder,
    this.isLeftArrow,
    Key? key,
  }) : super(key: key);

  @override
  _OnArrowHoverState createState() => _OnArrowHoverState();
}

class _OnArrowHoverState extends State<_OnArrowHover> {
  bool _isHovered = false;

  void _onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Matrix4 _transform() {
    if (widget.isLeftArrow == true) {
      return Matrix4.identity()..translate(_isHovered ? -4 : 0, 0, 0);
    } else {
      return Matrix4.identity()..translate(_isHovered ? 4 : 0, 0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _transform(),
        child: widget.builder(_isHovered),
      ),
    );
  }
}

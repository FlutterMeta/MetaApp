part of '../header.dart';

class _CompactMenu extends StatefulWidget {
  final double Function() headerYOffset;

  const _CompactMenu({
    required this.headerYOffset,
    Key? key,
  }) : super(key: key);

  @override
  State<_CompactMenu> createState() => _CompactMenuState();
}

class _CompactMenuState extends State<_CompactMenu>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController animationController;
  late Animation<double> animation;
  OverlayEntry? overlayEntry;

  bool _isClicked = false;

  void _onMenuButtonTap() {
    _isClicked ? _removeOverlay() : _showOverlay();
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  void _showOverlay() async {
    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: widget.headerYOffset(),
        height: context.screenHeight - widget.headerYOffset(),
        width: context.screenWidth,
        child: _OverlayMenu(animation: animation),
      ),
    );
    overlayEntry?.let((entry) {
      overlayState?.insert(entry);
      animationController.forward();
    });
  }

  void _removeOverlay() {
    if (overlayEntry?.mounted ?? false) {
      animationController.reverse();
      overlayEntry?.remove();
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = CurveTween(curve: Curves.linear).animate(animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration.zero, () {
      if (mounted && context.screenWidth > 780) _removeOverlay();
    });

    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPushNext() async {
    setState(() {
      _isClicked = !_isClicked;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    _removeOverlay();
  }

  @override
  void dispose() {
    _removeOverlay();
    animationController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _onMenuButtonTap,
          icon: _isClicked ? const Icon(Icons.close) : const Icon(Icons.menu),
          iconSize: 30,
          splashRadius: 26,
        ),
        const MediaButtons(),
      ],
    );
  }
}

class _OverlayMenu extends StatelessWidget {
  final Animation<double> animation;

  const _OverlayMenu({
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.menuOpacity,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          color: context.color.headerBackground,
          child: const _MenuTabs(),
        ),
      ),
    );
  }
}

class _MenuTabs extends StatelessWidget {
  const _MenuTabs({Key? key}) : super(key: key);

  void _goToPartnersPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PartnersPage(),
    ));
  }

  void _goToProductsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _NavigationButton(
          onTap: () {},
          title: context.localizations.directions,
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          onTap: () => _goToProductsPage(context),
          title: context.localizations.products,
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          onTap: () => _goToPartnersPage(context),
          title: context.localizations.partners,
        ),
        const SizedBox(height: 26),
        const _AccountButton(),
        const SizedBox(height: 26),
        const SizedBox(
          width: 82,
          child: _LocaleDropdown(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

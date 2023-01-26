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
    with SingleTickerProviderStateMixin, AutoRouteAware {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AutoRouteObserver? _observer;

  OverlayEntry? _overlayEntry;
  bool _isClicked = false;

  void _onMenuButtonTap() {
    _isClicked ? _removeOverlay() : _showOverlay();
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  void _showOverlay() async {
    OverlayState? overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: widget.headerYOffset(),
        height: context.screenHeight - widget.headerYOffset(),
        width: context.screenWidth,
        child: _OverlayMenu(animation: _animation),
      ),
    );
    _overlayEntry?.let((entry) {
      overlayState?.insert(entry);
      _animationController.forward();
    });
  }

  void _removeOverlay() {
    if (_overlayEntry?.mounted ?? false) {
      _animationController.reverse();
      _overlayEntry?.remove();
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurveTween(curve: Curves.linear).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration.zero, () {
      if (mounted && context.screenWidth > 780) _removeOverlay();
    });

    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
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
    _animationController.dispose();
    _observer?.unsubscribe(this);
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
    context.router.navigate(PartnersRoute());
  }

  void _goToProductsPage(BuildContext context) {
    context.router.navigate(ProductsRoute());
  }

  void _goToDirectionsPage(BuildContext context) {
    context.router.navigate(DirectionsRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _NavigationButton(
          title: context.localizations.directions,
          routeName: DirectionsRoute.name,
          onTap: () => _goToDirectionsPage(context),
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          title: context.localizations.products,
          routeName: ProductsRoute.name,
          onTap: () => _goToProductsPage(context),
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          title: context.localizations.partners,
          routeName: PartnersRoute.name,
          onTap: () => _goToPartnersPage(context),
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

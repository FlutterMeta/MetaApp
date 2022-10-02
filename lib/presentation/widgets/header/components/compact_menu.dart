part of '../header.dart';

class _CompactMenu extends StatefulWidget {
  const _CompactMenu({Key? key}) : super(key: key);

  @override
  State<_CompactMenu> createState() => _CompactMenuState();
}

class _CompactMenuState extends State<_CompactMenu>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController animationController;
  late Animation<double> animation;
  late OverlayEntry overlayEntry;

  static const _headerHeight = 110;
  bool _isClicked = false;

  void _onMenuButtonTap() {
    _isClicked ? _removeOverlay() : _showOverlay();
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  OverlayEntry _getOverlay() {
    return OverlayEntry(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Material(
          color: context.color.menuOpacity,
          child: WebButton(
            onTap: (() {
              if (mounted) {
                setState(() {
                  _isClicked = !_isClicked;
                });
                _removeOverlay();
              }
            }),
            child: FadeTransition(
              opacity: animation,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: context.screenHeight - _headerHeight,
                width: context.screenWidth,
                child: const _MenuTabs(),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _showOverlay() async {
    OverlayState? overlayState = Overlay.of(context);
    overlayState?.insert(overlayEntry);
    animationController.forward();
  }

  void _removeOverlay() {
    if (!overlayEntry.mounted) return;
    animationController.reverse();
    overlayEntry.remove();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = CurveTween(curve: Curves.linear).animate(animationController);
    overlayEntry = _getOverlay();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      if (mounted && context.screenWidth > 780) _removeOverlay();
    });
    super.didChangeDependencies();

    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPushNext() async {
    _isClicked = !_isClicked;
    setState(() {});

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
        const _SocialComponent(),
      ],
    );
  }
}

class _MenuTabs extends StatelessWidget {
  const _MenuTabs({Key? key}) : super(key: key);

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
          onTap: () {},
          title: context.localizations.products,
        ),
        const SizedBox(height: 26),
        _NavigationButton(
          onTap: () {},
          title: context.localizations.partners,
        ),
        const SizedBox(height: 26),
        const _AccountButton(),
        const SizedBox(height: 26),
        const _LocaleDropdown(),
        const SizedBox(height: 100),
      ],
    );
  }
}

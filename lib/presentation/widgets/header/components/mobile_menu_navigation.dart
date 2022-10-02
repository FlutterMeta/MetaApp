part of '../header.dart';

class _MobileMenuNavigation extends StatefulWidget {
  const _MobileMenuNavigation({Key? key}) : super(key: key);

  @override
  State<_MobileMenuNavigation> createState() => _MobileMenuNavigationState();
}

class _MobileMenuNavigationState extends State<_MobileMenuNavigation>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController animationController;
  late Animation<double> animation;
  late OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Material(
        color: Colors.transparent,
        child: WebButton(
          onTap: (() {
            _isClicked = !_isClicked;
            if (mounted) setState(() {});
            _removeOverlay();
          }),
          child: FadeTransition(
            opacity: animation,
            child: AnimatedContainer(
              color: Colors.white,
              height: context.screenHeight - 110,
              width: context.screenWidth,
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear,
              child: const _MobileMenuContent(),
            ),
          ),
        ),
      ),
    );
  });
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = CurveTween(curve: Curves.linear).animate(animationController);
  }

  void _showOverlay() async {
    OverlayState? overlayState = Overlay.of(context);

    animationController.addListener(() {
      overlayState?.setState(() {});
    });
    overlayState?.insert(overlayEntry);
    animationController.forward();
  }

  void _removeOverlay() {
    if (!overlayEntry.mounted) return;
    animationController.reverse();
    overlayEntry.remove();
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
          onPressed: () {
            _isClicked ? _removeOverlay() : _showOverlay();
            _isClicked = !_isClicked;
            setState(() {});
          },
          icon: _isClicked ? const Icon(Icons.close) : const Icon(Icons.menu),
          iconSize: 30,
          splashRadius: 26,
        ),
        const _SocialComponent(),
      ],
    );
  }
}

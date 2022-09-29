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
  late OverlayEntry overlayEntry;
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    animation =
        CurveTween(curve: Curves.fastOutSlowIn).animate(animationController);

    overlayEntry = OverlayEntry(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Material(
          child: WebButton(
            onTap: (() {
              _isClicked = !_isClicked;
              setState(() {});
              _removeOverlay();
            }),
            child: FadeTransition(
              opacity: animation,
              child: AnimatedContainer(
                height: context.screenHeight - 120,
                width: context.screenWidth,
                duration: const Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                child: const _MobileMenuContent(),
              ),
            ),
          ),
        ),
      );
    });
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
      if (context.screenWidth > 780) _removeOverlay();
    });
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPushNext() {
    _isClicked = !_isClicked;
    setState(() {});
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

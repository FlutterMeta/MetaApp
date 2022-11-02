part of '../header.dart';

class _LocaleDropdown extends StatefulWidget {
  const _LocaleDropdown({Key? key}) : super(key: key);

  @override
  State<_LocaleDropdown> createState() => _LocaleDropdownState();
}

class _LocaleDropdownState extends State<_LocaleDropdown>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController animationController;
  late Animation<double> animation;
  late AppLocale currentLocale;

  void showOverlay() {
    final overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy,
        left: offset.dx,
        child: _LocaleOverlay(
          animation: animation,
          onExit: removeOverlay,
        ),
      ),
    );

    _overlayEntry?.let((entry) {
      overlayState?.insert(entry);
      animationController.forward();
    });
  }

  void removeOverlay() {
    if (_overlayEntry?.mounted ?? false) {
      animationController.reverse();
      _overlayEntry?.remove();
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurveTween(curve: Curves.linear).animate(animationController);
    currentLocale = locator<SharedPrefs>().getLocale();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration.zero, () {
      if (mounted && context.screenWidth > 780) removeOverlay();
    });
  }

  @override
  void dispose() {
    removeOverlay();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => showOverlay(),
      child: InkWell(
        onTap: () => showOverlay(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                currentLocale.localeFlag ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocaleOverlay extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onExit;

  const _LocaleOverlay({
    required this.animation,
    required this.onExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.localeDropdownOpacity,
      child: FadeTransition(
        opacity: animation,
        child: MouseRegion(
          onExit: (_) => onExit(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.color.localeDropdownBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _LocaleWidget(locale: AppLocale.en),
                  _LocaleWidget(locale: AppLocale.ru),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LocaleWidget extends StatelessWidget {
  final AppLocale locale;

  const _LocaleWidget({
    required this.locale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LocaleManager.setLocaleAction(context, locale),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(locale.localeFlag ?? ""),
            const SizedBox(width: 10),
            Text(
              locale.toTitle(context),
              style: context.text.localeTitle,
            ),
          ],
        ),
      ),
    );
  }
}

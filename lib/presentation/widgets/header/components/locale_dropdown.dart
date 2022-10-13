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

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurveTween(curve: Curves.linear).animate(animationController);
  }

  void showOverlay() {
    final overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height + 5,
        left: offset.dx,
        child: GestureDetector(
          child: _LocaleOverlay(
            animation: animation,
            onExit: () => removeOverlay(),
          ),
        ),
      ),
    );

    if (_overlayEntry?.mounted ?? false) return;

    _overlayEntry?.let((entry) {
      animationController.forward();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => overlayState?.insert(_overlayEntry as OverlayEntry),
      );
    });
  }

  void removeOverlay() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_overlayEntry?.mounted ?? false) {
        animationController.reverse();
        _overlayEntry?.remove();
      }
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => showOverlay(),
            child: Row(
              children: const [
                Icon(Icons.language),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
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

  List<_LocaleWidget> getLocales(BuildContext context) {
    return [
      _LocaleWidget(
        flagAsset: AppAssets.engFlag,
        localeTitle: context.localizations.english,
        locale: AppLocale.en,
      ),
      _LocaleWidget(
        flagAsset: AppAssets.ukrFlag,
        localeTitle: context.localizations.ukrainian,
        locale: AppLocale.uk,
      ),
      _LocaleWidget(
        flagAsset: AppAssets.rusFlag,
        localeTitle: context.localizations.russian,
        locale: AppLocale.ru,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) => onExit(),
      child: Material(
        color: context.color.localeDropdownOpacity,
        child: FadeTransition(
          opacity: animation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.color.localeDropdownBackground,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getLocales(context),
            ),
          ),
        ),
      ),
    );
  }
}

class _LocaleWidget extends StatelessWidget {
  final String flagAsset;
  final String localeTitle;
  final AppLocale locale;

  const _LocaleWidget({
    required this.flagAsset,
    required this.localeTitle,
    required this.locale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => LocaleManager.setLocaleAction(context, locale),
        child: Row(
          children: [
            Image.asset(flagAsset, height: 26, width: 20),
            const SizedBox(width: 10),
            Text(localeTitle, style: context.text.localeTitle),
          ],
        ),
      ),
    );
  }
}

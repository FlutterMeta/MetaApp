part of "../partners_page.dart";

class _IncomeSection extends StatelessWidget {
  const _IncomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.screenWidth > 780) {
      return const _IncomeSectionExpanded();
    }
    return const _IncomeSectionCollapsed();
  }
}

class _IncomeSectionCollapsed extends StatelessWidget {
  const _IncomeSectionCollapsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.color.incomeSectionBackground,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localizations.wmaIncome,
                  style: context.text.incomeSectionTitle,
                ),
                const SizedBox(height: 20),
                Text(
                  context.localizations.chooseMostProfitableWay,
                  style: context.text.incomeSectionText,
                ),
                const SizedBox(height: 20),
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    GradientButton(
                      title: context.localizations.downloadPdfPresentation,
                      onTap: () {},
                    ),
                    _JoinButton(onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IncomeSectionExpanded extends StatefulWidget {
  const _IncomeSectionExpanded({Key? key}) : super(key: key);

  @override
  State<_IncomeSectionExpanded> createState() => _IncomeSectionExpandedState();
}

class _IncomeSectionExpandedState extends State<_IncomeSectionExpanded> {
  late VideoPlayerController _controller;

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset(AppAssets.incomeVideo);
    await _controller.initialize();
    await _controller.setLooping(true);
    _controller.play();
  }

  void _disposeVideoPlayer() async {
    await _controller.pause();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _disposeVideoPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.color.incomeSectionBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.wmaIncome,
                    style: context.text.incomeSectionTitle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.localizations.chooseMostProfitableWay,
                    style: context.text.incomeSectionText,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      GradientButton(
                        title: context.localizations.downloadPdfPresentation,
                        onTap: () {},
                      ),
                      _JoinButton(onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: _VideoSection(controller: _controller)),
          ],
        ),
      ),
    );
  }
}

class _VideoSection extends StatelessWidget {
  final VideoPlayerController controller;

  const _VideoSection({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 550,
        width: 550,
        child: VideoPlayer(controller),
      ),
    );
  }
}

class _JoinButton extends StatelessWidget {
  final VoidCallback onTap;

  const _JoinButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hover(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: context.color.joinButtonBorder),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          clipBehavior: Clip.antiAlias,
          child: WebButton(
            onTap: onTap,
            child: Text(
              context.localizations.join,
              textAlign: TextAlign.center,
              style: context.text.joinButton,
            ),
          ),
        );
      },
    );
  }
}

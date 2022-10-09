part of '../footer.dart';

class _FooterNavigation extends StatelessWidget {
  const _FooterNavigation({super.key});

  List<_NavTabLink> _multimetaLinks(BuildContext context) {
    return [
      _NavTabLink(onTap: () {}, title: context.localizations.directions),
      _NavTabLink(onTap: () {}, title: context.localizations.products),
      _NavTabLink(onTap: () {}, title: context.localizations.partners),
    ];
  }

  List<_NavTabLink> _resourcesLinks(BuildContext context) {
    return [
      _NavTabLink(onTap: () {}, title: context.localizations.officeProgram),
      _NavTabLink(onTap: () {}, title: context.localizations.roadmap),
      _NavTabLink(onTap: () {}, title: context.localizations.whitePaper),
    ];
  }

  List<_NavTabLink> _accountLinks(BuildContext context) {
    return [
      _NavTabLink(onTap: () {}, title: context.localizations.login),
      _NavTabLink(onTap: () {}, title: context.localizations.createAccount),
      _NavTabLink(onTap: () {}, title: context.localizations.forgotPassword),
      _NavTabLink(onTap: () {}, title: context.localizations.usagePolicy),
    ];
  }

  List<_NavTabLink> _mediaAndSupportLinks(BuildContext context) {
    return [
      _NavTabLink(onTap: () {}, title: context.localizations.telegram),
      _NavTabLink(onTap: () {}, title: context.localizations.email),
      _NavTabLink(onTap: () {}, title: context.localizations.submitTicket),
      _NavTabLink(onTap: () {}, title: context.localizations.questions),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
      child: Wrap(
        spacing: 80,
        runSpacing: 40,
        children: [
          _NavTab(
            title: context.localizations.multimeta,
            links: _multimetaLinks(context),
          ),
          _NavTab(
            title: context.localizations.resources,
            links: _resourcesLinks(context),
          ),
          _NavTab(
            title: context.localizations.account,
            links: _accountLinks(context),
          ),
          _NavTab(
            title: context.localizations.mediaAndSupport,
            links: _mediaAndSupportLinks(context),
          ),
        ],
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final String title;
  final List<_NavTabLink> links;

  const _NavTab({
    required this.title,
    required this.links,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.footerNavTabTitle,
          ),
          ...links,
        ],
      ),
    );
  }
}

class _NavTabLink extends StatefulWidget {
  final VoidCallback onTap;
  final String title;

  const _NavTabLink({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<_NavTabLink> createState() => _NavTabLinkState();
}

class _NavTabLinkState extends State<_NavTabLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        onHover: (_) => setState(() {
          _isHovered = !_isHovered;
        }),
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: _isHovered
              ? context.text.footerHoveredNavTabText
              : context.text.footerNavTabText,
        ),
      ),
    );
  }
}

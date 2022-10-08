import 'package:flutter/material.dart';

import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class FooterNavigation extends StatelessWidget {
  const FooterNavigation({super.key});

  List<_NavColumnLink> _multimetaLinks(BuildContext context) {
    return [
      _NavColumnLink(onTap: () {}, title: context.localizations.directions),
      _NavColumnLink(onTap: () {}, title: context.localizations.products),
      _NavColumnLink(onTap: () {}, title: context.localizations.partners),
    ];
  }

  List<_NavColumnLink> _resourcesLinks(BuildContext context) {
    return [
      _NavColumnLink(onTap: () {}, title: context.localizations.officeProgram),
      _NavColumnLink(onTap: () {}, title: context.localizations.roadmap),
      _NavColumnLink(onTap: () {}, title: context.localizations.whitePaper),
    ];
  }

  List<_NavColumnLink> _accountLinks(BuildContext context) {
    return [
      _NavColumnLink(onTap: () {}, title: context.localizations.login),
      _NavColumnLink(onTap: () {}, title: context.localizations.createAccount),
      _NavColumnLink(onTap: () {}, title: context.localizations.forgotPassword),
      _NavColumnLink(onTap: () {}, title: context.localizations.usagePolicy),
    ];
  }

  List<_NavColumnLink> _mediaAndSupportLinks(BuildContext context) {
    return [
      _NavColumnLink(onTap: () {}, title: context.localizations.telegram),
      _NavColumnLink(onTap: () {}, title: context.localizations.email),
      _NavColumnLink(onTap: () {}, title: context.localizations.submitTicket),
      _NavColumnLink(onTap: () {}, title: context.localizations.questions),
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
          _NavColumn(
            title: context.localizations.multimeta,
            links: _multimetaLinks(context),
          ),
          _NavColumn(
            title: context.localizations.resources,
            links: _resourcesLinks(context),
          ),
          _NavColumn(
            title: context.localizations.account,
            links: _accountLinks(context),
          ),
          _NavColumn(
            title: context.localizations.mediaAndSupport,
            links: _mediaAndSupportLinks(context),
          ),
        ],
      ),
    );
  }
}

class _NavColumn extends StatelessWidget {
  final String title;
  final List<_NavColumnLink> links;

  const _NavColumn({
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
            style: context.text.footerNavColumnTitle,
          ),
          ...links,
        ],
      ),
    );
  }
}

class _NavColumnLink extends StatefulWidget {
  final VoidCallback onTap;
  final String title;

  const _NavColumnLink({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<_NavColumnLink> createState() => _NavColumnLinkState();
}

class _NavColumnLinkState extends State<_NavColumnLink> {
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
              ? context.text.hoveredFooterNavColumnText
              : context.text.footerNavColumnText,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

import '../../navigation/app_router.gr.dart';

class Menu extends StatelessWidget {
  final List<Widget> Function(BuildContext context, VoidCallback closeOnTap)
      items;
  final Animation<double>? animation;
  final VoidCallback onCloseItemTap;

  const Menu({
    required this.items,
    required this.animation,
    required this.onCloseItemTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.localeDropdownOpacity,
      child: FadeTransition(
        opacity: animation as Animation<double>,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.color.profilePageBackground,
            boxShadow: [
              BoxShadow(
                color: context.color.profilePagePrimary.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...items(context, onCloseItemTap),
                _MenuItem(
                  onTap: () => context.router.push(const LoginRoute()),
                  closeMenuCallback: onCloseItemTap,
                  title: context.localizations.signOut,
                  icon: Icons.logout_rounded,
                  color: context.color.profilePageError,
                ),
                _MenuItem(
                  onTap: () => onCloseItemTap(),
                  title: context.localizations.closeMenu,
                  icon: Icons.close_rounded,
                  color: context.color.greyish,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends Menu {
  static List<Widget> _adminMenuItems(
    BuildContext context,
    VoidCallback closeOnTap,
  ) {
    return [
      _MenuItem(
        onTap: () => context.router.push(BlogRoute()),
        closeMenuCallback: closeOnTap,
        title: context.localizations.updateBlog,
        icon: Icons.table_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const TransactionsRoute()),
        closeMenuCallback: closeOnTap,
        title: context.localizations.allTransactions,
        icon: Icons.list_alt,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const FinancialIndicatorsRoute()),
        title: context.localizations.financialResults,
        closeMenuCallback: closeOnTap,
        icon: Icons.pie_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(HomeRoute()),
        title: context.localizations.requisites,
        closeMenuCallback: closeOnTap,
        icon: Icons.request_page,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(HomeRoute()),
        closeMenuCallback: closeOnTap,
        title: context.localizations.createAdmin,
        icon: Icons.edit_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
    ];
  }

  const ProfileMenu({
    required List<Widget> Function(BuildContext, VoidCallback) items,
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) : super(
          items: items,
          animation: animation,
          onCloseItemTap: onCloseItemTap,
          key: key,
        );

  factory ProfileMenu.client({
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: (_, __) => [],
        animation: animation,
        onCloseItemTap: onCloseItemTap,
        key: key,
      );

  factory ProfileMenu.admin({
    required Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: _adminMenuItems,
        animation: animation,
        onCloseItemTap: onCloseItemTap,
        key: key,
      );
}

class _MenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? closeMenuCallback;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.closeMenuCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  void handleTap() {
    if (widget.closeMenuCallback != null) {
      widget.closeMenuCallback?.call();
    }
    Future.delayed(const Duration(milliseconds: 300), () => widget.onTap());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleTap,
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              _isHovered ? widget.color : context.color.profilePageBackground,
        ),
        constraints: const BoxConstraints(minWidth: 190),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 6),
            Icon(
              widget.icon,
              color: _isHovered
                  ? context.color.profilePageBackground
                  : widget.color,
            ),
            const SizedBox(width: 6),
            Text(
              widget.title,
              style: TextStyle(
                color: _isHovered
                    ? context.color.profilePageBackground
                    : widget.color,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

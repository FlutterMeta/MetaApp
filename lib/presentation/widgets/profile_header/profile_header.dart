import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/day_night_icon.dart';
import 'package:meta_app/presentation/widgets/profile_header/animated_menu_icon.dart';
import 'package:meta_app/presentation/widgets/profile_header/rounded_search_bar.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

import '../header.dart';

class ProfileHeader extends Header {
  const ProfileHeader({
    GlobalKey<ScaffoldState> Function()? scaffoldKey,
    Widget? searchBar,
    Widget? supportIcon,
    Widget? menuIcon,
    Key? key,
  }) : super(
          scaffoldKey: scaffoldKey,
          searchBar: searchBar,
          supportIcon: supportIcon,
          menuIcon: menuIcon,
          key: key,
        );

  factory ProfileHeader.client({
    required GlobalKey<ScaffoldState> Function()? scaffoldKey,
  }) =>
      ProfileHeader(
        scaffoldKey: scaffoldKey,
        menuIcon: _SideMenuIcon(scaffoldKey: scaffoldKey),
        supportIcon: const DayNightIcon(),
      );

  factory ProfileHeader.admin() => const ProfileHeader();

  factory ProfileHeader.adminSearch() =>
      const ProfileHeader(searchBar: RoundedSearchBar());
}

class _SideMenuIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> Function()? scaffoldKey;

  const _SideMenuIcon({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: context.color.profilePageTransparent,
      highlightColor: context.color.profilePageTransparent,
      hoverColor: context.color.profilePageTransparent,
      splashRadius: 24,
      onPressed: () {
        if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
          scaffoldKey?.call().currentState?.openDrawer();
        }
      },
      iconSize: 36,
      icon: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? Icon(
              Icons.menu_rounded,
              color: context.color.profilePagePrimary,
            )
          : const AnimatedMenuIcon(),
    );
  }
}

class _SupportChatIcon extends StatelessWidget {
  const _SupportChatIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.chat_bubble_outline_rounded),
    );
  }
}

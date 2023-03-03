import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/profile_header/menu.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/return_home_logo.dart';
import '../pages/client_profile/menu_controller.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> Function()? scaffoldKey;
  final Widget? searchBar;
  final Widget? supportIcon;
  final Widget? menuIcon;

  const Header({
    this.scaffoldKey,
    this.searchBar,
    this.supportIcon,
    this.menuIcon,
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size(double.infinity, 120);
}

class _HeaderState extends State<Header> {
  @override
  void didChangeDependencies() {
    final menuCollapsedState = MenuController.isCollapsed.value;

    if ((Responsive.isMobile(context) || Responsive.isTablet(context)) &&
        menuCollapsedState) {
      MenuController.isCollapsed.value = false;
    }

    if (widget.scaffoldKey != null) {
      widget.scaffoldKey?.call().currentState?.closeDrawer();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ValueListenableBuilder(
        valueListenable: MenuController.isCollapsed,
        builder: (context, isCollapsed, child) {
          return Row(
            children: [
              if (!isCollapsed) SizedBox(width: context.screenWidth * 0.02),
              if (Responsive.isDesktop(context))
                const ReturnHomeLogo(height: 68),
              widget.menuIcon ?? const SizedBox(),
              const Spacer(),
              widget.searchBar ?? const SizedBox(),
              const Spacer(),
              widget.supportIcon ?? const SizedBox(),
              const SizedBox(width: 10),
              const _UserInfo(
                userName: "Bobr123",
                email: "adwdawdwa@gmail.com",
              ),
            ],
          );
        },
      ),
    );
  }
}

class _UserInfo extends StatefulWidget {
  final String email;
  final String userName;

  const _UserInfo({
    required this.email,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  State<_UserInfo> createState() => UserInfoState();
}

class UserInfoState extends State<_UserInfo>
    with SingleTickerProviderStateMixin {
  bool _isMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isMenuVisible = !_isMenuVisible),
      child: PortalTarget(
        visible: _isMenuVisible,
        closeDuration: kThemeAnimationDuration,
        anchor: Aligned(
          follower: Alignment.topCenter,
          target: Responsive.isDesktop(context)
              ? Alignment.bottomCenter
              : Alignment.bottomLeft,
        ),
        portalFollower: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: kThemeAnimationDuration,
          builder: (context, animation, child) {
            return AnimatedOpacity(
              opacity: animation,
              duration: kThemeAnimationDuration,
              child: ProfileMenu.admin(
                onCloseItemTap: () => setState(() => _isMenuVisible = false),
              ),
            );
          },
        ),
        child: Row(
          children: [
            if (Responsive.isDesktop(context)) ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        context.localizations.welcome,
                        style:
                            context.text.profilePageBody.copyWith(fontSize: 16),
                      ),
                      Text(
                        widget.userName,
                        style: context.text.profilePageBody.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(widget.email, style: context.text.profileHeaderSubtitle),
                ],
              ),
            ] else
              Text(
                widget.userName,
                style: context.text.profilePageBody
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            Icon(
              Icons.account_circle,
              size: Responsive.isDesktop(context) ? 80 : 50,
              color: context.color.partnersCardBackground,
            ),
          ],
        ),
      ),
    );
  }
}

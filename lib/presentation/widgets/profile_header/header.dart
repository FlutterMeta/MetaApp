import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/profile_header/menu.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/return_home_logo.dart';
import 'package:useful_extensions/useful_extensions.dart';
import '../../pages/client_profile/menu_controller.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
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
      widget.scaffoldKey?.currentState?.closeDrawer();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isDesktop(context)) const ReturnHomeLogo(height: 68),
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
  }
}

class ProfileHeader extends Header {
  const ProfileHeader({
    GlobalKey<ScaffoldState>? scaffoldKey,
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
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) =>
      ProfileHeader(
        scaffoldKey: scaffoldKey,
        menuIcon: _SideMenuIcon(scaffoldKey: scaffoldKey),
        supportIcon: const _SupportChatIcon(),
      );

  factory ProfileHeader.admin() => const ProfileHeader();

  factory ProfileHeader.adminSearch() =>
      const ProfileHeader(searchBar: _SearchBar());
}

class _SideMenuIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

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
          scaffoldKey.currentState?.openDrawer();
        }
      },
      iconSize: 36,
      icon: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? Icon(
              Icons.menu_rounded,
              color: context.color.profilePagePrimary,
            )
          : const _AnimatedMenuIcon(),
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

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.profilePagePrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: Responsive.isDesktop(context)
          ? context.screenWidth * 0.4
          : context.screenWidth * 0.5,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: context.localizations.userSearch,
          hintStyle: context.text.headerNavItemHovered
              .copyWith(fontWeight: FontWeight.bold),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 16),
            child: Icon(
              Icons.search_rounded,
              color: context.color.profilePagePrimary,
            ),
          ),
        ),
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
  late AnimationController _animationController;
  OverlayEntry? _overlayEntry;
  Animation<double>? _animation;

  void showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: offset.dy + size.height,
        right: 10,
        child: ProfileMenu.admin(
          animation: _animation,
          onCloseItemTap: removeOverlay,
        ),
      );
    });

    _overlayEntry?.let((entry) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => overlayState?.insert(entry));
      _animationController.forward();
    });
  }

  void removeOverlay() async {
    await _animationController.reverse();
    _overlayEntry?.remove();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurveTween(curve: Curves.linear).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showOverlay(context),
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
                      style: context.text.profilePageBody
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}

class _AnimatedMenuIcon extends StatefulWidget {
  const _AnimatedMenuIcon({Key? key}) : super(key: key);

  @override
  State<_AnimatedMenuIcon> createState() => __AnimatedMenuIconState();
}

class __AnimatedMenuIconState extends State<_AnimatedMenuIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeState() {
    final menuCollapsedState = MenuController.isCollapsed;

    if (menuCollapsedState.value) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    menuCollapsedState.value = !menuCollapsedState.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeState,
      child: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        color: context.color.profilePageSecondary,
        progress: _controller,
        size: 36,
      ),
    );
  }
}

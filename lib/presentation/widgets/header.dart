import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/profile_header/menu.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/return_home_logo.dart';
import 'package:useful_extensions/useful_extensions.dart';
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

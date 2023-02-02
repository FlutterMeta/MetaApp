import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:meta_app/presentation/widgets/return_home_logo.dart';
import 'package:useful_extensions/useful_extensions.dart';
import '../pages/client_profile_page/menu_state.dart';

class ProfileHeader extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfileHeader({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();

  @override
  Size get preferredSize => const Size(double.infinity, 120);
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  void didChangeDependencies() {
    final menuCollapsedState = MenuState.isCollapsed.value;

    if ((Responsive.isMobile(context) || Responsive.isTablet(context)) &&
        menuCollapsedState) {
      MenuState.isCollapsed.value = false;
    }

    widget.scaffoldKey.currentState?.closeDrawer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: MenuState.isCollapsed,
        builder: (context, isCollapsed, child) {
          return Padding(
            padding: isCollapsed
                ? const EdgeInsets.only(right: 10)
                : EdgeInsets.only(
                    left: Responsive.isMobile(context) ? 10 : 60,
                    right: 10,
                  ),
            child: Row(
              children: [
                Responsive.isDesktop(context)
                    ? const ReturnHomeLogo(height: 68)
                    : const SizedBox(),
                isCollapsed
                    ? const SizedBox()
                    : SizedBox(width: context.screenWidth * 0.02),
                IconButton(
                  splashColor: context.color.profilePageTransparent,
                  highlightColor: context.color.profilePageTransparent,
                  hoverColor: context.color.profilePageTransparent,
                  splashRadius: 24,
                  onPressed: () {
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context)) {
                      widget.scaffoldKey.currentState?.openDrawer();
                    }
                  },
                  iconSize: 36,
                  icon: Responsive.isMobile(context) ||
                          Responsive.isTablet(context)
                      ? const Icon(Icons.menu_rounded)
                      : const _AnimatedMenuIcon(),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline_rounded),
                ),
                SizedBox(width: context.screenWidth * 0.08),
                const _UserInfo(
                  userName: "Bobr123",
                  email: "adwdawdwa@gmail.com",
                ),
              ],
            ),
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
        child: _ProfileMenu(
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

class _ProfileMenu extends StatelessWidget {
  final Animation<double>? animation;
  final VoidCallback onCloseItemTap;

  const _ProfileMenu({
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
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 160),
            child: Column(
              children: [
                _MenuItem(
                  onTap: () {},
                  title: context.localizations.signOut,
                  icon: Icons.output_rounded,
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

class _MenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              _isHovered ? widget.color : context.color.profilePageBackground,
        ),
        constraints: const BoxConstraints(minWidth: 140),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
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
    final menuCollapsedState = MenuState.isCollapsed;

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
        progress: _controller,
        size: 36,
      ),
    );
  }
}

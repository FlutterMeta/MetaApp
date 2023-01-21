import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/constants/app_assets.dart';
import 'package:meta_app/presentation/pages/client_profile_page/client_profile_manager.dart';
import 'package:meta_app/presentation/themes/theme.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

class DashboardHeader extends StatefulWidget implements PreferredSizeWidget {
  const DashboardHeader({super.key});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();

  @override
  Size get preferredSize => const Size(double.infinity, 120);
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  void didChangeDependencies() {
    final menu = context.read<ClientProfileManager>();

    if (Responsive.isMobile(context) && menu.isCollapsed) {
      menu.changeCollapsedState();
    }

    context
        .read<ClientProfileManager>()
        .scaffoldKey
        .currentState
        ?.closeDrawer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ClientProfileManager>(builder: (context, menu, _) {
        return Padding(
          padding: menu.isCollapsed
              ? const EdgeInsets.only(right: 10)
              : EdgeInsets.only(
                  left: Responsive.isMobile(context) ? 10 : 60,
                  right: 10,
                ),
          child: Row(
            children: [
              Responsive.isDesktop(context)
                  ? Image.asset(
                      AppAssets.auroraLogo,
                      height: 68,
                    )
                  : const SizedBox(),
              menu.isCollapsed
                  ? const SizedBox()
                  : SizedBox(width: context.screenWidth * 0.02),
              IconButton(
                splashColor: AppColors.transparent,
                highlightColor: AppColors.transparent,
                hoverColor: AppColors.transparent,
                splashRadius: 24,
                onPressed: () {
                  if (Responsive.isMobile(context) ||
                      Responsive.isTablet(context)) {
                    context
                        .read<ClientProfileManager>()
                        .scaffoldKey
                        .currentState
                        ?.openDrawer();
                  }
                },
                iconSize: 36,
                icon:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
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
      }),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String email;
  final String userName;

  const _UserInfo({
    required this.email,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const welcomeStyle = TextStyle(fontSize: 16);
    const emailStyle = TextStyle(fontSize: 12, color: Color(0xFF464A53));
    const userNameStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Row(
      children: [
        if (Responsive.isDesktop(context)) ...[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(context.localizations.welcome, style: welcomeStyle),
                  Text(userName, style: userNameStyle),
                ],
              ),
              const SizedBox(height: 4),
              Text(email, style: emailStyle),
            ],
          ),
        ] else
          Text(userName, style: userNameStyle),
        Icon(
          Icons.account_circle,
          size: Responsive.isDesktop(context) ? 80 : 50,
          color: context.color.partnersCardBackground,
        ),
      ],
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
    final menu = context.read<ClientProfileManager>();
    if (menu.isCollapsed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    menu.changeCollapsedState();
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

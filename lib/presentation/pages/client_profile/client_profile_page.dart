import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/bots_tab.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/pages/client_profile/sections/side_menu_section.dart';
import 'package:meta_app/presentation/widgets/profile_header/profile_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class ClientProfilePage extends StatelessWidget {
  ClientProfilePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> _getScaffoldKey() => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader.client(scaffoldKey: _getScaffoldKey),
      drawer: const SideMenuSection(),
      backgroundColor: context.color.profilePageBackground,
      key: _scaffoldKey,
      body: ValueListenableBuilder(
        valueListenable: MenuController.isCollapsed,
        builder: (context, isCollapsed, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isCollapsed ? 104 : context.screenWidth * 0.18,
                  child: const SideMenuSection(),
                ),
              const Expanded(
                flex: 5,
                child: _TabsBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TabsBox extends StatelessWidget {
  const _TabsBox({Key? key}) : super(key: key);

  static final _tabs = [
    const DashboardTab(),
    const BotsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MenuController.tabIndex,
      builder: (context, index, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _tabs[index],
        );
      },
    );
  }
}

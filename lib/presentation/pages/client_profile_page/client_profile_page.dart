import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile_page/menu_controller.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/bots_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/transaction_tab.dart';
import 'package:meta_app/presentation/widgets/profile_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader(scaffoldKey: _scaffoldKey),
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
  static const _tabs = [DashboardTab(), BotsTab(), TransactionTab()];

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

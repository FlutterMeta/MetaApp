import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile_page/menu_state.dart';
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
      backgroundColor: context.color.clientPageBackground,
      key: _scaffoldKey,
      body: ValueListenableBuilder(
        valueListenable: MenuState.isCollapsed,
        builder: (context, isCollapsed, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context) && !isCollapsed) ...[
                const Expanded(child: SideMenuSection()),
              ] else if (Responsive.isDesktop(context) && isCollapsed) ...[
                const SizedBox(width: 104, child: SideMenuSection()),
              ],
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

  Widget getTab(int index) {
    const tabs = [
      DashboardTab(),
      BotsTab(),
      TransactionTab(),
    ];
    return tabs[index];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MenuState.tabIndex,
      builder: (context, tabIndex, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: getTab(tabIndex),
        );
      },
    );
  }
}

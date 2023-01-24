import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile_page/client_profile_manager.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/bots_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/transaction_tab.dart';
import 'package:meta_app/presentation/widgets/dashboard_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardHeader(),
      drawer: const SideMenuSection(),
      backgroundColor: context.color.background,
      key: context.read<ClientProfileManager>().scaffoldKey,
      body: Consumer<ClientProfileManager>(
        builder: (context, menu, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context) && !menu.isCollapsed) ...[
                const Expanded(child: SideMenuSection()),
              ] else if (Responsive.isDesktop(context) && menu.isCollapsed) ...[
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

  Widget showTab(int index) {
    switch (index) {
      case 2:
        return const DashboardTab();
      case 1:
        return const BotsTab();
      case 0:
        return const TransactionTab();
      default:
        return const DashboardTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProfileManager>(
      builder: (context, tabManager, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: showTab(tabManager.currentIndex),
        );
      },
    );
  }
}

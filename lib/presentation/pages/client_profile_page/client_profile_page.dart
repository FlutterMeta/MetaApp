import 'package:flutter/material.dart';
import 'package:meta_app/presentation/pages/client_profile_page/client_profile_manager.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/bots_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/widgets/dashboard_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      key: context.read<ClientProfileManager>().scaffoldKey,
      appBar: const DashboardHeader(),
      drawer: const SideMenuSection(),
      body: SafeArea(
        child: Consumer<ClientProfileManager>(
          builder: (context, pageManager, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context) &&
                    !pageManager.isCollapsed) ...[
                  const Expanded(child: SideMenuSection()),
                ] else if (Responsive.isDesktop(context) &&
                    pageManager.isCollapsed) ...[
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
      ),
    );
  }
}

class _TabsBox extends StatelessWidget {
  const _TabsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProfileManager>(
      builder: (context, tabManager, child) {
        return AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          duration: const Duration(milliseconds: 500),
          child: tabManager.currentIndex == 0
              ? const DashboardTab()
              : const BotsTab(),
        );
      },
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_app/presentation/pages/client_profile_page/client_tabs_manager.dart';
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
      appBar: const DashboardHeader(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenuSection(),
              ),
            const Expanded(
              flex: 5,
              child: _TabsBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabsBox extends StatelessWidget {
  const _TabsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientTabsManager>(
      builder: (context, tabManager, child) {
        return AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          duration: const Duration(seconds: 1),
          child: tabManager.currentIndex == 1
              ? const DashboardTab()
              : const BotsTab(),
        );
      },
    );
  }
}

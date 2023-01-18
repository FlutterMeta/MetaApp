import 'package:flutter/material.dart';
import 'package:meta_app/presentation/pages/client_dashboard_page/sections/dashboard_section.dart';
import 'package:meta_app/presentation/pages/client_dashboard_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/widgets/dashboard_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class ClientDashboardPage extends StatelessWidget {
  const ClientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 120),
        child: DashboardHeader(),
      ),
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
              child: DashboardSection(),
            ),
          ],
        ),
      ),
    );
  }
}

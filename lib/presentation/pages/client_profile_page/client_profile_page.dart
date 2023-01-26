import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_cubit.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_state.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/bots_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/dashboard_tab.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/side_menu_section.dart';
import 'package:meta_app/presentation/pages/client_profile_page/sections/transaction_tab.dart';
import 'package:meta_app/presentation/widgets/profile_header.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileHeader(),
      drawer: const SideMenuSection(),
      backgroundColor: context.color.background,
      key: context.read<MenuCubit>().state.scaffoldKey,
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, menu) {
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
      case 0:
        return const DashboardTab();
      case 1:
        return const BotsTab();
      case 2:
        return const TransactionTab();
      default:
        return const DashboardTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, menu) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: showTab(menu.tabIndex),
        );
      },
    );
  }
}

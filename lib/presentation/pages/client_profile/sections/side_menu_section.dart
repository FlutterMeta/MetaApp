import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/user.dart';
import 'package:meta_app/presentation/navigation/app_router.gr.dart';
import 'package:meta_app/presentation/pages/client_profile/client_menu_controller.dart';
import 'package:meta_app/presentation/redux/app_state.dart';
import 'package:meta_app/presentation/redux/authorization/actions/logout_user_action.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class SideMenuSection extends StatefulWidget {
  const SideMenuSection({Key? key}) : super(key: key);

  @override
  State<SideMenuSection> createState() => _SideMenuSectionState();
}

class _SideMenuSectionState extends State<SideMenuSection> {
  void _onLabelTap(int index) => ClientMenuController.tabIndex.value = index;
  void _logoutAction(BuildContext context) {
    StoreProvider.of<AppState>(context, null).dispatch(LogoutUserAction());
  }

  List<Widget> _adminItems(BuildContext context) {
    return [
      _DrawerListTile(
        onTap: (index) => context.router.push(const DashboardRoute()),
        index: -1, // isn't reachable, just to make unselected
        label: context.localizations.allUsersManagement,
        icon: Icons.group_sharp,
      ),
      _DrawerListTile(
        onTap: (index) => context.router.push(const AdminBlogRoute()),
        index: -1, // isn't reachable, just to make unselected
        label: context.localizations.updateBlog,
        icon: Icons.table_chart_rounded,
      ),
      _DrawerListTile(
        onTap: (index) => context.router.push(const TransactionsRoute()),
        index: -1, // isn't reachable, just to make unselected
        label: context.localizations.allTransactions,
        icon: Icons.list_alt,
      ),
      _DrawerListTile(
        onTap: (index) => context.router.push(const FinancialIndicatorsRoute()),
        index: -1, // isn't reachable, just to make unselected
        label: context.localizations.financialResults,
        icon: Icons.pie_chart_rounded,
      ),
      _DrawerListTile(
        index: -1, // isn't reachable, just to make unselected
        onTap: (index) =>
            context.router.push(const PaymentSystemOverviewRoute()),
        label: context.localizations.requisites,
        icon: Icons.account_balance_wallet_rounded,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ClientMenuController.isCollapsed,
      builder: (context, isCollapsed, child) {
        return Drawer(
          backgroundColor: isCollapsed
              ? context.color.profilePageSecondary
              : context.color.profilePageBackground,
          elevation: 0,
          // make rounded only right side
          shape: isCollapsed
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
              valueListenable: ClientMenuController.tabIndex,
              builder: (context, index, child) {
                return StoreConnector<AppState, User?>(
                    converter: (store) => store.state.currentUser,
                    builder: (context, user) {
                      return Column(
                        children: [
                          _DrawerListTile(
                            index: 0,
                            currentIndex: index,
                            icon: Icons.account_circle,
                            label: context.localizations.account,
                            onTap: _onLabelTap,
                          ),
                          _DrawerListTile(
                            index: 1,
                            currentIndex: index,
                            icon: Icons.adb_outlined,
                            label: context.localizations.bots,
                            onTap: _onLabelTap,
                          ),
                          if (user?.role == UserRole.admin ||
                              user?.role == UserRole.adam) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                  color: context.text.profileBotsDefault.color),
                            ),
                            ..._adminItems(context),
                          ],
                          const Spacer(),
                          _DrawerListTile(
                            index: 2,
                            currentIndex: index,
                            icon: Icons.logout,
                            label: context.localizations.signOut,
                            onTap: (index) {
                              Navigator.pop(context);
                              _logoutAction(context);
                              context.router.pushNamed('/home');
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }
}

class _DrawerListTile extends StatefulWidget {
  final int? index;
  final int? currentIndex;
  final String label;
  final IconData icon;
  final void Function(int index) onTap;

  const _DrawerListTile({
    required this.label,
    required this.onTap,
    this.index,
    this.currentIndex,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<_DrawerListTile> createState() => __DrawerListTileState();
}

class __DrawerListTileState extends State<_DrawerListTile> {
  bool get _isSelected => widget.index == widget.currentIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ClientMenuController.isCollapsed,
      builder: (context, isCollapsed, child) {
        return InkWell(
          onTap: () {
            widget.onTap(widget.index ?? 0);
            if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
              Navigator.pop(context);
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: _isSelected && isCollapsed
                      ? context.color.profilePageBackground
                      : context.color.profilePageTransparent,
                  child: Icon(
                    widget.icon,
                    size: 34,
                    color: _isSelected
                        ? context.color.dashboardSideMenuSelectedItem
                        : (isCollapsed
                            ? context.color.profilePagePrimaryVariant
                            : context.color.dashboardSideMenuUnselectedItem),
                  ),
                ),
                SizedBox(width: isCollapsed ? 0 : 8),
                if (isCollapsed)
                  const SizedBox()
                else
                  Flexible(
                    child: Text(
                      widget.label,
                      style: _isSelected
                          ? context.text.dashboardSideMenuSelectedLable
                          : context.text.dashboardSideMenuUnselectedLable,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

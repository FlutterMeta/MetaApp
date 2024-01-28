import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/data/models/registration.dart';
import 'package:meta_app/presentation/redux/authorization/actions/logout_user_action.dart';
import 'package:meta_app/presentation/widgets/colored_button.dart';
import 'dart:html' as html;
import '../../../core/global.dart';
import '../../../core/mixins/message_overlay.dart';
import '../../../data/models/mock_wallets.dart';
import '../../navigation/app_router.gr.dart';
import '../../redux/app_state.dart';
import 'package:meta_app/core/mixins/validator.dart';
part 'menu_components/create_admin_menu_item.dart';
part 'menu_components/edit_requisites_menu_item.dart';
part 'menu_components/menu_item.dart';
part 'menu_components/admin_dialog.dart';
part 'menu_components/labeled_field.dart';

class Menu extends StatefulWidget {
  final List<Widget> Function(BuildContext context, VoidCallback closeOnTap)
      items;
  final VoidCallback onCloseItemTap;

  const Menu({
    required this.items,
    required this.onCloseItemTap,
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _logoutAction(BuildContext context) {
    StoreProvider.of<AppState>(context, null).dispatch(LogoutUserAction());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.color.profilePageBackground,
        boxShadow: [
          BoxShadow(
            color: context.color.profilePagePrimary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.items(context, widget.onCloseItemTap),
            _MenuItem(
              onTap: () {
                html.window.localStorage["token"] = "";
                _logoutAction(context);
                context.router.push(HomeRoute());
              },
              title: context.localizations.signOut,
              icon: Icons.logout_rounded,
              color: context.color.profilePageError,
            ),
            _MenuItem(
              onTap: () => widget.onCloseItemTap(),
              title: context.localizations.closeMenu,
              icon: Icons.close_rounded,
              color: context.color.greyish,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends Menu {
  static List<Widget> _adminMenuItems(
    BuildContext context,
    VoidCallback closeOnTap,
  ) {
    return [
      _MenuItem(
        onTap: () => context.router.push(ClientProfileRoute()),
        title: context.localizations.profile,
        icon: Icons.person_outline_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(AdminBlogRoute()),
        title: context.localizations.updateBlog,
        icon: Icons.table_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const TransactionsRoute()),
        title: context.localizations.allTransactions,
        icon: Icons.list_alt,
        color: context.color.profilePagePrimaryVariant,
      ),
      _MenuItem(
        onTap: () => context.router.push(const FinancialIndicatorsRoute()),
        title: context.localizations.financialResults,
        icon: Icons.pie_chart_rounded,
        color: context.color.profilePagePrimaryVariant,
      ),
      _EditRequisitesMenuItem(closeMenuCallback: closeOnTap),
      _CreateAdminMenuItem(closeMenuCallback: closeOnTap),
    ];
  }

  const ProfileMenu({
    required List<Widget> Function(BuildContext, VoidCallback) items,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) : super(
          items: items,
          onCloseItemTap: onCloseItemTap,
          key: key,
        );

  factory ProfileMenu.client({
    Animation<double>? animation,
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: (_, __) => [],
        onCloseItemTap: onCloseItemTap,
        key: key,
      );

  factory ProfileMenu.admin({
    required VoidCallback onCloseItemTap,
    Key? key,
  }) =>
      ProfileMenu(
        items: _adminMenuItems,
        onCloseItemTap: onCloseItemTap,
        key: key,
      );
}

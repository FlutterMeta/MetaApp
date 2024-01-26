import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile/menu_controller.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';

class SideMenuSection extends StatefulWidget {
  const SideMenuSection({Key? key}) : super(key: key);

  @override
  State<SideMenuSection> createState() => _SideMenuSectionState();
}

class _SideMenuSectionState extends State<SideMenuSection> {
  void _onLabelTap(int index) => MenuController.tabIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MenuController.isCollapsed,
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
              valueListenable: MenuController.tabIndex,
              builder: (context, index, child) {
                return ListView(
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
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _DrawerListTile extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String label;
  final IconData icon;
  final void Function(int index) onTap;

  const _DrawerListTile({
    required this.label,
    required this.onTap,
    required this.index,
    required this.currentIndex,
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
      valueListenable: MenuController.isCollapsed,
      builder: (context, isCollapsed, child) {
        return InkWell(
          onTap: () {
            widget.onTap(widget.index);
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
                isCollapsed
                    ? const SizedBox()
                    : Text(
                        widget.label,
                        style: _isSelected
                            ? context.text.dashboardSideMenuSelectedLable
                            : context.text.dashboardSideMenuUnselectedLable,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

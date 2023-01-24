import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';
import 'package:meta_app/presentation/pages/client_profile_page/client_profile_manager.dart';
import 'package:meta_app/presentation/widgets/responsive.dart';
import 'package:provider/provider.dart';

class SideMenuSection extends StatefulWidget {
  const SideMenuSection({Key? key}) : super(key: key);

  @override
  State<SideMenuSection> createState() => _SideMenuSectionState();
}

class _SideMenuSectionState extends State<SideMenuSection> {
  int _currentIndex = 0;

  void _onLabelTap(int index) {
    Provider.of<ClientProfileManager>(context, listen: false)
        .changeIndex(index);
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex =
        Provider.of<ClientProfileManager>(context, listen: false).currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProfileManager>(
      builder: (context, menu, child) {
        return Drawer(
          backgroundColor: menu.isCollapsed
              ? context.color.primary
              : context.color.background,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                _DrawerListTile(
                  index: 0,
                  currentIndex: _currentIndex,
                  icon: Icons.account_circle,
                  label: context.localizations.account,
                  onTap: _onLabelTap,
                ),
                _DrawerListTile(
                  index: 1,
                  currentIndex: _currentIndex,
                  icon: Icons.adb_outlined,
                  label: context.localizations.bots,
                  onTap: _onLabelTap,
                ),
              ],
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
    return Consumer<ClientProfileManager>(
      builder: (context, menu, child) {
        return InkWell(
          onTap: () {
            widget.onTap(widget.index);
            if (Responsive.isMobile(context)) Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: _isSelected && menu.isCollapsed
                      ? context.color.background
                      : context.color.transparent,
                  child: Icon(
                    widget.icon,
                    size: 34,
                    color: _isSelected
                        ? context.color.dashboardSideMenuSelectedItem
                        : (menu.isCollapsed
                            ? context.color.primaryVariant
                            : context.color.dashboardSideMenuUnselectedItem),
                  ),
                ),
                SizedBox(width: menu.isCollapsed ? 0 : 8),
                menu.isCollapsed
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

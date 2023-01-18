import 'package:flutter/material.dart';
import 'package:meta_app/core/utils/extensions/build_context_ext.dart';

class SideMenuSection extends StatefulWidget {
  const SideMenuSection({Key? key}) : super(key: key);

  @override
  State<SideMenuSection> createState() => _SideMenuSectionState();
}

class _SideMenuSectionState extends State<SideMenuSection> {
  int _currentIndex = 0;
  void _onLabelTap(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _DrawerListTile(
              index: 0,
              currentIndex: _currentIndex,
              icon: Icons.account_circle,
              label: "Account",
              onTap: _onLabelTap,
            ),
            _DrawerListTile(
              index: 1,
              currentIndex: _currentIndex,
              icon: Icons.adb_outlined,
              label: "Bots",
              onTap: _onLabelTap,
            ),
          ],
        ),
      ),
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
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  State<_DrawerListTile> createState() => __DrawerListTileState();
}

class __DrawerListTileState extends State<_DrawerListTile> {
  bool get _isSelected => widget.index == widget.currentIndex;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => widget.onTap(widget.index),
      leading: Icon(
        widget.icon,
        size: 34,
        color: _isSelected
            ? context.color.dashboardSideMenuSelectedItem
            : context.color.dashboardSideMenuUnselectedItem,
      ),
      title: Text(
        widget.label,
        style: _isSelected
            ? context.text.dashboardSideMenuSelectedLable
            : context.text.dashboardSideMenuUnselectedLable,
      ),
    );
  }
}
